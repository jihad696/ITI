from odoo import models, fields, api, _
from odoo.exceptions import ValidationError, UserError
from datetime import date
from dateutil.relativedelta import relativedelta
import re


class HmsPatient(models.Model):
    _name = 'hms.patient'
    _description = 'Hospital Patient'

    first_name = fields.Char(string='First Name', required=True)
    last_name = fields.Char(string='Last Name', required=True)
    birth_date = fields.Date(string='Birth Date')
    history = fields.Html(string='History')
    cr_ratio = fields.Float(string='CR Ratio')
    blood_type = fields.Selection([
        ('a', 'A'),
        ('b', 'B'),
        ('ab', 'AB'),
        ('o', 'O'),
    ], string='Blood Type')
    pcr = fields.Boolean(string='PCR')
    image = fields.Binary(string='Image')
    address = fields.Text(string='Address')
    age = fields.Integer(string='Age', compute='_compute_age', store=True)
    email = fields.Char(string='Email')

    department_id = fields.Many2one('hms.department', string='Department')
    department_capacity = fields.Integer(related='department_id.capacity', string='Department Capacity')
    doctor_ids = fields.Many2many('hms.doctor', string='Doctors')

    state = fields.Selection([
        ('undetermined', 'Undetermined'),
        ('good', 'Good'),
        ('fair', 'Fair'),
        ('serious', 'Serious'),
    ], string='State', default='undetermined')

    log_ids = fields.One2many('hms.patient.log', 'patient_id', string='Logs')

    _sql_constraints = [
        ('unique_email', 'UNIQUE(email)', 'Email must be unique!')
    ]

    @api.model_create_multi
    def create(self, vals_list):
        for vals in vals_list:
            if 'email' in vals and vals['email']:
                self._validate_email(vals['email'])
        return super(HmsPatient, self).create(vals_list)

    def write(self, vals):
        # Check if state is changed
        if 'state' in vals and vals['state'] != self.state:
            new_state = dict(self._fields['state'].selection).get(vals['state'])
            self.env['hms.patient.log'].create({
                'patient_id': self.id,
                'description': f'State changed to {new_state}'
            })

        # Email validation
        if 'email' in vals and vals['email']:
            self._validate_email(vals['email'])

        res = super(HmsPatient, self).write(vals)
        return res

    def _validate_email(self, email):
        if not re.match(r"[^@]+@[^@]+\.[^@]+", email):
            raise ValidationError(_("Invalid email format!"))

    @api.depends('birth_date')
    def _compute_age(self):
        for patient in self:
            if patient.birth_date:
                patient.age = relativedelta(date.today(), patient.birth_date).years
            else:
                patient.age = 0

    @api.onchange('age')
    def _onchange_age(self):
        if self.age and self.age < 30:
            self.pcr = True
            return {
                'warning': {
                    'title': _('PCR Checked'),
                    'message': _('PCR has been automatically checked as age is less than 30')
                }
            }

    @api.onchange('department_id')
    def _onchange_department_id(self):
        if self.department_id:
            if not self.department_id.is_opened:
                raise UserError(_("You cannot choose a closed department"))

    @api.constrains('pcr', 'cr_ratio')
    def _check_cr_ratio(self):
        for record in self:
            if record.pcr and not record.cr_ratio:
                raise ValidationError(_("CR Ratio is mandatory when PCR is checked"))
from odoo import models, fields, api, _
from odoo.exceptions import ValidationError


class ResPartner(models.Model):
    _inherit = 'res.partner'

    related_patient_id = fields.Many2one('hms.patient', string='Related Patient')

    @api.constrains('related_patient_id', 'email')
    def _check_patient_email(self):
        for partner in self:
            if partner.related_patient_id and partner.email:
          
                patient = self.env['hms.patient'].search([
                    ('email', '=', partner.email),
                    ('id', '!=', partner.related_patient_id.id)
                ], limit=1)

                if patient:
                    raise ValidationError(_("This email already exists in another patient record!"))

    @api.constrains('vat')
    def _check_vat_required(self):
        for partner in self:
            if partner.is_company or partner.parent_id:
                if not partner.vat:
                    raise ValidationError(_("Tax ID is mandatory for customers"))

    def unlink(self):
        for partner in self:
            if partner.related_patient_id:
                raise ValidationError(_("You cannot delete a customer linked to a patient!"))
        return super(ResPartner, self).unlink()

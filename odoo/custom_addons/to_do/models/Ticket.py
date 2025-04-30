from odoo import fields,models

class TodoTicket(models.Model):
    _name = 'lr.ticket'
    _description = 'ToDo Ticket'

    name = fields.Char()
    number = fields.Integer()
    tag = fields.Char()
    state = fields.Selection([
        ('new', 'New'),
        ('doing', 'Doing'),
        ('done', 'Done'),
    ],)
    file = fields.Binary()
    assign_to = fields.Many2one('res.users')
    description = fields.Text()

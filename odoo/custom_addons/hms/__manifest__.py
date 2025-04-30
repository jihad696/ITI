{
    'name': 'Hospital Management System',
    'version': '1.0',
    'summary': 'Manage hospital, patients, doctors, and departments',
    'description': """
        Hospital Management System for managing:
        - Patients
        - Doctors
        - Departments
        - Patient Logs
    """,
    'category': 'Healthcare',
    'author': 'Odoo Developer',
    'depends': ['base', 'crm'],
    'data': [
        'security/ir.model.access.csv',
        'views/hms_department_views.xml',
        'views/hms_doctor_views.xml',
        'views/hms_patient_views.xml',
        'views/crm_inherit_views.xml',
        'views/hms_menu.xml',
    ],
    'application': True,
    'installable': True,
    'license': 'LGPL-3',
}
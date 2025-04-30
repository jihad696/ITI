{
    'name': 'Hospital Management System',
    'version': '1.0',
    'summary': 'Manage hospital patients and their data',
    'description': """
        Hospital Management System to track patient information,
        medical history, and other health-related data.
    """,
    'author': 'Your Name',
    'website': 'https://www.yourwebsite.com',
    'category': 'Healthcare',
    'depends': ['base', 'web'],
    'data': [
        'security/ir.model.access.csv',
        'views/patient_views.xml',
    ],
    'demo': [],
    'installable': True,
    'application': True,
    'auto_install': False,
    'license': 'LGPL-3',
}
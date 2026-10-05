project = "FHIR Sandbox"
author = "Copilot"

extensions = ["sphinx_needs"]

source_suffix = ".rst"
master_doc = "index"

needs_id_required = True
needs_id_regex = r"^[A-Z]+-[A-Z]+-\d{3}$"
needs_role_need_template = "{{ id }}"
needs_default_layout = "clean"
needs_default_style = "node"
needs_types = [
    {
        "directive": "req",
        "title": "Requirement",
        "prefix": "REQ_",
        "color": "#2F6BFF",
        "style": "node",
    },
    {
        "directive": "evidence",
        "title": "Data",
        "prefix": "DATA_",
        "color": "#2E8B57",
        "style": "node",
    },
]

html_theme = "alabaster"
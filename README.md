# fhir-sandbox

Small docs-as-code showcase for one tiny FHIR feature with bidirectional traceability.

## Working idea

The first showcase will be a minimal ePI dosage example:

- one FHIR `Composition` resource
- one ePI section 4.2 dosage statement
- one requirement set in Sphinx Needs
- one traceability loop between requirement text and imported FHIR example data

## Setup pieces

- `docs/source/` for the Sphinx documentation tree
- `docs/source/data/` for imported FHIR example data
- `fsh/` for the FSH source reference material
- `.github/agents/sdd-dspi.agent.md` for the SDD development agent

## Build the docs

Install the docs dependencies with `pip install -r requirements.txt`, then build the docs from `docs/source/`.

### Optional virtual environment

Create and activate a Python virtual environment (recommended):

```powershell
# Create the venv (one time)
python -m venv .venv

# Activate it
.\.venv\Scripts\Activate.ps1

# Install dependencies
pip install -r requirements.txt

# When done, deactivate with
deactivate
```

The `.venv` folder is excluded from git (see `.gitignore`).

### Building and viewing

Run `docs/open.ps1` to rebuild the docs and open the generated `index.html` in your browser.

Run `docs/open.ps1 -Clean` if you want a full rebuild before the browser opens.

Run `docs/build.ps1` to build the Sphinx site into `docs/_build/html`.

Run `docs/build.ps1 -Clean` to force a full Sphinx rebuild and clear the HTML output first.

Run `scripts/validation/check-epi-proof.ps1` to verify the FSH source and JSON evidence still match.

The FSH source is currently kept as a static reference and may become a build step in a future iteration.

Generated outputs:

- `docs/source/data/epi-dosage-example.json` for the evidence copy used by the docs
- `docs/_build/html/` for the rendered Sphinx site

## Next step

If this project idea is acceptable, the next content layer will be the actual Sphinx pages, the need IDs, and the linked example data.
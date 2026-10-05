Project Idea
=============

The showcase uses one very small FHIR feature: an ePI package leaflet section 4.2 dosage and 
administration statement with a short "How to take" line, carried in a FHIR Composition resource.

Premises for the showcase:

- small enough to explain in one docs page
- realistic enough to show a document-centric package leaflet fragment
- supports bidirectional traceability with one requirement and one example payload

Proposed requirement set

.. req:: ePI section 4.2 dosage and administration shall be documented as a FHIR Composition section for one example medicine package leaflet.
   :id: REQ-EPI-001
   :status: draft
   :tags: fhir, epi, dosage, traceability

   The showcase shall include one imported FHIR Composition example that contains one section 4.2 dosage instruction, 
   one short "How to take" line, and one maximum daily dose statement.

   Evidence: :need:`DATA-EPI-001`

How traceability works

Sphinx Needs lets us write structured requirement statements and assign them IDs. Those IDs become the mechanism 
for bidirectional traceability: you can start at a requirement and find its supporting evidence, or start at evidence 
and see which requirement it fulfills. In this showcase, requirements are linked to evidence on the traceability page, 
which means the docs contain not just prose but tracked, connected facts.

Traceability target

- requirement ID: REQ-EPI-001
- data ID: DATA-EPI-001
- source ID: DATA-EPI-002
- imported artifact: :download:`data/epi-dosage-example.json <../data/epi-dosage-example.json>`

The Composition example will also carry the requirement IDs in its metadata tag so the trace can be read in both directions, 
and the FSH source will be the authored form of the same package leaflet slice.
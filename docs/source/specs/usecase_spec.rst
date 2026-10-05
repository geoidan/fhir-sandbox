Use Case Spec
=============

This page defines the smallest showcase use case: a single ePI package leaflet section 4.2 dosage and 
administration statement with a short "How to take" line, authored in FSH and exposed as docs-as-code evidence.

Use case requirement

.. req:: The showcase use case shall be authored in FSH as the source for the example medicine package leaflet dosage and administration section.
   :id: REQ-EPI-002
   :status: draft
   :tags: fhir, fsh, epi, usecase

   The FSH source shall represent the same section 4.2 dosage and administration scenario, 
   including the short "How to take" line, that is documented in the JSON example.

   Evidence: :need:`DATA-EPI-002`

Link to business requirement

- primary requirement: :need:`REQ-EPI-001`
- authored source artifact: :need:`DATA-EPI-002`
- rendered evidence artifact: :need:`DATA-EPI-001`
- FSH source page: :doc:`fsh_source`

Traceability rule

The use case spec shall be traceable in both directions: the spec points to the FSH source, 
and the FSH source carries the requirement IDs in metadata tags.

.. evidence:: ePI dosage example use case spec source
   :id: DATA-EPI-002
   :status: draft
   :tags: fhir, fsh, epi, source, traceability

   The FSH source that authoritatively defines the example medicine dosage and administration section.

   .. literalinclude:: ../../../fsh/input/fsh/epi-dosage-example.fsh
      :language: text
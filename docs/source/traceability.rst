Traceability
============

This page will hold the bidirectional traceability view for the showcase.

Requirement to data

.. list-table::
   :header-rows: 1

   * - Requirement
     - Evidence
     - Notes
   * - :need:`REQ-EPI-001`
     - :need:`DATA-EPI-001`
     - Imported FHIR Composition data for the example medicine dosage and administration showcase
   * - :need:`REQ-EPI-002`
     - :need:`DATA-EPI-002`
     - FSH source for the example medicine dosage and administration use case

Data to requirement

The imported Composition example contains the requirement IDs in ``meta.tag`` so the resource can point back to :need:`REQ-EPI-001` and :need:`REQ-EPI-002`.

The authored FSH source contains the same traceability tags so the use case can point back to :need:`REQ-EPI-002` and :need:`REQ-EPI-001`.

.. evidence:: ePI dosage example payload
   :id: DATA-EPI-001
   :status: draft
   :tags: fhir, epi, dosage, evidence

   The evidence artifact for the first showcase.

   .. literalinclude:: data/epi-dosage-example.json
      :language: json

FSH source reference
--------------------

The authoring source for the example medicine dosage and administration use case is defined in :need:`DATA-EPI-002` and shown below as a static reference.

.. literalinclude:: ../../fsh/input/fsh/epi-dosage-example.fsh
  :language: text
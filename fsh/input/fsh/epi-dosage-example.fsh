// REQ-EPI-001 ePI section 4.2 dosage shall be documented as a FHIR Composition section for one example medicine package leaflet.
// REQ-EPI-002 The showcase use case shall be authored in FSH as the source for the example medicine package leaflet dosage section.

Instance: EpiDosageExample
InstanceOf: Composition
Usage: #example
Title: "Example medicine package leaflet showcase"
Description: "FHIR Shorthand source for the ePI section 4.2 dosage showcase."

* meta.tag[+].system = "urn:traceability:need"
* meta.tag[=].code = #REQ-EPI-001
* meta.tag[=].display = "ePI dosage requirement"
* meta.tag[+].system = "urn:traceability:need"
* meta.tag[=].code = #REQ-EPI-002
* meta.tag[=].display = "ePI dosage FSH source requirement"

* status = #final
* type.text = "Example medicine package leaflet"
* date = "2026-10-05"
* title = "Example medicine package leaflet - Dosage and administration"

* section[+].title = "4.2 Dosage and administration"
* section[=].code.text = "Section 4.2"
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><strong>Dosage:</strong> Adults take 1 tablet twice daily after meals.</p><p><strong>How to take:</strong> Swallow with water and take at regular intervals.</p><p><strong>Maximum daily dose:</strong> Do not exceed 2 tablets per day unless prescribed.</p></div>"
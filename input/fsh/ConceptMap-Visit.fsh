Instance:       FHIR-to-DICOM-Visit
InstanceOf:     ConceptMap
Title:          "ConceptMap - Populating DICOM Scheduled Procedure Step from FHIR"
Usage:          #definition

* id =  "fhir-to-dicom-visit"
* name = "FHIRToDICOMVisit"
* description = "Populating DICOM Visit from FHIR"
* status = #draft
* experimental = true
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/imagemgt"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension[0].valueCode = #ii
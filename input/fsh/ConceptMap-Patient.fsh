Instance:       FHIR-to-DICOM-Patient
InstanceOf:     ConceptMap
Title:          "ConceptMap - Populating DICOM Patient from FHIR"
Usage:          #definition

* id =  "fhir-to-dicom-patient"
* name = "FHIRToDICOMPatient"
* description = "Populating DICOM Patient from FHIR"
* status = #draft
* experimental = true
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/imagemgt"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension[0].valueCode = #ii
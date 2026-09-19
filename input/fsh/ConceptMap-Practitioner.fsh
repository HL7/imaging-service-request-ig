Instance:       FHIR-to-DICOM-Practitioner
InstanceOf:     ConceptMap
Title:          "ConceptMap - Populating DICOM Referring / Requesting Physician from FHIR"
Usage:          #definition

* id =  "fhir-to-dicom-practitioner"
* name = "FHIRToDICOMPractitioner"
* description = "Populating DICOM Referring Physician and Requesting Physician elements from FHIR Practitioner / PractitionerRole"
* status = #draft
* experimental = true
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/imagemgt"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension[0].valueCode = #ii

* additionalAttribute[0]
  * code = #ResourceType
  * description = "FHIR Resource Reference Type"
  * uri = "http://hl7.org/fhir/ValueSet/resource-types"
  * type = #code

* group[0].element[0]
  * code = #imaging-practitioner
  * target[0]
    * relationship = #source-is-broader-than-target
    * code = #ReferringPhysicianName
    * display = "Referring Physician's Name (0008,0090)"
  * target[1]
    * relationship = #source-is-broader-than-target
    * code = #RequestingPhysician
    * display = "Requesting Physician (0032,1032)"

* group[0].element[1]
  * code = #imaging-practitioner.identifier
  * target[0]
    * relationship = #equivalent
    * code = #ReferringPhysicianIdentificationSequence
    * display = "Referring Physician Identification Sequence (0008,0096)"
  * target[1]
    * relationship = #equivalent
    * code = #RequestingPhysicianIdentificationSequence
    * display = "Requesting Physician Identification Sequence (0032,1031)"

* group[0].element[2]
  * code = #imaging-practitioner.name
  * target[0]
    * relationship = #equivalent
    * code = #ReferringPhysicianName
    * display = "Referring Physician's Name (0008,0090)"
  * target[1]
    * relationship = #equivalent
    * code = #NameOfPhysiciansReadingStudy
    * display = "Name of Physician(s) Reading Study (0008,1060)"

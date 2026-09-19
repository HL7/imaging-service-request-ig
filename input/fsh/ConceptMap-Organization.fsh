Instance:       FHIR-to-DICOM-Organization
InstanceOf:     ConceptMap
Title:          "ConceptMap - Populating DICOM Requesting Service / Entering Organization from FHIR"
Usage:          #definition

* id =  "fhir-to-dicom-organization"
* name = "FHIRToDICOMOrganization"
* description = "Populating DICOM Requesting Service and Entering Organization elements from FHIR Organization"
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
  * code = #imaging-organization
  * target[0]
    * relationship = #source-is-broader-than-target
    * code = #RequestingService
    * display = "Requesting Service (0032,1033)"
  * target[1]
    * relationship = #source-is-broader-than-target
    * code = #EnteringOrganization
    * display = "Entering Organization (via ORC-17 / OBR-17 mapping)"

* group[0].element[1]
  * code = #imaging-organization.identifier
  * target[0]
    * relationship = #equivalent
    * code = #RequestingServiceCodeSequence
    * display = "Requesting Service Code Sequence (0032,1034)"

* group[0].element[2]
  * code = #imaging-organization.name
  * target[0]
    * relationship = #equivalent
    * code = #RequestingService
    * display = "Requesting Service (0032,1033)"

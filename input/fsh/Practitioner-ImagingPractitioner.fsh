Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingPractitionerProfile
Parent:         Practitioner
Id:             imaging-practitioner
Title:          "Practitioner - DICOM MWL Referring / Requesting Physician Mapping"
Description:    "DICOM MWL Referring Physician / Requesting Physician Mapping to Practitioner"

* ^abstract = false
* insert DICOMMWLStructureDefinitionContent

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Practitioner Identifiers"

* name 1..1
* name ^short = "Referring / Requesting Physician Name"

Instance: ImagingPractitioner-Example
InstanceOf: ImagingPractitionerProfile
Usage: #example
Description: "An example of the Practitioner resource included in a MWL response, representing the referring or requesting physician."

* id = "example-imaging-practitioner"

* identifier
  * system = "http://goodhealth.org/practitioner"
  * value = "PRACT12345"
* name
  * family = "WELBY"
  * given = "MARCUS"

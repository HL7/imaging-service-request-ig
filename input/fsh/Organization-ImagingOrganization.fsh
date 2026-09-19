Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingOrganizationProfile
Parent:         Organization
Id:             imaging-organization
Title:          "Organization - DICOM MWL Requesting Service / Entering Organization Mapping"
Description:    "DICOM MWL Requesting Service and Entering Organization Mapping to Organization"

* ^abstract = false
* insert DICOMMWLStructureDefinitionContent

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Organization Identifiers"

* name 1..1
* name ^short = "Requesting Service / Entering Organization Name"

Instance: ImagingOrganization-Example
InstanceOf: ImagingOrganizationProfile
Usage: #example
Description: "An example of the Organization resource included in a MWL response, representing the requesting service or entering organization."

* id = "example-imaging-organization"

* identifier
  * system = "http://goodhealth.org/organization"
  * value = "ORG12345"
* name = "Good Health Radiology"

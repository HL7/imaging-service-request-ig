Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ScheduledStationProfile
Parent:         Device
Id:             scheduled-station
Title:          "Device - DICOM Scheduled Station Mapping"
Description:    "DICOM MWL Scheduled Station Mapping to Device"

* ^abstract = false
* insert DICOMMWLStructureDefinitionContent

* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "type"
* name ^slicing.rules = #open
* name ^slicing.ordered = false
* name ^slicing.description = "AE Title of the Scheduled Station"

* name contains aeTitle 1..1
* name[aeTitle] ^short = "AE Title"
* name[aeTitle] ^definition = "AE Title of the Scheduled Station"
* name[aeTitle].value 1..1
* name[aeTitle].type = #registered-name

Instance: ScheduledStation-Example
InstanceOf: ScheduledStationProfile
Usage: #example
Description: "An example of the Device resource included in a MWL response."

* id = "example-scheduled-station"

* name[aeTitle]
  * value = "CT-RAD-01"
  * type = #registered-name
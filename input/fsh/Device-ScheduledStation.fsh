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

* ^abstract = true
* insert DICOMMWLStructureDefinitionContent
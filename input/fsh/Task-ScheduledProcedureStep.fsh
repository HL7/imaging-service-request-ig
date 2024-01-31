Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingScheduledProcedureStepProfile
Parent:         Task
Id:             imaging-scheduled-procedure-step
Title:          "Task - DICOM MWL Scheduled Procedure Step Mapping"
Description:    "DICOM MWL Scheduled Procedure Step Mapping to Task"

* ^abstract = true
* insert DICOMMWLStructureDefinitionContent


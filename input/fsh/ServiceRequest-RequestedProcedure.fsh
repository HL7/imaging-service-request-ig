Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingRequestedProcedureProfile
Parent:         ServiceRequest
Id:             imaging-requested-procedure
Title:          "ServiceRequest - DICOM MWL Requested Procedure Mapping"
Description:    "DICOM MWL Requested Procedure Mapping to ServiceRequest"

* ^abstract = true
* insert DICOMMWLStructureDefinitionContent


Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingVisitProfile
Parent:         Encounter
Id:             imaging-visit
Title:          "Encounter - DICOM MWL Visit Mapping"
Description:    "DICOM MWL Visit Mapping to Encounter"

* ^abstract = true
* insert DICOMMWLStructureDefinitionContent

// Associated Patient
//* subject contains imagingPatientRef 1..1
* subject only Reference(ImagingPatientProfile)
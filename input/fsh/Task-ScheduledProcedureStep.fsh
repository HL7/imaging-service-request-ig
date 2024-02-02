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

// Associated RequestedProcedure
* basedOn ^slicing.discriminator.type = #type
* basedOn ^slicing.discriminator.path = "reference"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Requested Procedure"

* basedOn contains requestedProcedureRef 1..1
* basedOn[requestedProcedureRef] only Reference(ImagingRequestedProcedureProfile)

// Associated Patient
* for only Reference(ImagingPatientProfile)

// Associated Visit
* encounter only Reference(ImagingVisitProfile)

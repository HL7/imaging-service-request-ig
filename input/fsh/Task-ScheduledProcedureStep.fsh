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

* intent = #plan

* code 1..1
  * text ^short = "Scheduled Procedure Step Description (0040,0007)"
  * coding ^short = "Scheduled Protocol Code Sequence (0040,0008)"

// Modality
* input ^slicing.discriminator.type = #value
* input ^slicing.discriminator.path = "type"
* input ^slicing.rules = #open
* input ^slicing.description = "Modality"

* input contains modality 1..1
* input[modality].type.coding.system = "http://dicom.nema.org/resources/ontology/DCM"
* input[modality].valueCodeableConcept from ftp://medical.nema.org/medical/dicom/resources/valuesets/fhir/json/ValueSet-dicom-cid-33-Modality

* requestedPeriod 1..1
* requestedPeriod ^short = "Scheduled Procedure Step Start Date / Scheduled Procedure Step Start Time"

// Scheduled station
* requestedPerformer ^slicing.discriminator.type = #value
* requestedPerformer ^slicing.discriminator.path = "reference"
* requestedPerformer ^slicing.rules = #open
* requestedPerformer ^slicing.description = "Scheduled Station"

* requestedPerformer contains scheduledStation 1..1
* requestedPerformer[scheduledStation] only CodeableReference(ScheduledStationProfile)

// Associated Patient
* for only Reference(ImagingPatientProfile)

// Associated Visit
* encounter only Reference(ImagingVisitProfile)

Instance: ImagingScheduledProcedureStep-Example
InstanceOf: ImagingScheduledProcedureStepProfile
Usage: #example
Description: "An example of a DICOM ImagingScheduledProcedureStepProfile in FHIR."

* id = "example-imaging-scheduled-procedure-step"

* status = #requested
* intent = #plan

* code.text = "CT Abdomen and Pelvis with Contrast"

* input
  * type.coding.system = "http://dicom.nema.org/resources/ontology/DCM"
  * valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#CT "Computed Tomography"

* requestedPerformer
  * reference = Reference(ScheduledStation-Example)

* requestedPeriod
  * start = "2024-01-01T12:00:00Z"

* for = Reference(ImagingPatient-Example)
* encounter = Reference(ImagingVisit-Example)
* basedOn = Reference(ImagingRequestedProcedure-Example)

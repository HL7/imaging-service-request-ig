Alias: DCM = http://dicom.nema.org/resources/ontology/DCM

Profile:        ImagingProcedureStepProfile
Parent:         Task
Id:             imaging-procedure-step
Title:          "Task - Imaging Procedure Step"
Description:    "Imaging procedure step Task that is created for scheduling and updated with performed-work information received through MPPS."

* ^abstract = false
* insert DICOMMWLStructureDefinitionContent

// DICOM Scheduled Procedure Step ID (0040,0009), used to correlate MPPS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Imaging procedure step identifiers"

* identifier contains scheduledProcedureStepId 1..1
* identifier[scheduledProcedureStepId].system = "urn:dicom:scheduled-procedure-step-id"
* identifier[scheduledProcedureStepId].value 1..1
* identifier[scheduledProcedureStepId] ^short = "DICOM Scheduled Procedure Step ID"

// Associated RequestedProcedure
* basedOn ^slicing.discriminator.type = #type
* basedOn ^slicing.discriminator.path = "reference"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Requested Procedure"

* basedOn contains requestedProcedureRef 1..1
* basedOn[requestedProcedureRef] only Reference(ImagingRequestedProcedureProfile)

* intent from ImagingProcedureStepIntentVS (required)

// Associated Patient
* for only Reference(ImagingPatientProfile)

// Associated Visit
* encounter only Reference(ImagingVisitProfile)

* code 1..1

// Modality
* input ^slicing.discriminator.type = #pattern
* input ^slicing.discriminator.path = "type"
* input ^slicing.rules = #open
* input ^slicing.description = "Modality"

* input contains modality 1..1
* input[modality].type.coding.system = "http://dicom.nema.org/resources/ontology/DCM"
* input[modality].valueCodeableConcept from ftp://medical.nema.org/medical/dicom/resources/valuesets/fhir/json/ValueSet-dicom-cid-33-Modality

* requestedPeriod 0..1
* requestedPeriod ^short = "Scheduled Procedure Step Start Date / Scheduled Procedure Step Start Time"

// Scheduled station
* requestedPerformer ^slicing.discriminator.type = #value
* requestedPerformer ^slicing.discriminator.path = "reference"
* requestedPerformer ^slicing.rules = #open
* requestedPerformer ^slicing.description = "Scheduled Station"

* requestedPerformer contains scheduledStation 0..1
* requestedPerformer[scheduledStation] only CodeableReference(ScheduledStationProfile)

* executionPeriod 0..1
* executionPeriod.start 0..1
* executionPeriod ^short = "Actual Performed Procedure Step Start and End Date / Time"

Invariant: imaging-procedure-step-execution-start
Description: "A procedure step that is in progress or completed must record when execution started."
Severity: #error
Expression: "status in ('in-progress' | 'completed') implies executionPeriod.start.exists()"

Invariant: imaging-procedure-step-execution-end
Description: "A completed procedure step must record when execution ended."
Severity: #error
Expression: "status = 'completed' implies executionPeriod.end.exists()"

Instance: ImagingProcedureStep-Example
InstanceOf: ImagingProcedureStepProfile
Usage: #example
Description: "An example of an imaging procedure step Task before and after MPPS updates."

* id = "example-imaging-procedure-step"

* identifier[scheduledProcedureStepId]
  * system = "urn:dicom:scheduled-procedure-step-id"
  * value = "SPS-2024-0001"

* status = #completed
* intent = #order

* code.text = "CT Abdomen and Pelvis with Contrast"

* input
  * type.coding.system = "http://dicom.nema.org/resources/ontology/DCM"
  * valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#CT "Computed Tomography"

* requestedPerformer
  * reference = Reference(ScheduledStation-Example)

* requestedPeriod
  * start = "2024-01-01T12:00:00Z"

* executionPeriod
  * start = "2024-01-01T12:05:00Z"
  * end = "2024-01-01T12:20:00Z"

* for = Reference(ImagingPatient-Example)
* encounter = Reference(ImagingVisit-Example)
* basedOn = Reference(ImagingRequestedProcedure-Example)

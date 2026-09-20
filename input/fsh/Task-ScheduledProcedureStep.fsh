Profile:        ImagingScheduledProcedureStepProfile
Parent:         ImagingProcedureStepProfile
Id:             imaging-scheduled-procedure-step
Title:          "Task - DICOM MWL Scheduled Procedure Step Mapping"
Description:    "DICOM MWL Scheduled Procedure Step Mapping to Task"

* ^abstract = false
* insert DICOMMWLStructureDefinitionContent

* requestedPeriod 1..1
* requestedPeriod ^short = "Scheduled Procedure Step Start Date / Scheduled Procedure Step Start Time"

// Scheduled station
* requestedPerformer ^slicing.discriminator.type = #value
* requestedPerformer ^slicing.discriminator.path = "reference"
* requestedPerformer ^slicing.rules = #open
* requestedPerformer ^slicing.description = "Scheduled Station"

* requestedPerformer contains scheduledStation 1..1
* requestedPerformer[scheduledStation] only CodeableReference(ScheduledStationProfile)

Instance: ImagingScheduledProcedureStep-Example
InstanceOf: ImagingScheduledProcedureStepProfile
Usage: #example
Description: "An example of a DICOM ImagingScheduledProcedureStepProfile in FHIR."

* id = "example-imaging-scheduled-procedure-step"

* status = #requested
* intent = #order

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

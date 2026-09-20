Profile:        ImagingPerformedProcedureStepProfile
Parent:         ImagingProcedureStepProfile
Id:             imaging-performed-procedure-step
Title:          "Task - DICOM Modality Performed Procedure Step Mapping"
Description:    "DICOM Modality Performed Procedure Step (MPPS) mapping to Task."

* ^abstract = false
* insert DICOMMWLStructureDefinitionContent

* executionPeriod 1..1
* executionPeriod.start 1..1
* executionPeriod ^short = "Actual Performed Procedure Step Start and End Date / Time"

Instance: ImagingPerformedProcedureStep-Example
InstanceOf: ImagingPerformedProcedureStepProfile
Usage: #example
Description: "An example of a DICOM Modality Performed Procedure Step in FHIR."

* id = "example-imaging-performed-procedure-step"

* status = #completed
* intent = #order

* code.text = "CT Abdomen and Pelvis with Contrast"

* input
  * type.coding.system = "http://dicom.nema.org/resources/ontology/DCM"
  * valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#CT "Computed Tomography"

* executionPeriod
  * start = "2024-01-01T12:05:00Z"
  * end = "2024-01-01T12:20:00Z"

* for = Reference(ImagingPatient-Example)
* encounter = Reference(ImagingVisit-Example)
* basedOn = Reference(ImagingRequestedProcedure-Example)

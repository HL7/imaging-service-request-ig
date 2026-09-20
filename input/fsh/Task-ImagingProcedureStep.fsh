Alias: DCM = http://dicom.nema.org/resources/ontology/DCM

Profile:        ImagingProcedureStepProfile
Parent:         Task
Id:             imaging-procedure-step
Title:          "Task - Imaging Procedure Step"
Description:    "Abstract base profile for scheduled and performed imaging procedure steps."

* ^abstract = true
* insert DICOMMWLStructureDefinitionContent

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

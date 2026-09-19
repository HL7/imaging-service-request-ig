Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingProcedureProfile
Parent:         Procedure
Id:             imaging-procedure
Title:          "Procedure - Imaging Procedure Mapping"
Description:    "Performed imaging Procedure, representing the fulfillment of a RequestedProcedure that was scheduled via a DICOM MWL entry. This profile only constrains how Procedure relates to the other MWL resources; it does not model DICOM Performed Procedure Step (MPPS) content."

* ^abstract = false
* insert DICOMMWLStructureDefinitionContent

// Associated RequestedProcedure
* basedOn ^slicing.discriminator.type = #type
* basedOn ^slicing.discriminator.path = "reference"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Requested Procedure"

* basedOn contains requestedProcedureRef 0..1
* basedOn[requestedProcedureRef] only Reference(ImagingRequestedProcedureProfile)

// Associated Patient
* subject only Reference(ImagingPatientProfile)

// Associated Visit
* encounter only Reference(ImagingVisitProfile)

Instance: ImagingProcedure-Example
InstanceOf: ImagingProcedureProfile
Usage: #example
Description: "An example of a performed Procedure that fulfills a DICOM MWL RequestedProcedure."

* id = "example-imaging-procedure"

* status = #completed
* code = http://snomed.info/sct#77477000 "Computed tomography (procedure)"

* subject = Reference(ImagingPatient-Example)
* encounter = Reference(ImagingVisit-Example)
* basedOn[requestedProcedureRef] = Reference(ImagingRequestedProcedure-Example)

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

* ^abstract = false
* insert DICOMMWLStructureDefinitionContent

* intent = #order

// Associated ImagingServiceRequest
* basedOn ^slicing.discriminator.type = #type
* basedOn ^slicing.discriminator.path = "reference"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "ImagingServiceRequest"

* basedOn contains imagingServiceRequestRef 1..1
* basedOn[imagingServiceRequestRef] only Reference(ImagingServiceRequestProfile)

// Associated Patient
* subject only Reference(ImagingPatientProfile)

// Associated Visit
* encounter only Reference(ImagingVisitProfile)

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Requested Procedure Identifiers"

* identifier contains requestedProcedureId 0..1
* identifier[requestedProcedureId].system = "http://goodhealth.org/requestedprocedure"
* identifier[requestedProcedureId].value 1..1
* identifier[requestedProcedureId] ^short = "Requested Procedure Identifier"

// Mapping to do
// code -> OBR-44

Instance: ImagingRequestedProcedure-Example
InstanceOf: ImagingRequestedProcedureProfile
Usage: #example
Description: "An example of a DICOM ImagingRequestedProcedure in FHIR."

* id = "example-imaging-requested-procedure"

* identifier[requestedProcedureId]
  * type
    * text = "Requested Procedure ID"
  * system = "http://goodhealth.org/requestedprocedure"
  * value = "RP12345"

* category = http://snomed.info/sct#363679005 "Imaging"
* status = #active
* intent = #order

* subject = Reference(ImagingPatient-Example)
* encounter = Reference(ImagingVisit-Example)
* basedOn = Reference(ImagingServiceRequest-Example)
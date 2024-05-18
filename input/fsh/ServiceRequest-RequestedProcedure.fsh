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

// Mapping to do
// code -> OBR-44

Instance: ImagingRequestedProcedure-Example
InstanceOf: ImagingRequestedProcedureProfile
Usage: #example
Description: "An example of a DICOM ImagingRequestedProcedure in FHIR."

* id = "example-imaging-requested-procedure"

* identifier
  * type
    * text = "Requested Procedure ID"
  * system = "http://goodhealth.org/requestedporcedure"
  * value = "RP12345"

* category = http://snomed.info/sct#363679005 "Imaging"
* status = #active
* intent = #order

* subject
  * reference = "Patient/example-imaging-patient"
* encounter
  * reference = "Encounter/example-imaging-encounter"
* basedOn
  * reference = "ServiceRequest/example-imaging-service-request"
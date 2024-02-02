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
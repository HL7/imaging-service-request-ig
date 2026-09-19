Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingStudyRequestedProcedureProfile
Parent:         ImagingStudy
Id:             requested-procedure-imaging-study
Title:          "ImagingStudy - DICOM MWL Study Instance Mapping"
Description:    "DICOM MWL Study Instance associated with an imaging service request and scheduled procedure step"

* ^abstract = false
* insert DICOMMWLStructureDefinitionContent

* status = #registered

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "DICOM Study Instance UID"

* identifier contains studyInstanceUid 1..1
* identifier[studyInstanceUid].system = "urn:dicom:uid"

// Associated ImagingServiceRequest / RequestedProcedure
* basedOn ^slicing.discriminator.type = #type
* basedOn ^slicing.discriminator.path = "reference"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "ImagingServiceRequest / RequestedProcedure"

* basedOn contains imagingServiceRequestRef 0..1
* basedOn[imagingServiceRequestRef] only Reference(ImagingServiceRequestProfile)

* basedOn contains requestedProcedureRef 0..1
* basedOn[requestedProcedureRef] only Reference(ImagingRequestedProcedureProfile)

// Associated Patient
* subject only Reference(ImagingPatientProfile)

// Associated Visit
* encounter only Reference(ImagingVisitProfile)


Instance: ImagingStudyRequestedProcedure-Example
InstanceOf: ImagingStudyRequestedProcedureProfile
Usage: #example
Description: "An example of ImagingStudy content in a FHIR MWL response."

* id = "example-requested-procedure-imaging-study"

* identifier[studyInstanceUid]
  * system = "urn:dicom:uid"
  * value = "urn:oid:2.16.124.113543.1154777499.30246.19789.350343004"

* subject = Reference(ImagingPatient-Example)
* encounter = Reference(ImagingVisit-Example)
* basedOn = Reference(ImagingServiceRequest-Example)
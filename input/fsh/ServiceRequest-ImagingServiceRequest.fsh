Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingServiceRequestProfile
Parent:         ServiceRequest
Id:             imaging-service-request
Title:          "ServiceRequest - DICOM MWL Imaging Service Request Mapping"
Description:    "DICOM MWL Imaging Service Request Mapping to ServiceRequest"

* ^abstract = true
* insert DICOMMWLStructureDefinitionContent

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Imaging Service Request Identifiers"

* identifier contains accessionNumber 1..1
* identifier[accessionNumber].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession Number"
* identifier[accessionNumber].value 1..1
* identifier[accessionNumber] ^short = "Accession Number"

* identifier contains placerOrder 0..1
* identifier[placerOrder].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[placerOrder].value 1..1
* identifier[placerOrder] ^short = "Placer Identifier"

* identifier contains fillerOrder 0..1
* identifier[fillerOrder].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL "Filler Identifier"
* identifier[fillerOrder].value 1..1
* identifier[fillerOrder] ^short = "Filler Identifier"

// TBD -- constrain values of status?
// TBD -- constrain values of intent?

* category = http://snomed.info/sct#363679005 "Imaging"

// * code TODO -- set LOINC codeset as example codeset instewad of SNOMET CT (see https://build.fhir.org/imagingstudy-definitions.html#ImagingStudy.procedure)

// Associated Patient
* subject only Reference(ImagingPatientProfile)

// Associated Visit
* encounter only Reference(ImagingVisitProfile)

// Mapping to be created
// code -> OBR-4
// reason -> OBR-31
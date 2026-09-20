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

* ^abstract = false
* insert DICOMMWLStructureDefinitionContent

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Imaging Service Request Identifiers"

* identifier contains accessionNumber 1..1
* identifier[accessionNumber].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[accessionNumber].value 1..1
* identifier[accessionNumber] ^short = "Accession ID"

* identifier contains fillerOrder 0..1
* identifier[fillerOrder].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL "Filler Identifier"
* identifier[fillerOrder].value 1..1
* identifier[fillerOrder] ^short = "Filler Identifier"

// The RAD-2 order (as originally submitted by the Order Placer) is not modeled as a
// FHIR resource in this IG. It is referenced only logically, by its Placer Order Number.
* basedOn ^slicing.discriminator.type = #pattern
* basedOn ^slicing.discriminator.path = "identifier.type"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.ordered = false
* basedOn ^slicing.description = "Logical reference to the RAD-2 Placer Order"

* basedOn contains placerOrderRef 0..1
* basedOn[placerOrderRef] ^short = "Logical reference to the RAD-2 order as originally submitted by the Order Placer; not a FHIR resource modeled in this IG"
* basedOn[placerOrderRef].reference 0..0
* basedOn[placerOrderRef].identifier 1..1
* basedOn[placerOrderRef].identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* basedOn[placerOrderRef].identifier.value 1..1

* status from ImagingServiceRequestStatusVS (required)

* intent = #order

* occurrence[x] only dateTime

* category = http://snomed.info/sct#363679005 "Imaging"

// * code TODO -- set LOINC codeset as example codeset instead of SNOMED CT (see https://build.fhir.org/imagingstudy-definitions.html#ImagingStudy.procedure)

// Associated Patient
* subject only Reference(ImagingPatientProfile)
* encounter only Reference(ImagingVisitProfile)

// Requesting / Referring Physician, Requesting Service
* requester only Reference(ImagingPractitionerProfile or ImagingOrganizationProfile)

Instance: ImagingServiceRequest-PlacerExample
InstanceOf: ImagingServiceRequestProfile
Usage: #example
Description: "An example of a RAD-2 Placer Order, submitted before a Filler Order Number has been assigned. Used as the ImagingServiceRequest entry in a $create-order request Bundle."

* id = "example-imaging-service-request-placer"

* identifier[accessionNumber]
  * type
    * coding
      * system = "http://terminology.hl7.org/CodeSystem/v2-0203"
      * code = #ACSN "Accession ID"
  * system = "http://goodhealth.org/acsn"
  * value = "A12345"

* basedOn[placerOrderRef]
  * identifier
    * type
      * coding
        * system = "http://terminology.hl7.org/CodeSystem/v2-0203"
        * code = #PLAC "Placer Identifier"
    * system = "http://goodhealth.org/plac"
    * value = "P12345"

* category = http://snomed.info/sct#363679005 "Imaging"
* status = #active
* intent = #order

* subject = Reference(ImagingPatient-Example)

Instance: ImagingServiceRequest-Example
InstanceOf: ImagingServiceRequestProfile
Usage: #example
Description: "An example of a DICOM ImagingServiceRequest in FHIR."

* id = "example-imaging-service-request"

* identifier[accessionNumber]
  * type
    * coding
      * system = "http://terminology.hl7.org/CodeSystem/v2-0203"
      * code = #ACSN "Accession ID"
  * system = "http://goodhealth.org/acsn"
  * value = "A12345"
* identifier[fillerOrder]
  * type
    * coding
      * system = "http://terminology.hl7.org/CodeSystem/v2-0203"
      * code = #FILL "Filler Identifier"
  * system = "http://goodhealth.org/fill"
  * value = "F12345"

* basedOn[placerOrderRef]
  * identifier
    * type
      * coding
        * system = "http://terminology.hl7.org/CodeSystem/v2-0203"
        * code = #PLAC "Placer Identifier"
    * system = "http://goodhealth.org/plac"
    * value = "P12345"

* category = http://snomed.info/sct#363679005 "Imaging"
* status = #active
* intent = #order

* subject = Reference(ImagingPatient-Example)
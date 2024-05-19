Instance:       DICOM-Modality-Worklist-From-FHIR
InstanceOf:     ConceptMap
Title:          "ConceptMap - Populating DICOM Modality Worklist C-FIND Response from FHIR"
Usage:          #definition

* id =  "mwl-entry-from-fhir"
* name = "DICOMMWLFromFHIR"
* description = "Populating DICOM Modality Worklist C-FIND Response from FHIR"
* status = #draft
* experimental = true
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/imagemgt"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension[0].valueCode = #ii

* additionalAttribute
  * code = #ResourceType
  * description = "FHIR Resource Reference Type"
  * uri = "http://hl7.org/fhir/ValueSet/resource-types"
  * type = #code
* additionalAttribute
  * code = #IdentifierType
  * description = "FHIR Identifier Type"
  * uri = "http://terminology.hl7.org/CodeSystem/v2-0203"
  * type = #Coding  

* group[+]
  * source = "http://hl7.org/fhir/uv/imaging-service-request-ig/StructureDefinition"
  * target = "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.7.html#sect_C.7.1"
  * element[+]
    * code = #imaging-patient
    * target[+]
      * code = #PatientIdentification
      * display = "Patient Identification"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #PatientDemographic
      * display = "Patient Demographic"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #imaging-patient.identifier
    * target[+]
      * code = #PatientID
      * display = "Patient ID (0010,0020)"
      * relationship = #source-is-broader-than-target
      * comment = "The value of the primary patient identifer"
    * target[+]
      * code = #IssuerOfPatientID
      * display = "Issuer of Patient ID (0010,0021)"
      * relationship = #source-is-broader-than-target
      * comment = "The assigner or system name of the primary patient identifer"
    * target[+]
      * code = #IssuerOfPatientIDQualifiersSequence
      * display = "Issuer of Patient ID Qualifiers Sequence (0010,0024)"
      * relationship = #source-is-broader-than-target
      * comment = "The system of the primary patient identifier"
    * target[+]
      * code = #OtherPatientIDsSequence
      * display = "Other Patient IDs Sequence (0010,1002)"
      * relationship = #source-is-broader-than-target
      * comment = "Additional patient identifiers"
  * element[+]
    * code = #imaging-patient.name
    * target[+]
      * code = #PatientName
      * display = "Patient's Name (0010,0010)"
      * relationship = #equivalent
  * element[+]
    * code = #imaging-patient.birthDate
    * target[+]
      * code = #PatientBirthDate
      * display = "Patient's Birth Date (0010,0030)"
      * relationship = #equivalent
  * element[+]
    * code = #imaging-Patient.gender
    * target[+]
      * code = #PatientSex
      * display = "Patient's Sex (0010,0040)"
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.org/fhir/uv/imaging-service-request-ig/StructureDefinition"
  * target = "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.3.html"
  * element[+]
    * code = #imaging-visit
    * target[+]
      * code = #VisitIdentification
      * display = "Visit Identification"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #VisitStatus
      * display = "Visit Status"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #imaging-visit.identifier
    * target[+]
      * code = #AdmissionID
      * display = "Admission ID (00380,0010)"
      * relationship = #source-is-broader-than-target
      * comment = "The value of the encounter identifer"
    * target[+]
      * code = #IssuerOfAdmissionIDSequence
      * display = "Issuer of Admission ID Sequence (0038,0014)"
      * relationship = #source-is-broader-than-target
      * comment = "The system of the encounter identifer"
  * element[+]
    * code = #imaging-visit.location
    * target[+]
      * code = #CurrentPatientLocation
      * display = "Current Patient Location (0038,0300)"
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.org/fhir/uv/imaging-service-request-ig/StructureDefinition"
  * target = "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.3.html"
  * element[+]
    * code = #imaging-service-request
    * target[+]
      * code = #ImagingServiceRequest
      * display = "Imaging Service Request"
      * relationship = #equivalent
  * element[+]
    * code = #imaging-service-request.identifier
    * target[+]
      * code = #AccessionNumber
      * display = "Accession Number (0008,0050)"
      * relationship = #source-is-broader-than-target   
      * comment = "The value of the identifier of type 'ACSN'"   
      * dependsOn
        * attribute = #IdentifierType
        * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
    * target[+]
      * code = #IssuerOfAccessionNumberSequence
      * display = "Issuer of Accession Number Sequence (0008,0051)"
      * relationship = #source-is-broader-than-target
      * comment = "The system of the identifier of type 'ACSN'"
      * dependsOn
        * attribute = #IdentifierType
        * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
    * target[+]
      * code = #PlacerOrderNumberImagingServiceRequest
      * display = "Placer Order Number / Imaging Service Request (0040,2016)"
      * relationship = #source-is-broader-than-target   
      * comment = "The value of the identifier of type 'PLAC'"   
      * dependsOn
        * attribute = #IdentifierType
        * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
    * target[+]
      * code = #OrderPlacerIdentifierSequence
      * display = "Order Placer Identifier Sequence (0040,0026)"
      * relationship = #source-is-broader-than-target
      * comment = "The system of the identifier of type 'PLAC'"
      * dependsOn
        * attribute = #IdentifierType
        * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
    * target[+]
      * code = #FillerOrderNumberImagingServiceRequest
      * display = "Filler Order Number / Imaging Service Request (0040,2017)"
      * relationship = #source-is-broader-than-target   
      * comment = "The value of the identifier of type 'FILL'"   
      * dependsOn
        * attribute = #IdentifierType
        * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
    * target[+]
      * code = #OrderFillerIdentifierSequence
      * display = "Order Filler  Identifier Sequence (0040,0027)"
      * relationship = #source-is-broader-than-target
      * comment = "The system of the identifier of type 'FILL'"
      * dependsOn
        * attribute = #IdentifierType
        * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#FILL        
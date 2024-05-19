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

* additionalAttribute[+]
  * code = #ResourceType
  * description = "FHIR Resource Reference Type"
  * uri = "http://hl7.org/fhir/ValueSet/resource-types"
  * type = #code
* additionalAttribute[+]
  * code = #IdentifierType
  * description = "FHIR Identifier Type"
  * uri = "http://terminology.hl7.org/CodeSystem/v2-0203"
  * type = #Coding  
* additionalAttribute[+]
  * code = #SystemType
  * description = "FHIR System Type"
  * type = #string  

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
      * display = "Admission ID (0380,0010)"
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
  * element[+]
    * code = #imaging-visit.reason
    * target[+]
      * code = #ReasonForVisit
      * display = "Reason for Visit (0032,1066)"
      * relationship = #equivalent
    * target[+]
      * code = #ReasonForVisitCodeSequence
      * display = "Reason for Visit Code Sequence (0032,1067)"
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.org/fhir/uv/imaging-service-request-ig/StructureDefinition"
  * target = "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.4.12.html"
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
  * element[+]
    * code = #imaging-service-request.requester
    * target[+]
      * code = #RequestingPhysician
      * display = "Requesting Physician (0032,1032)"
      * relationship = #source-is-broader-than-target
      * dependsOn[+]
        * attribute = #ResourceType
        * valueCode = #Practictioner
      * dependsOn[+]
        * attribute = #ResourceType
        * valueCode = #PractictionerRole
    * target[+]
      * code = #RequestingPhysicianIdentificationSequence
      * display = "Requesting Physician Identification Sequence (0032,1031)"
      * relationship = #source-is-broader-than-target
      * dependsOn[+]
        * attribute = #ResourceType
        * valueCode = #Practictioner
      * dependsOn[+]
        * attribute = #ResourceType
        * valueCode = #PractictionerRole
    * target[+]
      * code = #ReferringPhysicianName
      * display = "Referring Physician's Name (0008,0090)"
      * relationship = #source-is-broader-than-target
      * dependsOn[+]
        * attribute = #ResourceType
        * valueCode = #Practictioner
      * dependsOn[+]
        * attribute = #ResourceType
        * valueCode = #PractictionerRole   
    * target[+]
      * code = #ReferringPhysicianIdentificationSequence
      * display = "Referring Physician Identification Sequence (0008,0096)"
      * relationship = #source-is-broader-than-target
      * dependsOn[+]
        * attribute = #ResourceType
        * valueCode = #Practictioner
      * dependsOn[+]
        * attribute = #ResourceType
        * valueCode = #PractictionerRole
    * target[+]
      * code = #RequestingService
      * display = "Requesting Service (0032,1033)"
      * relationship = #source-is-broader-than-target
      * dependsOn[+]
        * attribute = #ResourceType
        * valueCode = #Organization   
    * target[+]
      * code = #RequestingServiceCodeSequence
      * display = "Requesting Service Code Sequence (0032,1034)"
      * relationship = #source-is-broader-than-target
      * dependsOn[+]
        * attribute = #ResourceType
        * valueCode = #Organization
  * element[+]
    * code = #imaging-service-request.authoredOn
    * target[+]
      * code = #IssueDateOfImagingServiceRequest
      * display = "Issue Date of Imaging Service Request (0040,2004)"
      * relationship = #source-is-broader-than-target   
      * comment = "The date component of the dateTime"   
    * target[+]
      * code = #IssueTimeOfImagingServiceRequest
      * display = "Issue Time of Imaging Service Request (0040,2005)"
      * relationship = #source-is-broader-than-target   
      * comment = "The time component of the dateTime"                       

* group[+]
  * source = "http://hl7.org/fhir/uv/imaging-service-request-ig/StructureDefinition"
  * target = "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.4.11.html"
  * element[+]
    * code = #imaging-requested-procedure
    * target[+]
      * code = #RequestedProcedure
      * display = "Requested Procedure"
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #imaging-requested-procedure.identifier
    * target[+]
      * code = #RequestedProcedureID
      * display = "Requested Procedure ID (0040,1001)"
      * relationship = #equivalent
  * element[+]
    * code = #imaging-requested-procedure.code
    * target[+]
      * code = #RequestedProcedureDescription
      * display = "Requested Procedure Description (0032,1060)"
      * relationship = #source-is-broader-than-target   
    * target[+]
      * code = #RequestedProcedureCodeSequence
      * display = "Requested Procedure Code Sequence (0032,1064)"
      * relationship = #equivalent
  * element[+]
    * code = #imaging-requested-procedure.priority
    * target[+]
      * code = #RequestedProcedurePriority
      * display = "Requested Procedure Priority (0040,1003)"
      * relationship = #equivalent
  * element[+]
    * code = #imaging-requested-procedure.reason
    * target[+]
      * code = #ReasonForTheRequestedProcedure
      * display = "Reason for the Requested Procedure (0040,1002)"
      * relationship = #equivalent
    * target[+]
      * code = #ReasonForRequestedProcedureCodeSequence
      * display = "Reason for Requested Procedure Code Sequence (0040,100A)"
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.org/fhir/uv/imaging-service-request-ig/StructureDefinition"
  * target = "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.4.11.html"
  * element[+]
    * code = #requested-procedure-imaging-study
    * target[+]
      * code = #RequestedProcedure
      * display = "Requested Procedure"
      * relationship = #source-is-narrower-than-target 
    * code = #requested-procedure-imaging-study.identifier
    * target[+]
      * code = #StudyInstanceUID
      * display = "Study Instance UID (0020,000D)"
      * relationship = #equivalent
      * dependsOn
        * attribute = #SystemType
        * valueString = "urn:dicom:uid"  

* group[+]
  * source = "http://hl7.org/fhir/uv/imaging-service-request-ig/StructureDefinition"
  * target = "https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.4.10.html"
  * element[+]
    * code = #imaging-scheduled-procedure-step
    * target[+]
      * code = #ScheduledProcedureStep
      * display = "Scheduled Procedure Step"
      * relationship = #equivalent        
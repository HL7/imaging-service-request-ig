Instance:       FHIR-to-DICOM-Imaging-Service-Request
InstanceOf:     ConceptMap
Title:          "ConceptMap - Populating DICOM Imaging Service Request from FHIR"
Usage:          #definition

* id =  "fhir-to-dicom-imaging-service-request"
* name = "FHIRToDICOMImagingServiceRequest"
* description = "Populating DICOM Imaging Service Request from FHIR"
* status = #draft
* experimental = true
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/imagemgt"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension[0].valueCode = #ii

* additionalAttribute[0]
  * code = #ResourceType
  * description = "FHIR Resource Reference Type"
  * uri = "http://hl7.org/fhir/ValueSet/resource-types"
  * type = #code
* additionalAttribute[0]
  * code = #IdentifierType
  * description = "FHIR Identifier Type"
  * uri = "http://terminology.hl7.org/CodeSystem/v2-0203"
  * type = #Coding  

* group[0].element[0]
  * code = #DICOM.ImagingServiceRequestComments
  * display = "DICOM Imaging Service Request Comments (0040,2400)"
  * target
    * relationship = #equivalent
    * code = #note
    * display = "ImagingServiceRequest.note"

* group[1].element[0]
  * code = #DICOM.RequestingPhysician
  * display = "DICOM Requesting Physician (0032,1032)"
  * target[0]
    * relationship = #equivalent
    * code = #requester
    * display = "ImagingServiceRequest.requester"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #Practictioner
  * target[1]
    * relationship = #equivalent
    * code = #requester
    * display = "ImagingServiceRequest.requester.practitioner"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #PractitionerRole      
  * target[2]
    * relationship = #equivalent
    * code = #OBR-16
    * display = "Ordering Provider"
* group[1].element[1]
  * code = #DICOM.RequestingPhysicianIdentificationSequence
  * display = "DICOM Requesting Physician Identification Sequence (0032,1031)"
  * target[0]
    * relationship = #equivalent
    * code = #requester
    * display = "ImagingServiceRequest.requester"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #Practictioner
  * target[1]
    * relationship = #equivalent
    * code = #requester
    * display = "ImagingServiceRequest.requester.practitioner"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #PractitionerRole      
  * target[2]
    * relationship = #equivalent
    * code = #OBR-16
    * display = "Ordering Provider"    

* group[2].element[0]
  * code = #DICOM.ReferringPhysicianName
  * display = "DICOM Referring Physician's Name (0008,0090)"
  * target[0]
    * relationship = #equivalent
    * code = #requester
    * display = "ImagingServiceRequest.requester"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #Practictioner
  * target[1]
    * relationship = #equivalent
    * code = #requester
    * display = "ImagingServiceRequest.requester.practitioner"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #PractitionerRole      
  * target[2]
    * relationship = #equivalent
    * code = #PV1-8
    * display = "Referring Doctor"         
* group[2].element[1]
  * code = #DICOM.ReferringPhysicianIdentificationSequence
  * display = "DICOM Referring Physician Identification Sequence (0008,0096)"
  * target[0]
    * relationship = #equivalent
    * code = #requester
    * display = "ImagingServiceRequest.requester"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #Practictioner
  * target[1]
    * relationship = #equivalent
    * code = #requester
    * display = "ImagingServiceRequest.requester.practitioner"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #PractitionerRole      
  * target[2]
    * relationship = #equivalent
    * code = #PV1-8
    * display = "Referring Doctor"

* group[3].element[0]
  * code = #DICOM.RequestingService
  * display = "DICOM Requesting Service (0032,1033)"
  * target[0]
    * relationship = #equivalent
    * code = #requester
    * display = "ImagingServiceRequest.requester"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #Organization
  * target[1]
    * relationship = #equivalent
    * code = #requester
    * display = "ImagingServiceRequest.requester.organization"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #PractitionerRole
  * target[2]
    * relationship = #equivalent
    * code = #PV1-8
    * display = "Referring Doctor"      
* group[3].element[1]
  * code = #DICOM.RequestingServiceCodeSequence
  * display = "DICOM Requesting Service Code Sequence (0032,1034)"
  * target[0]
    * relationship = #equivalent
    * code = #requester
    * display = "ImagingServiceRequest.requester"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #Organization
  * target[1]
    * relationship = #equivalent
    * code = #requester
    * display = "ImagingServiceRequest.requester.organization"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #PractitionerRole            

* group[4].element[0]
  * code = #DICOM.AccessionNumber
  * display = "DICOM Accession Number (0008,0050)"
  * target[0]
    * relationship = #equivalent
    * code = #identifier
    * display = "ImagingServiceRequest.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
  * target[1]
    * relationship = #equivalent
    * code = #OBR-18
    * display = "Placer Field 1"        
* group[4].element[1]
  * code = #DICOM.IssuerOfAccessionNumberSequence
  * display = "DICOM Issuer of Accession Number Sequence (0008,0051)"
  * target[0]
    * relationship = #source-is-broader-than-target
    * code = #identifier
    * display = "ImagingServiceRequest.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
  * target[1]
    * relationship = #source-is-broader-than-target
    * code = #OBR-18
    * display = "Placer Field 1"  

* group[5].element[0]
  * code = #DICOM.IssueDateOfImagingServiceRequest
  * display = "DICOM Issue Date of Imaging Service Request (0040,2004)"
  * target[0]
    * relationship = #source-is-broader-than-target
    * code = #occurrenceDateTime
    * display = "ImagingServiceRequest.occurrenceDateTime"
  * target[1]
    * relationship = #source-is-broader-than-target
    * code = #OBR-6
    * display = "Requested Date/Time"  
* group[5].element[1]
  * code = #DICOM.IssueTimeOfImagingServiceRequest
  * display = "DICOM Issue Time of Imaging Service Request (0040,2005)"
  * target[0]
    * relationship = #source-is-broader-than-target
    * code = #occurrenceDateTime
    * display = "ImagingServiceRequest.occurrenceDateTime"
  * target[1]
    * relationship = #source-is-broader-than-target
    * code = #OBR-6
    * display = "Requested Date/Time"      

* group[6].element[0]
  * code = #DICOM.PlacerOrderNumberImagingServiceRequest
  * display = "DICOM Placer Order Number / Imaging Service Request (0040,2016)"
  * target[0]
    * relationship = #equivalent
    * code = #identifier
    * display = "ImagingServiceRequest.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
  * target[1]
    * relationship = #source-is-broader-than-target
    * code = #OBR-2
    * display = "Placer Order Number"  
* group[6].element[1]
  * code = #DICOM.OrderPlacerIdentifierSequence
  * display = "DICOM Order Placer Identifier Sequence (0040,0026)"
  * target[0]
    * relationship = #equivalent
    * code = #identifier
    * display = "ImagingServiceRequest.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
  * target[1]
    * relationship = #equivalent
    * code = #OBR-2
    * display = "Placer Order Number"  

* group[7].element[0]
  * code = #DICOM.FillerOrderNumberImagingServiceRequest
  * display = "DICOM Filler Order Number / Imaging Service Request (0040,2017)"
  * target[0]
    * relationship = #equivalent
    * code = #identifier
    * display = "ImagingServiceRequest.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
  * target[1]
    * relationship = #equivalent
    * code = #OBR-3
    * display = "Filler Order Number"  
* group[7].element[1]
  * code = #DICOM.OrderFillerIdentifierSequence
  * display = "DICOM Order Filler Identifier Sequence (0040,0027)"
  * target[0]
    * relationship = #equivalent
    * code = #identifier
    * display = "ImagingServiceRequest.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
  * target[1]
    * relationship = #equivalent
    * code = #OBR-3
    * display = "Filler Order Number"  

// No clear mapping from ServiceRequest or encounter
// Raise with O&O
* group[8].element[0]
  * code = #DICOM.OrderEnteredBy
  * display = "DICOM Order Entered By (0040,2008)"
  * target[0]
    * relationship = #not-related-to
    * display = "ImagingServiceRequest"
  * target[1]
    * relationship = #equivalent
    * code = #ORC-10
    * display = "Entered By"  
* group[8].element[1]
  * code = #DICOM.OrderEntererLocation
  * display = "DICOM Order Enterer's Location (0040,2009)"
  * target[0]
    * relationship = #not-related-to
    * display = "ImagingServiceRequest"
  * target[1]
    * relationship = #equivalent
    * code = #OBR-17
    * display = "Entering Organization"  
* group[8].element[2]
  * code = #DICOM.OrderCallbackPhoneNumber
  * display = "DICOM Order Callback Phone Number (0040,2010)"
  * target[0]
    * relationship = #not-related-to
    * display = "ImagingServiceRequest"
  * target[1]
    * relationship = #equivalent
    * code = #OBR-14
    * display = "Call Back Phone Number"  
* group[8].element[3]
  * code = #DICOM.OrderCallbackTelecomInformation
  * display = "DICOM Order Callback Telecom Information (0040,2011)"
  * target[0]
    * relationship = #not-related-to
    * display = "ImagingServiceRequest"
  * target[1]
    * relationship = #equivalent
    * code = #OBR-14
    * display = "Call Back Phone Number"  

* group[9].element[0]
  * code = #DICOM.AdmissionID
  * display = "DICOM Admission ID (0038,0010)"
  * target[0]
    * relationship = #equivalent
    * code = #encounter.identifier
    * display = "ImagingServiceRequest.encounter.identifier"
  * target[1]
    * relationship = #equivalent
    * code = #PV1-19
    * display = "Visit Number"  
* group[9].element[1]
  * code = #DICOM.IssuerOfAdmissionIDSequence
  * display = "DICOM Issuer of Admission ID Sequence (0038,0014)"
  * target[0]
    * relationship = #source-is-broader-than-target
    * code = #encounter.identifier
    * display = "ImagingServiceRequest.encounter.identifier"
  * target[1]
    * relationship = #equivalent
    * code = #PV1-19
    * display = "Visit Number"  

* group[10].element[0]
  * code = #DICOM.ReasonForVisit
  * display = "DICOM Reason for Visit (0032,1066)"
  * target[0]
    * relationship = #equivalent
    * code = #encounter.reason
    * display = "ImagingServiceRequest.encounter.reason"
  * target[1]
    * relationship = #equivalent
    * code = #PV2-3
    * display = "Admit Reason"         
* group[10].element[1]
  * code = #DICOM.ReasonForVisitCodeSequence
  * display = "DICOM Reason for Visit Code Sequence (0032,1067)"
  * target[0]
    * relationship = #equivalent
    * code = #encounter.reason
    * display = "ImagingServiceRequest.encounter.reason"
  * target[1]
    * relationship = #equivalent
    * code = #PV2-3
    * display = "Admit Reason"
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

* group.element[0]
  * code = #DICOM.ImagingServiceRequestComments
  * display = "DICOM Imaging Service Request Comments (0040,2400)"
  * target
    * relationship = #equivalent
    * code = #note
    * display = "ImagingServiceRequest.note"

* group.element[1]
  * code = #DICOM.RequestingPhysician
  * display = "DICOM Requesting Physician (0032,1032)"
  * target
    * relationship = #source-is-broader-than-target
    * code = #requester
    * display = "ImagingServiceRequest.requester"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #Practictioner

// Update requester mapping to include PractitionerRole which gives you Practirioner and Organization

* group.element[2]
  * code = #DICOM.RequestingPhysicianIdentificationSequence
  * display = "DICOM Requesting Physician Identification Sequence (0032,1031)"
  * target
    * relationship = #source-is-broader-than-target
    * code = #requester
    * display = "ImagingServiceRequest.requester"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #Practictioner

* group.element[3]
  * code = #DICOM.ReferringPhysicianName
  * display = "DICOM Referring Physician's Name (0008,0090)"
  * target
    * relationship = #source-is-broader-than-target
    * code = #requester
    * display = "ImagingServiceRequest.requester"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #Practictioner

* group.element[4]
  * code = #DICOM.ReferringPhysicianIdentificationSequence
  * display = "DICOM Referring Physician Identification Sequence (0008,0096)"
  * target
    * relationship = #source-is-broader-than-target
    * code = #requester
    * display = "ImagingServiceRequest.requester"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #Practictioner

* group.element[5]
  * code = #DICOM.RequestingService
  * display = "DICOM Requesting Service (0032,1033)"
  * target
    * relationship = #source-is-broader-than-target
    * code = #requester
    * display = "ImagingServiceRequest.requester"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #Organization


* group.element[6]
  * code = #DICOM.RequestingServiceCodeSequence
  * display = "DICOM Requesting Service Code Sequence (0032,1034)"
  * target
    * relationship = #source-is-broader-than-target
    * code = #requester
    * display = "ImagingServiceRequest.requester"
    * dependsOn[0]
      * attribute = #ResourceType
      * valueCode = #Organization

* group.element[7]
  * code = #DICOM.AccessionNumber
  * display = "DICOM Accession Number (0008,0050)"
  * target
    * relationship = #equivalent
    * code = #identifier
    * display = "ImagingServiceRequest.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN

* group.element[8]
  * code = #DICOM.IssuerOfAccessionNumberSequence
  * display = "DICOM Issuer of Accession Number Sequence (0008,0051)"
  * target
    * relationship = #source-is-broader-than-target
    * code = #identifier
    * display = "ImagingServiceRequest.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN

* group.element[9]
  * code = #DICOM.IssueDateOfImagingServiceRequest
  * display = "DICOM Issue Date of Imaging Service Request (0040,2004)"
  * target
    * relationship = #source-is-broader-than-target
    * code = #occurrenceDateTime
    * display = "ImagingServiceRequest.occurrenceDateTime"

* group.element[10]
  * code = #DICOM.IssueTimeOfImagingServiceRequest
  * display = "DICOM Issue Time of Imaging Service Request (0040,2005)"
  * target
    * relationship = #source-is-broader-than-target
    * code = #occurrenceDateTime
    * display = "ImagingServiceRequest.occurrenceDateTime"

* group.element[11]
  * code = #DICOM.PlacerOrderNumberImagingServiceRequest
  * display = "DICOM Placer Order Number / Imaging Service Request (0040,2016)"
  * target
    * relationship = #equivalent
    * code = #identifier
    * display = "ImagingServiceRequest.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC

* group.element[12]
  * code = #DICOM.OrderPlacerIdentifierSequence
  * display = "DICOM Order Placer Identifier Sequence (0040,0026)"
  * target
    * relationship = #equivalent
    * code = #identifier
    * display = "ImagingServiceRequest.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC

* group.element[13]
  * code = #DICOM.FillerOrderNumberImagingServiceRequest
  * display = "DICOM Filler Order Number / Imaging Service Request (0040,2017)"
  * target
    * relationship = #equivalent
    * code = #identifier
    * display = "ImagingServiceRequest.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#FILL

* group.element[14]
  * code = #DICOM.OrderFillerIdentifierSequence
  * display = "DICOM Order Filler Identifier Sequence (0040,0027)"
  * target
    * relationship = #equivalent
    * code = #identifier
    * display = "ImagingServiceRequest.identifier"
    * dependsOn[0]
      * attribute = #IdentifierType
      * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#FILL

// No clear mapping from ServiceRequest or encounter
// Raise with O&O

* group.element[15]
  * code = #DICOM.OrderEnteredBy
  * display = "DICOM Order Entered By (0040,2008)"
  * noMap = true

* group.element[16]
  * code = #DICOM.OrderEntererLocation
  * display = "DICOM Order Enterer's Location (0040,2009)"
  * noMap = true

* group.element[17]
  * code = #DICOM.OrderCallbackPhoneNumber
  * display = "DICOM Order Callback Phone Number (0040,2010)"
  * noMap = true

* group.element[18]
  * code = #DICOM.OrderCallbackTelecomInformation
  * display = "DICOM Order Callback Telecom Information (0040,2011)"
  * noMap = true

* group.element[19]
  * code = #DICOM.AdmissionID
  * display = "DICOM Admission ID (0038,0010)"
  * target
    * relationship = #equivalent
    * code = #encounter.identifier
    * display = "ImagingServiceRequest.encounter.identifier"
        
* group.element[20]
  * code = #DICOM.IssuerOfAdmissionIDSequence
  * display = "DICOM Issuer of Admission ID Sequence (0038,0014)"
  * target
    * relationship = #source-is-broader-than-target
    * code = #encounter.identifier
    * display = "ImagingServiceRequest.encounter.identifier"

* group.element[21]
  * code = #DICOM.ReasonForVisit
  * display = "DICOM Reason for Visit (0032,1066)"
  * target
    * relationship = #equivalent
    * code = #encounter.reason
    * display = "ImagingServiceRequest.encounter.reason"
        
* group.element[22]
  * code = #DICOM.ReasonForVisitCodeSequence
  * display = "DICOM Reason for Visit Code Sequence (0032,1067)"
  * target
    * relationship = #equivalent
    * code = #encounter.reason
    * display = "ImagingServiceRequest.encounter.reason"

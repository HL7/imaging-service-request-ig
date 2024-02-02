Instance:       FHIR-to-DICOM-Requested-Procedure
InstanceOf:     ConceptMap
Title:          "ConceptMap - Populating DICOM Requested Procedure from FHIR"
Usage:          #definition

* id =  "fhir-to-dicom-requested-procedure-step"
* name = "FHIRToDICOMRequestedProcedureStep"
* description = "Populating DICOM Requested Procedure from FHIR"
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
  * code = #DICOM.RequestedProcedureID
  * display = "DICOM Requested Procedure ID (0040,1001)"
  * target
    * relationship = #equivalent
    * code = #identifier
    * display = "RequestedProcedure.identifier"
// TODO -- Define IdentifierType for Requested Procedure ID / Study ID -- not Study UID

// StudyUID likely encoded in order detail

* group.element[1]
  * code = #DICOM.ReasonForTheRequestedProcedure
  * display = "DICOM Reason for the Requested Procedure (0040,1002)"
  * target
    * relationship = #equivalent
    * code = #reason
    * display = "RequestedProcedure.reason"

* group.element[2]
  * code = #DICOM.RequestedProcedureComments
  * display = "DICOM Requested Procedure Comments (0040,1400)"
  * target
    * relationship = #equivalent
    * code = #reason
    * display = "RequestedProcedure.reason"

* group.element[3]
  * code = #DICOM.ReasonForRequestedProcedureCodeSequence
  * display = "DICOM Reason for Requested Procedure Code Sequence (0040,100A)"
  * target
    * relationship = #equivalent
    * code = #reason
    * display = "RequestedProcedure.reason"

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

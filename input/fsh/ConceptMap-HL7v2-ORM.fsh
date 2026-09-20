Instance:       HL7V2-ORM-to-FHIR
InstanceOf:     ConceptMap
Title:          "ConceptMap - Populating FHIR Resources from HL7 v2.3.1 ORM/OMG Order Messages"
Usage:          #definition

* id =  "hl7v2-orm-to-fhir"
* name = "HL7V2ORMToFHIR"
* description = "Mapping HL7 v2.3.1 ORM (and v2.5.1 OMG) segments used in RAD-2 and RAD-3 to the Imaging Service Request FHIR resources"
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
* additionalAttribute[1]
  * code = #HL7Version
  * description = "HL7 Version to which the source segment/field applies"
  * type = #string
* additionalAttribute[2]
  * code = #Transaction
  * description = "IHE RAD transaction(s) (RAD-2 Placer Order Management and/or RAD-3 Filler Order Management) in which the source segment/field is used"
  * type = #code

// MSH segment
// RAD-2: MSH-9 = ORM^O01 (Order Placer -> DSS/Order Filler)
// RAD-3: MSH-9 = ORM^O01 (DSS/Order Filler -> Order Placer) or ORR^O02 (Order Placer -> DSS/Order Filler ack)
* group[0]
  * source = "https://www.hl7.org/Special/committees/imagemgt"
  * target = "http://hl7.org/fhir/uv/imaging-service-request-ig/StructureDefinition"
  * element[0]
    * code = #MSH-9
    * display = "Message Type (ORM^O01 / OMG^O19)"
    * noMap = true
    * comment = "Used only for message routing; does not map to a FHIR resource element. Applies to both RAD-2 and RAD-3."

// PID segment -> Patient
// Shared by RAD-2 (New Order / Order Cancelled by Placer) and RAD-3 (New/Change Order, Order Cancelled by Filler)
* group[1]
  * source = "https://www.hl7.org/Special/committees/imagemgt"
  * target = "http://hl7.org/fhir/uv/imaging-service-request-ig/StructureDefinition"
  * element[0]
    * code = #PID-3
    * display = "Patient Identifier List"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-patient.identifier
      * display = "ImagingPatient.identifier"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[1]
    * code = #PID-5
    * display = "Patient Name"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-patient.name
      * display = "ImagingPatient.name"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[2]
    * code = #PID-18
    * display = "Patient Account Number"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-visit.identifier
      * display = "ImagingVisit.identifier"
      * comment = "At least one of PID-18 or PV1-19 shall be valued per RAD-2/RAD-3; represented as the Visit identifier"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3

// PV1 segment -> Encounter
// Shared by RAD-2 and RAD-3, except PV1-8 which is used for RAD-2 New Order requester context
* group[2]
  * source = "https://www.hl7.org/Special/committees/imagemgt"
  * target = "http://hl7.org/fhir/uv/imaging-service-request-ig/StructureDefinition"
  * element[0]
    * code = #PV1-2
    * display = "Patient Class"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-visit.class
      * display = "ImagingVisit.class"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[1]
    * code = #PV1-8
    * display = "Referring Doctor"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.requester
      * display = "ImagingServiceRequest.requester"
      * comment = "Populated in RAD-2 New Order messages; not required for RAD-3 status update / cancellation messages"
      * dependsOn[0]
        * attribute = #ResourceType
        * valueCode = #Practitioner
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-2
  * element[2]
    * code = #PV1-19
    * display = "Visit Number"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-visit.identifier
      * display = "ImagingVisit.identifier"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3

// ORC segment -> ServiceRequest (order-level)
// ORC-1 code sets differ by direction: RAD-2 is Order Placer-initiated (NW/PA/CH/CA/DC);
// RAD-3 is DSS/Order Filler-initiated (SN/XX/NA/OC) plus the RAD-3 Order Status Update (SC)
* group[3]
  * source = "https://www.hl7.org/Special/committees/imagemgt"
  * target = "http://hl7.org/fhir/uv/imaging-service-request-ig/StructureDefinition"
  * element[0]
    * code = #ORC-1
    * display = "Order Control"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.status
      * display = "ImagingServiceRequest.status"
      * comment = "RAD-2 values: NW (new), PA (parent), CH (child), CA (cancel), DC (discontinue) - Order Placer initiated"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
    * target[1]
      * relationship = #equivalent
      * code = #imaging-service-request.status
      * display = "ImagingServiceRequest.status"
      * comment = "RAD-3 values: SN (new), XX (change), NA (ORR/ORG acknowledgement), OC (cancelled by filler) - DSS/Order Filler initiated"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[1]
    * code = #ORC-2
    * display = "Placer Order Number"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.basedOn
      * display = "ImagingServiceRequest.basedOn[placerOrderRef].identifier"
      * dependsOn[0]
        * attribute = #IdentifierType
        * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[2]
        * attribute = #Transaction
        * valueCode = #RAD-3
      * comment = "RAD-2: valued by the Order Placer on the New Order message. RAD-3: omitted on the DSS/Order Filler's New Order message and valued by the Order Placer in the ORR/ORG acknowledgement. Carried as a logical reference (identifier only) on ImagingServiceRequest.basedOn, since the RAD-2 order itself is not modeled as a FHIR resource in this IG."
  * element[2]
    * code = #ORC-3
    * display = "Filler Order Number"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.identifier
      * display = "ImagingServiceRequest.identifier[fillerOrder]"
      * dependsOn[0]
        * attribute = #IdentifierType
        * valueCoding = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3
      * comment = "RAD-2: shall not be present. RAD-3: required, valued by the DSS/Order Filler"
  * element[3]
    * code = #ORC-5
    * display = "Order Status"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.status
      * display = "ImagingServiceRequest.status"
      * comment = "CM=completed, DC=discontinued, IP=in progress; carried on the RAD-3 Order Status Update message only"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[4]
    * code = #ORC-7
    * display = "Quantity/Timing"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-requested-procedure.occurrenceDateTime
      * display = "RequestedProcedure.occurrenceDateTime"
      * comment = "HL7 v2.3.1 only; superseded by TQ1-7 in v2.5.1/OMG. Required on RAD-2 New Order; present on RAD-3 New/Change Order"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[5]
    * code = #ORC-9
    * display = "Date/Time of Transaction"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.authoredOn
      * display = "ImagingServiceRequest.authoredOn"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[6]
    * code = #ORC-12
    * display = "Ordering Provider"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.requester
      * display = "ImagingServiceRequest.requester"
      * dependsOn[0]
        * attribute = #ResourceType
        * valueCode = #Practitioner
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[2]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[7]
    * code = #ORC-17
    * display = "Entering Organization"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-organization
      * display = "ImagingOrganization"
      * dependsOn[0]
        * attribute = #ResourceType
        * valueCode = #Organization
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[2]
        * attribute = #Transaction
        * valueCode = #RAD-3

// TQ1 segment (HL7 v2.5.1 / OMG only) -> RequestedProcedure
// Shared by RAD-2 and RAD-3 OMG-based New/Change Order and Order Status Update messages
* group[4]
  * source = "https://www.hl7.org/Special/committees/imagemgt"
  * target = "http://hl7.org/fhir/uv/imaging-service-request-ig/StructureDefinition"
  * element[0]
    * code = #TQ1-7
    * display = "Start Date/Time"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-requested-procedure.occurrenceDateTime
      * display = "RequestedProcedure.occurrenceDateTime"
      * comment = "HL7 v2.5.1 / OMG only; carries the exam start date/time in place of deprecated ORC-7.4/OBR-27.4"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3

// OBR segment -> ServiceRequest (requested procedure level)
// Shared by RAD-2 (Order Placer New Order) and RAD-3 (DSS/Order Filler New/Change Order),
// except where noted (e.g., OBR-3 which is RAD-3 only, following the same pattern as ORC-3)
* group[5]
  * source = "https://www.hl7.org/Special/committees/imagemgt"
  * target = "http://hl7.org/fhir/uv/imaging-service-request-ig/StructureDefinition"
  * element[0]
    * code = #OBR-2
    * display = "Placer Order Number"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.basedOn
      * display = "ImagingServiceRequest.basedOn[placerOrderRef].identifier"
      * comment = "Carried as a logical reference (identifier only) on ImagingServiceRequest.basedOn, since the RAD-2 order itself is not modeled as a FHIR resource in this IG."
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[1]
    * code = #OBR-3
    * display = "Filler Order Number"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.identifier
      * display = "ImagingServiceRequest.identifier[fillerOrder]"
      * comment = "RAD-2: not present. RAD-3: required, valued by the DSS/Order Filler"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[2]
    * code = #OBR-4
    * display = "Universal Service ID"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.code
      * display = "ImagingServiceRequest.code"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[3]
    * code = #OBR-6
    * display = "Requested Date/Time"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.occurrenceDateTime
      * display = "ImagingServiceRequest.occurrenceDateTime"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[4]
    * code = #OBR-12
    * display = "Danger Code"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.note
      * display = "ImagingServiceRequest.note"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[5]
    * code = #OBR-13
    * display = "Relevant Clinical Info."
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.note
      * display = "ImagingServiceRequest.note"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[6]
    * code = #OBR-16
    * display = "Ordering Provider"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.requester
      * display = "ImagingServiceRequest.requester"
      * dependsOn[0]
        * attribute = #ResourceType
        * valueCode = #Practitioner
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[2]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[7]
    * code = #OBR-27
    * display = "Quantity/Timing"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-requested-procedure.occurrenceDateTime
      * display = "RequestedProcedure.occurrenceDateTime"
      * comment = "HL7 v2.3.1 only; superseded by TQ1-7 in v2.5.1/OMG"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[8]
    * code = #OBR-30
    * display = "Transportation Mode"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-scheduled-procedure-step
      * display = "ScheduledProcedureStep"
      * comment = "No dedicated FHIR element currently modeled; candidate for a Task extension"
      * dependsOn[0]
        * attribute = #ResourceType
        * valueCode = #Task
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[2]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[9]
    * code = #OBR-31
    * display = "Reason for Study"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-service-request.reasonCode
      * display = "ImagingServiceRequest.reasonCode"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-3
  * element[10]
    * code = #OBR-41
    * display = "Transport Arranged"
    * target[0]
      * relationship = #equivalent
      * code = #imaging-scheduled-procedure-step
      * display = "ScheduledProcedureStep"
      * comment = "No dedicated FHIR element currently modeled; candidate for a Task extension"
      * dependsOn[0]
        * attribute = #ResourceType
        * valueCode = #Task
      * dependsOn[1]
        * attribute = #Transaction
        * valueCode = #RAD-2
      * dependsOn[2]
        * attribute = #Transaction
        * valueCode = #RAD-3

// MSA / ERR (acknowledgement) - RAD-3 only (Order Placer's ORR/ORG acknowledgement to the DSS/Order Filler)
* group[6]
  * source = "https://www.hl7.org/Special/committees/imagemgt"
  * target = "http://hl7.org/fhir/uv/imaging-service-request-ig/StructureDefinition"
  * element[0]
    * code = #MSA-1
    * display = "Acknowledgement Code"
    * noMap = true
    * comment = "ACK/ORR/ORG semantics correspond to the FHIR operation outcome of the create-order / cancel-order operations, not to a persisted resource element. Used in RAD-3 order acknowledgement."
  * element[1]
    * code = #ERR-1
    * display = "Error Code and Location"
    * target[0]
      * relationship = #equivalent
      * code = #OperationOutcome
      * display = "OperationOutcome"
      * comment = "RAD-3 ORR (Error) / ORG (Error) acknowledgement"
      * dependsOn[0]
        * attribute = #Transaction
        * valueCode = #RAD-3

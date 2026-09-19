Profile:        CreateOrderRequestBundle
Parent:         Bundle
Id:             create-order-request-bundle
Title:          "Bundle - Create Order Request"
Description:    "Bundle submitted as the `order` input parameter of the $create-order operation. Contains the ImagingServiceRequest, its RequestedProcedure(s), and the associated Patient/Encounter needed to create a new MWL entry (RAD-2 New Order semantics)."

* ^abstract = false
* type = #collection
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.ordered = false
* entry ^slicing.description = "Slice by resource type contained in the create-order request"

* entry contains
    patient 1..1 and
    visit 0..1 and
    imagingServiceRequest 1..1 and
    requestedProcedure 1..* and
    requester 0..* and
    performingOrganization 0..1

* entry[patient].resource only Patient
* entry[patient] ^short = "The Patient the order is for"

* entry[visit].resource only Encounter
* entry[visit] ^short = "The Visit/Encounter associated with the order, if any"

* entry[imagingServiceRequest].resource only ServiceRequest
* entry[imagingServiceRequest] ^short = "The order-level ImagingServiceRequest (RAD-2 ORC/OBR order fields)"

* entry[requestedProcedure].resource only ServiceRequest
* entry[requestedProcedure] ^short = "One or more requested procedures for the order (RAD-2 OBR requested procedure fields)"

* entry[requester].resource only Practitioner or Organization
* entry[requester] ^short = "The ordering provider and/or entering organization (PV1-8, ORC-12, ORC-17)"

* entry[performingOrganization].resource only Organization
* entry[performingOrganization] ^short = "The requesting/performing service, if different from the entering organization"

Instance: CreateOrderRequestBundle-Example
InstanceOf: CreateOrderRequestBundle
Usage: #example
Description: "An example $create-order request Bundle containing the resources needed to create a new MWL entry (RAD-2 New Order)."

* id = "example-create-order-request-bundle"
* type = #collection

* entry[patient].fullUrl = "http://goodhealth.org/fhir/Patient/example-imaging-patient"
* entry[patient].resource = ImagingPatient-Example

* entry[visit].fullUrl = "http://goodhealth.org/fhir/Encounter/example-imaging-visit"
* entry[visit].resource = ImagingVisit-Example

* entry[imagingServiceRequest].fullUrl = "http://goodhealth.org/fhir/ServiceRequest/example-imaging-service-request"
* entry[imagingServiceRequest].resource = ImagingServiceRequest-Example

* entry[requestedProcedure].fullUrl = "http://goodhealth.org/fhir/ServiceRequest/example-imaging-requested-procedure"
* entry[requestedProcedure].resource = ImagingRequestedProcedure-Example

* entry[requester].fullUrl = "http://goodhealth.org/fhir/Practitioner/example-imaging-practitioner"
* entry[requester].resource = ImagingPractitioner-Example

* entry[performingOrganization].fullUrl = "http://goodhealth.org/fhir/Organization/example-imaging-organization"
* entry[performingOrganization].resource = ImagingOrganization-Example

Profile:        OrderBundle
Parent:         Bundle
Id:             order-bundle
Title:          "Bundle - Order Result"
Description:    "Bundle returned as the `return` output parameter of the $create-order operation, and as the `bundle` output parameter of the $cancel-order operation. Represents the resulting MWL entry/entries (Task/ScheduledProcedureStep) created, updated, or cancelled, along with the resources needed to resolve the full reference chain (RAD-2/RAD-3 New Order, Status Update, and Order Cancelled semantics)."

* ^abstract = false
* type = #collection
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.ordered = false
* entry ^slicing.description = "Slice by resource type contained in the order result bundle"

* entry contains
    patient 0..1 and
    visit 0..1 and
    imagingServiceRequest 1..1 and
    requestedProcedure 0..* and
    scheduledProcedureStep 0..* and
    imagingStudy 0..* and
    scheduledStation 0..*

* entry[patient].resource only Patient
* entry[patient] ^short = "The Patient the order is for"

* entry[visit].resource only Encounter
* entry[visit] ^short = "The Visit/Encounter associated with the order, if any"

* entry[imagingServiceRequest].resource only ServiceRequest
* entry[imagingServiceRequest] ^short = "The order-level ImagingServiceRequest, reflecting its current status (RAD-2 order, or RAD-3 status update/cancellation)"

* entry[requestedProcedure].resource only ServiceRequest
* entry[requestedProcedure] ^short = "The requested procedure(s) associated with the order"

* entry[scheduledProcedureStep].resource only Task
* entry[scheduledProcedureStep] ^short = "The scheduled procedure step(s) (MWL entries) created, updated, or cancelled for the requested procedure(s)"

* entry[imagingStudy].resource only ImagingStudy
* entry[imagingStudy] ^short = "The ImagingStudy carrying the Study Instance UID assigned to the requested procedure, if scheduled"

* entry[scheduledStation].resource only Device
* entry[scheduledStation] ^short = "The scheduled station(s)/AE(s) assigned as the requested performer of the scheduled procedure step(s)"

Instance: OrderBundle-Example
InstanceOf: OrderBundle
Usage: #example
Description: "An example order result Bundle returned by $create-order, containing the resulting MWL entry and its resolvable reference chain."

* id = "example-order-bundle"
* type = #collection

* entry[patient].fullUrl = "http://goodhealth.org/fhir/Patient/example-imaging-patient"
* entry[patient].resource = ImagingPatient-Example

* entry[visit].fullUrl = "http://goodhealth.org/fhir/Encounter/example-imaging-visit"
* entry[visit].resource = ImagingVisit-Example

* entry[imagingServiceRequest].fullUrl = "http://goodhealth.org/fhir/ServiceRequest/example-imaging-service-request"
* entry[imagingServiceRequest].resource = ImagingServiceRequest-Example

* entry[requestedProcedure].fullUrl = "http://goodhealth.org/fhir/ServiceRequest/example-imaging-requested-procedure"
* entry[requestedProcedure].resource = ImagingRequestedProcedure-Example

* entry[scheduledProcedureStep].fullUrl = "http://goodhealth.org/fhir/Task/example-imaging-scheduled-procedure-step"
* entry[scheduledProcedureStep].resource = ImagingScheduledProcedureStep-Example

* entry[imagingStudy].fullUrl = "http://goodhealth.org/fhir/ImagingStudy/example-requested-procedure-imaging-study"
* entry[imagingStudy].resource = ImagingStudyRequestedProcedure-Example

* entry[scheduledStation].fullUrl = "http://goodhealth.org/fhir/Device/example-scheduled-station"
* entry[scheduledStation].resource = ScheduledStation-Example
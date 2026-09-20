Invariant:      create-order-no-filler-order
Description:    "The ImagingServiceRequest submitted in a $create-order request must not yet carry a Filler Order Number (identifier[fillerOrder]), since it has not yet been processed by the DSS/Order Filler (RAD-3 assigns the Filler Order Number)."
Severity:       #error
Expression:     "resource.ofType(ServiceRequest).identifier.where(type.coding.code='FILL').empty()"

Profile:        CreateOrderRequestBundle
Parent:         Bundle
Id:             create-order-request-bundle
Title:          "Bundle - Create Order Request"
Description:    "Bundle submitted as the `order` input parameter of the $create-order operation. Contains the ImagingServiceRequest, its RequestedProcedure(s), and the associated Patient/Encounter needed to create a new MWL entry (RAD-2 New Order semantics)."

* ^abstract = false
* type = #collection
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "$this"
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

* entry[imagingServiceRequest].resource only RAD2ImagingServiceRequestProfile
* entry[imagingServiceRequest] ^short = "The RAD-2 order-level ImagingServiceRequest; must not yet carry a Filler Order Number"
* entry[imagingServiceRequest] obeys create-order-no-filler-order

* entry[requestedProcedure].resource only ImagingRequestedProcedureProfile
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

* entry[patient].resource = ImagingPatient-Example

* entry[visit].resource = ImagingVisit-Example

* entry[imagingServiceRequest].resource = ImagingServiceRequest-PlacerExample

* entry[requestedProcedure].resource = ImagingRequestedProcedure-Example

* entry[requester].resource = ImagingPractitioner-Example

* entry[performingOrganization].resource = ImagingOrganization-Example

Profile:        RAD2ImagingServiceRequestProfile
Parent:         ImagingServiceRequestProfile
Id:             rad2-imaging-service-request
Title:          "ServiceRequest - RAD-2 Imaging Service Request"
Description:    "The ImagingServiceRequest submitted by the EHR / EMR Order Placer to the RIS / DSS as the order-level ServiceRequest in a RAD-2 create-order request. The RIS assigns the Filler Order Number during processing; it is therefore absent from this submitted resource."

* ^abstract = false
* identifier[fillerOrder] 0..0

Profile:        OrderBundle
Parent:         Bundle
Id:             order-bundle
Title:          "Bundle - Order Result"
Description:    "RIS-owned bundle containing a resulting MWL entry/entries (ImagingProcedureStep Task) and the resources needed to resolve the full reference chain. It is used as the basis for status and order exchange profiles; it is not returned by the RAD-2 `$create-order` operation."

* ^abstract = false
* type = #collection
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "$this"
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
* entry[scheduledProcedureStep] ^short = "The imaging procedure step Task(s) (MWL entries) created, updated, or cancelled for the requested procedure(s)"

* entry[imagingStudy].resource only ImagingStudy
* entry[imagingStudy] ^short = "The ImagingStudy carrying the Study Instance UID assigned to the requested procedure, if scheduled"

* entry[scheduledStation].resource only Device
* entry[scheduledStation] ^short = "The scheduled station(s)/AE(s) assigned as the requested performer of the scheduled procedure step(s)"

Instance: OrderBundle-Example
InstanceOf: OrderBundle
Usage: #example
Description: "An example RIS-owned order bundle containing the resulting MWL entry and its resolvable reference chain."

* id = "example-order-bundle"
* type = #collection

* entry[patient].resource = ImagingPatient-Example

* entry[visit].resource = ImagingVisit-Example

* entry[imagingServiceRequest].resource = ImagingServiceRequest-Example

* entry[requestedProcedure].resource = ImagingRequestedProcedure-Example

* entry[scheduledProcedureStep].resource = ImagingProcedureStep-Example

* entry[imagingStudy].resource = ImagingStudyRequestedProcedure-Example

* entry[scheduledStation].resource = ScheduledStation-Example

Profile:        RAD3OrderStatusUpdateBundle
Parent:         OrderBundle
Id:             rad3-order-status-update-bundle
Title:          "Bundle - RAD-3 Order Status Update"
Description:    "Bundle sent by the RIS / DSS / Order Filler to the EHR / EMR Order Placer to communicate a RAD-3 order status update. It contains the current RIS-owned ImagingServiceRequest and associated resources needed by the Order Placer to reconcile the order."

* ^abstract = false
* entry[imagingServiceRequest] 1..1
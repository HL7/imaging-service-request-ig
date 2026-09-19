Alias: RequestStatus = http://hl7.org/fhir/request-status

ValueSet:       ImagingServiceRequestStatusVS
Id:             imaging-service-request-status
Title:          "Imaging Service Request Status"
Description:    "The subset of ServiceRequest.status codes actually produced when populating an ImagingServiceRequest from RAD-2/RAD-3 HL7 v2 ORM/OMG order control and status codes. `draft` and `unknown` are excluded because an order is only ever created (and thus visible to FHIR consumers) once it has been placed (RAD-2 ORC-1 NW), and its status is always determinable from ORC-1/ORC-5."

* RequestStatus#active "Active" "Order Control NW/SN/XX/IP (new, in-progress order)"
* RequestStatus#on-hold "On Hold" "Order temporarily suspended, if supported by a local trading partner agreement"
* RequestStatus#revoked "Revoked" "Order Control CA/DC/OC, or Order Status DC (cancelled / discontinued)"
* RequestStatus#completed "Completed" "Order Status CM (completed)"
* RequestStatus#entered-in-error "Entered in Error" "Order was entered in error"

Instance: RisCapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition
Description: "The CapabilityStatement of the RIS interface to the MWL"
* url = "http://RIS"
* version = "0.0.1"
* title = "RIS CapabilityStatement"
* name = "RIS CapabilityStatement"
* status = #draft
* experimental = true
* date = 2024-05-18
* kind = #requirements
* fhirVersion = #5.0.0
* format[+] = #json
* rest[+]
  * mode = #server
  * operation[+]
    * name = #create-order
    * definition = Canonical( CreateOrderOperation )
    * documentation = "Accepts a RAD-2 CreateOrderRequestBundle from the EHR / EMR Order Placer and creates the RIS-owned FHIR resources for a new MWL entry"
  * resource[+]
    * type = #ServiceRequest
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #search-type
    * operation[+]
      * name = #cancel-order
      * definition = Canonical( CancelOrderOperation )
      * documentation = "Cancels a MWL entry based on a provided ImagingServiceRequest and RequestedProcedureServiceRequests"
  * resource[+]
    * type = #Task
    * profile = Canonical( ImagingScheduledProcedureStepProfile )
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #search-type
  * resource[+]
    * type = #Patient
    * profile = Canonical(  ImagingPatientProfile )
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #search-type
  * resource[+]
    * type = #Encounter
    * profile = Canonical( ImagingVisitProfile )
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #search-type
  * resource[+]
    * type = #Device
    * profile = Canonical(ScheduledStationProfile)
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #search-type
  * resource[+]
    * type = #Practitioner
    * profile = Canonical( ImagingPractitionerProfile )
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #search-type
  * resource[+]
    * type = #Organization
    * profile = Canonical( ImagingOrganizationProfile )
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #search-type
  * resource[+]
    * type = #ImagingStudy
    * profile = Canonical( ImagingStudyRequestedProcedureProfile )
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #search-type
  * resource[+]
    * type = #Procedure
    * profile = Canonical( ImagingProcedureProfile )
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #search-type

Instance: CreateOrderOperation
InstanceOf: OperationDefinition
Usage: #definition
* url = "http://tbd/create-order"
* version = "0.0.1"
* name = "Creates a new order based on the provided information."
* title = "Creates a new order based on the provided information."
* status = #draft
* kind = #operation
* code = #create-order
* description = """
This operation creates a new order based on the included Bundle.
"""
* system = true
* type = false
* instance = false
* parameter[+]
  * name = #order
  * use = #in
  * scope = #system
  * min = 1
  * max = "1"
  * type = #Bundle
  * targetProfile = Canonical( CreateOrderRequestBundle )
* parameter[+]
  * name = #outcome
  * use = #out
  * scope = #system
  * min = 0
  * max = "1"
  * type = #OperationOutcome
  * targetProfile = Canonical( OperationOutcome )

Instance: CancelOrderOperation
InstanceOf: OperationDefinition
Usage: #definition
* url = "http://tbd/cancel-order"
* version = "0.0.1"
* name = "Cancels an order based on the provided information."
* title = "Cancels an order based on the provided information."
* status = #draft
* kind = #operation
* code = #cancel-order
* description = """
This operation cancels a order based on the included Bundle.
"""
* system = false
* type = false
* instance = true
* resource = #ServiceRequest
* parameter[+]
  * name = #bundle
  * use = #out
  * scope = #instance
  * min = 0
  * max = "1"
  * type = #Bundle
  * targetProfile = Canonical( OrderBundle )
* parameter[+]
  * name = #outcome
  * use = #out
  * scope = #instance
  * min = 0
  * max = "1"
  * type = #OperationOutcome
  * targetProfile = Canonical( OperationOutcome )

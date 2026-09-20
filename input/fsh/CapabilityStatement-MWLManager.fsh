Instance: MwlManagerCapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition
Description: "The CapabilityStatement of the Modality Worklist Manager. The Modality Worklist Manager provides the DICOM MWL C-FIND service, queries RIS-owned FHIR resources, and transforms matching FHIR resources into DICOM C-FIND-RSP responses."
* url = "http://hl7.org/fhir/uv/imaging-service-request-ig/CapabilityStatement/MwlManagerCapabilityStatement"
* version = "0.0.1"
* title = "Modality Worklist Manager CapabilityStatement"
* name = "ModalityWorklistManagerCapabilityStatement"
* status = #draft
* experimental = true
* date = 2026-09-20
* kind = #requirements
* fhirVersion = #5.0.0
* format[+] = #json
* implementationGuide = Canonical(hl7.fhir.uv.imaging-service-request-ig)
* rest[+]
  * mode = #client
  * documentation = "The Modality Worklist Manager queries FHIR resources owned by the RIS and provides the DICOM Modality Worklist service to acquisition modalities. It may be grouped with the RIS or the Image Archive / Image Manager."
  * resource[+]
    * type = #ServiceRequest
    * profile = Canonical(ImagingServiceRequestProfile)
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #search-type
  * resource[+]
    * type = #Task
    * profile = Canonical(ImagingProcedureStepProfile)
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #search-type
    * interaction[+]
      * code = #update
  * resource[+]
    * type = #Patient
    * profile = Canonical(ImagingPatientProfile)
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #search-type
  * resource[+]
    * type = #Encounter
    * profile = Canonical(ImagingVisitProfile)
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
    * type = #ImagingStudy
    * profile = Canonical(ImagingStudyRequestedProcedureProfile)
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #search-type
    * interaction[+]
      * code = #update
  * resource[+]
    * type = #Procedure
    * profile = Canonical(ImagingProcedureProfile)
    * interaction[+]
      * code = #read
    * interaction[+]
      * code = #search-type
    * interaction[+]
      * code = #update

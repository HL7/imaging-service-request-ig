Instance: ImagingServiceRequest-Example
InstanceOf: ImagingServiceRequestProfile
Usage: #Example
Description: "An example of a request for a service to create an image of a body part."

* id: "imaging-service-request-example"

* identifier[0]:
  * type:
      * coding[0]:
        * system: "http://terminology.hl7.org/CodeSystem/v2-0203"
        * code: "ACSN"
  * system: "http://goodhealth.org/imaging-request"
  * value: "A12345"
* identifier[1]:
  * type:
      * coding[0]:
        * system: "http://terminology.hl7.org/CodeSystem/v2-0203"
        * code: "PLAC"
  * system: "http://goodhealth.org/imaging-request"
  * value: "P12345"
* identifier[1]:
  * type:
      * coding[0]:
        * system: "http://terminology.hl7.org/CodeSystem/v2-0203"
        * code: "FILL"
  * system: "http://goodhealth.org/imaging-request"
  * value: "F12345"  

* category: http://snomed.info/sct#363679005 "Imaging"

* subject:
  * reference: "Patient/example-imaging-patient"
  * display: "P. Example"

* encounter:
  * reference: "Encounter/example-imaging-encounter"
  * display: "Encounter with patient P. Example on 2024-04-02"
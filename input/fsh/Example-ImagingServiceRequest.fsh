Instance: ImagingServiceRequest-Example
InstanceOf: ImagingServiceRequestProfile
Usage: #example
Description: "An example of a request for a service to create an image of a body part."

* id = "imaging-service-request-example"

* identifier[accessionNumber]
  * type
    * coding
      * system = "http://terminology.hl7.org/CodeSystem/v2-0203"
      * code = #ACSN "Accession Number"
  * system = "http://goodhealth.org/imaging-request"
  * value = "A12345"
* identifier[placerOrder]
  * type
    * coding
      * system = "http://terminology.hl7.org/CodeSystem/v2-0203"
      * code = #PLAC "Placer Identifier"
  * system = "http://goodhealth.org/imaging-request"
  * value = "P12345"
* identifier[fillerOrder]
* identifier[fillerOrder].type
* identifier[fillerOrder].type.coding[0]
* identifier[fillerOrder].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[fillerOrder].type.coding[0].code = #FILL "Filler Identifier"
* identifier[fillerOrder].system = "http://goodhealth.org/imaging-request"
* identifier[fillerOrder].value = "F12345"

* category = http://snomed.info/sct#363679005 "Imaging"

* subject[0]
* subject[0].reference = "ImagingPatientProfile/example-imaging-patient"
* subject[0].display = "P. Example"

* status = #active

* intent = #order

* encounter[0]
* encounter[0].reference = "ImagingVisitProfile/example-imaging-encounter"
* encounter[0].display = "Encounter with patient P. Example on 2024-04-02"
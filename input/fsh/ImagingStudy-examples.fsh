Instance: Instance: ImagingStudy-Example-Multiple-Modality
InstanceOf: ImagingStudy
Usage: #example
Description: "An example of ImagingStudy with multiple modalities."

* id = "imaging-study-example-multiple-modality"

* identifier
  * system = "urn:dicom:uid"
  * value = "urn:oid:2.16.124.113543.1154777499.30246.19789.350343005"
* status = #available
* modality[+]
  * system = "http://dicom.nema.org/resources/ontology/DCM"
  * code = "CT"
* modality[+]
  * system = "http://dicom.nema.org/resources/ontology/DCM"
  * code = "PET"
* modality[+]
  * system = "http://dicom.nema.org/resources/ontology/DCM"
  * code = "SR"
* subject
  * reference = "Patient/dicom"
* started = "2017-01-01T11:01:20+03:00"
* basedOn
  * type = "ServiceRequest"
  * identifier
    * type
      * coding
        * system = "http://terminology.hl7.org/CodeSystem/v2-0203"
        * code = "ACSN"
      * value = "W12342398"
      * assigner
        * reference = "Organization/dicom-organization"
* numberOfSeries = 3
* numberOfInstances = 234
* series[+]
  * uid = "urn:oid:2.16.124.113543.1154777499.30246.19789.350343005.1"
  * number = 1
  * modality
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = "CT"
  * numberOfInstances = 133
* series[+]
  * uid = "urn:oid:2.16.124.113543.1154777499.30246.19789.350343005.2"
  * number = 2
  * modality
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = "PET"
  * numberOfInstances = 100
* series[+]
  * uid = "urn:oid:2.16.124.113543.1154777499.30246.19789.350343005.3"
  * number = 101
  * modality
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = "SR"
  * numberOfInstances = 1

Instance: ImagingSelection-3DImageRegionSelection
InstanceOf: ImagingSelection
Usage: #example
Description: "An example of a 3D image region selection."

* id = "example-2d-image-region-selection"

* status = #available
* code
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = #111030
* subject
  * type = "Patient"
  * identifier
    * system = "https://fhirhospital.org"
    * value = "KUTGIQCVCDRHVBUK"
* frameOfReferenceUid = "1.2.840.113747.20080222.35738167372924306270412538783781.1.0"
* imageRegion3D
  * regionType = #ellipse
  * coordinate[+] = -50.0
  * coordinate[+] = -50.0
  * coordinate[+] = -50.0
  * coordinate[+] = 50.0
  * coordinate[+] = 50.0
  * coordinate[+] = 50.0
  * coordinate[+] = 25.0
  * coordinate[+] = -25.0
  * coordinate[+] = 0.0
  * coordinate[+] = -25.0
  * coordinate[+] = 25.0
  * coordinate[+] = 0.0

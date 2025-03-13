Instance: ImagingSelection-2DImageRegionSelection
InstanceOf: ImagingSelection
Usage: #example
Description: "An example of a 2D image region selection."

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
* derivedFrom
  * type = "ImagingStudy"
  * identifier
    * system = "urn:dicom:uid"
    * value = "urn:oid:1.2.840.113747.20080222.35738167372924306270412538783781"
* studyUid = "1.2.840.113747.20080222.35738167372924306270412538783781"
* seriesUid = "1.2.840.113747.20080222.35738167372924306270412538783781.1"
* frameOfReferenceUid = "1.2.840.113747.20080222.35738167372924306270412538783781.1.0"
* instance
  * uid = "1.2.840.113747.20080222.35738167368358372924412538783781.1.0"
  * sopClass = "urn:oid:1.2.840.10008.5.1.4.1.1.2"
  * imageRegion2D
    * regionType = #polyline
    * coordinates
      * 0.25
      * 0.25
      * 0.75
      * 0.25
      * 0.75
      * 0.75
      * 0.25
      * 0.75

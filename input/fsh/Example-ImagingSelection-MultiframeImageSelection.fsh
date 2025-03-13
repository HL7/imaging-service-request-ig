Instance: ImagingSelection-MultiframeImageSelection
InstanceOf: ImagingSelection
Usage: #example
Description: "An example of a multiframe image selection."

* id = "example-multiframe-image-selection"

* status = #available
* code
  * coding
    * system = "http://dicom.nema.org/resources/ontology/DCM"
    * code = #113036 "Group of Frames for Display"
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
* seriesUid = "1.2.840.113747.20080222.35738167372924306270412538783781.2"
* frameOfReferenceUid = "1.2.840.113747.20080222.35738167372924306270412538783781.0"
* instance
  * uid = "1.2.840.113747.20080222.35738167368358372924412538783781.2.1"
  * sopClass = "urn:oid:1.2.840.10008.5.1.4.1.1.2.1"
  * subset = "1,2,3,4"

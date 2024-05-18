Alias: DCM = http://dicom.nema.org/resources/ontology/DCM
Alias: SCT = http://snomed.info/sct
Alias: LOINC =  http://loinc.org
Alias: DCMIdType = http://hl7.org/fhir/uv/dicom-sr/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ImagingPatientProfile
Parent:         Patient
Id:             imaging-patient
Title:          "Patient - DICOM MWL Patient Mapping"
Description:    "DICOM MWL Mapping to Patient"

* ^abstract = true
* insert DICOMMWLStructureDefinitionContent

Instance: ImagingPatient-Example
InstanceOf: ImagingPatientProfile
Usage: #example
Description: "An example of the Patient resource included in a MWL response."

* id = "example-imaging-patient"
* identifier
  * type
    * coding
      * system = "http://terminology.hl7.org/CodeSystem/v2-0203"
      * code = #MR "Medical record number"
  * system = "http://goodhealth.org/mrn"
  * value = "PID12345"
* name
  * family = "PLUTONIUM"
  * given = "DANIELLE"
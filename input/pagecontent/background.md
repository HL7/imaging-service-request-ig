This chapter describes the scope of this guide, provides background information, key concepts,
and describes the use cases supported by this implementation guide.

1. [Problem](problem) - Description of the Problem
2. [Scope](#scope) - Scope of the IG
3. [Intended Readers](#readers) - Intended readers of the IG
4. [Use cases](#use-cases) - Key use cases covered by the IG
5. [Glossary](#glossary) - Glossary of terms used in this IG
6. [References](#references) - Useful references

### Problem<a name="problem"></a>

DICOM Structured Report (DICOM SR) is a standard for recording clinical imaging observations made regarding a diagnostic or interventional imaging procedure. Imaging Observations are made by humans, such as a sonographer making measurements on recently acquired ultrasound image, a Radiologist recording observations on suspected lesions, or by a machine, such as an automated AI Algorithm providing qualitative and quantitative observations.

DICOM SR is widely adopted by Imaging-based devices and IT systems. Non-imaging based Healthcare IT Systems, generally, do not support DICOM SR. Non-imaging healthcare systems support HL7 standards, such as FHIR. HL7 has defined Observations as the standardized method for recording clinical observations. Bridging the two standards for clinical imaging observations is necessary for interoperability between these type of systems.

### Scope<a name="scope"></a>

#### In Scope
* Resource profiles
  * Imaging Service Request as ServiceRequest
  * Requested Procedure as either a ServiceRequest
  * Scheduled Procedure Step as Task
* Content maps
  * ORM, OMI, OMG to Imaging Service Request and child resources
  * Imaging Service Request to DICOM MWL C-FIND RSP

#### Out of Scope
* Mapping DICOM MPPS to FHIR
* Modelling entire image ordering workflow

### Intended Readers<a name="readers"></a>
This Implementation Guide is intended for

*To be created*


### Use cases<a name="use-cases"></a>
Two use cases were identified.

#### Use case 1: Populated DICOM MWL C-FIND Responses from FHIR

#### Use case 2: FHIR-based MWL query

### Glossary<a name="glossary"></a>

The following terms and acronyms are used within the Radiation Dose Summary IG:

|Term|Definition|
|-----|-----------------|
|ATNA| Audit Trail and Node Authentication |
|CID| Context Identifier |
|DICOM| Digital Imaging and Communications in Medicine |
|EHR| Electronic Health Record |
|EMR| Electronic Medical Record |
|FHIR| Fast Healthcare Interoperability Resources |
|HL7| Health Level Seven|
|IG| Implementation Guide |
|IHE| Integrating the Healthcare Enterprise |
|IOD| Information Object Definition |
|MWL| Modality Worklist
|RIS| Radiology Information System |
|TLS| Transport Layer Security |
|UID| Unique identifier |
|URL| Uniform Resource Locator |
|URN| Uniform Resource Name |

### References<a name="references"></a>

1. DICOM,[DICOM PS3.4 Section K.6: Modality Worklist SOP Class](https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_K.6.html)
2. IHE Radiology (RAD), [Technical Framework Supplement, AI Results (AIR)](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_AIR.pdf)
3. HL7 IG [HL7 Version 2 to FHIR](https://build.fhir.org/ig/HL7/v2-to-fhir/)
4. HL7 IG [Clinical Order Worfklows Implementation Guide](https://build.fhir.org/ig/HL7/fhir-cow-ig/)
5. HL7 IG [Order Catalog Implementation Guide](https://build.fhir.org/ig/HL7/fhir-order-catalog/)

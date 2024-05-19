This chapter describes the scope of this guide, provides background information, key concepts,
and describes the use cases supported by this implementation guide.

1. [Problem](problem) - Description of the Problem
2. [Scope](#scope) - Scope of the IG
3. [Intended Readers](#readers) - Intended readers of the IG
4. [Use cases](#use-cases) - Key use cases covered by the IG
5. [Glossary](#glossary) - Glossary of terms used in this IG
6. [References](#references) - Useful references

### Problem<a name="problem"></a>
The DICOM Modality Worklist (MWL) service provides DICOM acquisition devices with information from the ordering system (patient, visit, procedure, etc.).

The mapping between HL7 V2 and DICOM Modality Worklist (MWL) is well-defined. However, the mapping from equivalent FHIR resources is not.

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

### Relationship to IHE Scheduled Workflow<a name="ihe-scheduled-workflow"></a>
#### Actors
The following SWF actors are relevant to this profile:
- Order Placer
- Department System Scheduler / Order Filler (DSS)
- Image Manager / Image Archive
- Acquisition Modality

#### Transactions
The following SWF transactions are relevant to this profile.

##### Placer Order Management \[RAD-2\]
- Order Placer communication to DSS / Order Filler
- Order message content is relatively sparse
- Messages:
  - New Order From Order Placer
  - Order Cancelled by Order Placer
##### Filler Order Management \[RAD-3\]
- DSS / Order Filler communication to Order Placer
- Updates Order Placer on changes made to orders by the DSS
- Messages:
  - New Order From Order Filler or Change Order Form
  - Order Status Update
  - Order Cancelled By the Order Filler
##### Procedure Scheduled \[RAD-4\] / Procedure Updated \[RAD-13\]
- DSS / Order Filler communication to Image Archive / Image Manager
- Used to match / reconcile orders with images

##### Query Modality Worklist \[RAD-5\]
- Acquisition Modality queries DSS / Order Filler for worklist entries
- Used to populate the modality worklist

### Mapping to FHIR Operations
This implementation guide includes FHIR operations to cover:
- Creation of orders from Order Placer to DSS / Order Filler (\[RAD-2\])
- Cancellation of orders by the Order Placer (\[RAD-2\])
- Provision of order details and status updates from DSS / Order Filler to Order Placer (\[RAD-3\]) and the Image Archive / Image Manager (\[RAD-4\] / \[RAD-13\])

The following SWF transactions are not modelled in FHIR:
- Schedule Procedure and / or Assign Protocol
  - It is expected that the MWL service can populate this information based on the order creation request
  - The mechanism by which it does so is out of scope
- Modality Worklist Query
  - Modality Worklist Query remains a DICOM operation
  - The operation by which the Order Filler and Image Manage / Image Archive retrieve order details may be a suitable basis for this query


### Use cases<a name="use-cases"></a>
Two use cases were identified.

#### Use case 1: Populate DICOM MWL C-FIND Responses from FHIR

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
2. IHE Radiology (RAD), [HL7 Order Mapping to DICOM MWL)](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol2x.pdf), Appendix B
3. IHE Radiology (RAD), [Scheduled Workflow (SWF)](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol1.pdf), Section 3
4. HL7 IG [HL7 Version 2 to FHIR](https://build.fhir.org/ig/HL7/v2-to-fhir/)
5. HL7 IG [Clinical Order Worfklows Implementation Guide](https://build.fhir.org/ig/HL7/fhir-cow-ig/)
6. HL7 IG [Order Catalog Implementation Guide](https://build.fhir.org/ig/HL7/fhir-order-catalog/)

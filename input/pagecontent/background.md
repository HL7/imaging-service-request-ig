This chapter describes the scope of this guide, provides background information, key concepts,
and describes the use cases supported by this implementation guide.

1. [Problem](#problem) - Description of the Problem
2. [Scope](#scope) - Scope of the IG
3. [Intended Readers](#readers) - Intended readers of the IG
4. [Relationship to IHE Scheduled Workflow](#ihe-scheduled-workflow) - Relationship to IHE Radiology Scheduled Workflow Profile
5. [Use cases](#use-cases) - Key use cases covered by the IG
6. [Glossary](#glossary) - Glossary of terms used in this IG
7. [References](#references) - Useful references

### Problem<a name="problem"></a>

The DICOM Modality Worklist (MWL) service provides DICOM acquisition devices with information from the ordering system (patient, visit, procedure, etc.).

The mapping between HL7 V2 and DICOM Modality Worklist (MWL) is well-defined. However, the mapping from equivalent FHIR resources is not.

### Scope<a name="scope"></a>

#### In Scope

* Resource profiles
  * Imaging Service Request as ServiceRequest
  * Requested Procedure as a ServiceRequest
  * Imaging Procedure Step as a Task, updated from scheduled to performed
    state in response to MPPS
* Content maps
  * ORM, OMI, OMG to Imaging Service Request and child resources
  * Imaging Service Request to DICOM MWL C-FIND RSP

#### Out of Scope

* Modeling entire image ordering workflow

### Intended Readers<a name="readers"></a>

This Implementation Guide is intended for

* EHR / EMR vendors and implementers who want to submit imaging orders to a RIS / DSS / Order Filler using FHIR
* RIS / DSS / Order Filler vendors and implementers who want to receive imaging orders from an EHR / EMR using FHIR and own the resulting FHIR resources
* Modality Worklist Manager vendors and implementers who want to expose a DICOM MWL service and query RIS-owned FHIR resources on behalf of acquisition modalities
* Modality vendors and implementers who want to query a DICOM MWL service for scheduled procedures

### Relationship to IHE Scheduled Workflow<a name="ihe-scheduled-workflow"></a>

#### Actors

The actors shown in the workflow are:

* EHR / EMR (Order Placer)
* RIS (DSS / Order Filler)
* Modality Worklist Manager
  * May be grouped with the RIS or the Image Archive / Image Manager
* Modality (Acquisition Modality)
* Image Archive / Image Manager

The RIS owns the FHIR resources defined by this guide and exposes the
`$create-order` operation. The EHR / EMR invokes that operation directly on the
RIS using the RAD-2 request bundle. The operation acknowledges the request;
the RIS does not return the newly created MWL resources at this stage. A later
RAD-3 status update is represented by `RAD3OrderStatusUpdateBundle`.

#### Transactions

The following SWF transactions are relevant to this profile. The FHIR
operations and profiles that support them are described below; this guide does
not define an operation for every SWF transaction.

##### Placer Order Management \[RAD-2\]

* Order Placer communication to DSS / Order Filler
* Order message content is relatively sparse
* Messages:
  * New Order From Order Placer
  * Order Canceled by Order Placer

##### Filler Order Management \[RAD-3\]

* DSS / Order Filler communication to Order Placer
* Updates Order Placer on changes made to orders by the DSS
* Messages:
  * New Order From Order Filler or Change Order Form
  * Order Status Update
  * Order Canceled By the Order Filler

##### Procedure Scheduled \[RAD-4\] / Procedure Updated \[RAD-13\]

* DSS / Order Filler communication to Image Archive / Image Manager
* Used to match / reconcile orders with images

##### Query Modality Worklist \[RAD-5\]

* Acquisition Modality queries the Modality Worklist Manager for worklist entries
* Used to populate the modality worklist

### Mapping to FHIR Operations

This implementation guide defines the following FHIR operations and exchange
profiles:

* `$create-order` — invoked by the EHR / EMR Order Placer on the RIS / DSS /
  Order Filler to submit a RAD-2 `CreateOrderRequestBundle`. The RIS creates
  and owns the resulting FHIR resources and returns an acknowledgement rather
  than the newly created MWL resources.
* `$cancel-order` — invoked against the RIS-owned `ServiceRequest` to represent
  cancellation by the Order Placer under RAD-2.
* `RAD3OrderStatusUpdateBundle` — a bundle profile for a later RIS / DSS /
  Order Filler status update to the EHR / EMR Order Placer. This is a profile,
  not a separately defined FHIR operation.
* RAD-4 / RAD-13 resource mappings — the profiles and resource relationships
  needed for RIS / DSS / Order Filler procedure and study reconciliation with
  the Image Archive / Image Manager. These are integration points, not
  separately defined FHIR operations.

The following SWF transactions are not modeled as FHIR operations:

* Schedule Procedure and / or Assign Protocol
  * It is expected that the MWL service can populate this information based on the order creation request
  * The mechanism by which it does so is out of scope
* Modality Worklist Query
  * Modality Worklist Query remains a DICOM operation
  * The Modality Worklist Manager transforms the DICOM query into FHIR queries against RIS-owned resources and transforms the results into the DICOM C-FIND-RSP
* Modality acquisition completion and performed-work reconciliation
  * The modality-to-RIS completion mechanism is implementation-dependent
  * The RIS may update `ImagingStudy`, `Procedure`, and performed-procedure-step resources

### Use cases<a name="use-cases"></a>

The following workflow shows how the actors and transactions in this guide fit
together:

<figure>
  {% include imaging_service_request_workflow.svg %}
  <figcaption><b>Figure: Imaging Service Request workflow</b></figcaption>
  <p></p>
</figure>

The diagram source is
`input/images-source/imaging_service_request_workflow.plantuml`.

#### Use case 1: Create an imaging order

1. The EHR / EMR Order Placer invokes `$create-order` on the RIS using a RAD-2
   `CreateOrderRequestBundle`. The bundle contains:
   * one RAD-2 `ImagingServiceRequest` order-level `ServiceRequest`, without a
     Filler Order Number;
   * one or more `ImagingRequestedProcedureProfile` resources;
   * the associated Patient and, when applicable, Encounter resources; and
   * optional requester and performing-organization resources.
2. The RIS processes the request and creates and owns the resulting FHIR
   resources needed for the order and MWL entry, including the
   `ImagingServiceRequest`, requested procedure, patient, encounter,
   scheduled-procedure-step `Task`, scheduled-station `Device`, and associated
   `ImagingStudy`.

The operation returns an acknowledgement; the newly created MWL resources are
not returned at this stage.

#### Use case 2: Populate and query the modality worklist

1. The modality issues a DICOM C-FIND query to the Modality Worklist Manager.
   The Modality Worklist Manager transforms the DICOM matching and return-key
   criteria into a set of FHIR queries against resources owned by the RIS.
2. The Modality Worklist Manager sends those FHIR queries to the RIS. The RIS
   resolves the scheduled `Task` and its references to the requested procedure,
   `ImagingServiceRequest`, patient, encounter, scheduled station, and
   `ImagingStudy`, and returns the matching FHIR resources.
3. The Modality Worklist Manager transforms the FHIR resources into the
   corresponding DICOM C-FIND-RSP worklist entry and returns it to the
   modality.

#### Use case 3: Reconcile acquired images and performed work

1. The modality sends the acquired study to the Image Archive / Image Manager.
2. The modality sends DICOM Modality Performed Procedure Step (MPPS) messages
   to the Modality Worklist Manager.
3. In response, the Modality Worklist Manager updates the RIS-owned FHIR
   resources representing the performed work, including `ImagingStudy`,
   `Procedure`, and performed-procedure-step resources.

#### Use case 4: Communicate order status

The RIS communicates the current order status back to the EHR / EMR through a
RAD-3 status update represented by `RAD3OrderStatusUpdateBundle`. The RIS also
supports procedure and study reconciliation with the Image Archive / Image
Manager for RAD-4 / RAD-13 integration.

### Glossary<a name="glossary"></a>

The following terms and acronyms are used within this Implementation Guide:

|Term|Definition|
|-----|-----------------|
|AE| Application Entity (DICOM) |
|ACK| Acknowledgement message |
|C-FIND| DICOM query operation |
|C-FIND-RSP| DICOM query response |
|DICOM| Digital Imaging and Communications in Medicine |
|DSS| Department System Scheduler / Order Filler |
|EHR| Electronic Health Record |
|EMR| Electronic Medical Record |
|ERR| Error segment (HL7 v2) |
|FHIR| Fast Healthcare Interoperability Resources |
|HL7| Health Level Seven|
|IG| Implementation Guide |
|IHE| Integrating the Healthcare Enterprise |
|IOD| Information Object Definition |
|MSA| Message Acknowledgment segment (HL7 v2) |
|MSH| Message Header segment (HL7 v2) |
|MPPS| Modality Performed Procedure Step |
|MWL| Modality Worklist |
|OBR| Observation Request segment (HL7 v2) |
|OMI| Imaging order message (HL7 v2) |
|OMG| General clinical order message (HL7 v2) |
|ORC| Common Order segment (HL7 v2) |
|ORM| General order message (HL7 v2) |
|ORG| General acknowledgment message (HL7 v2) |
|ORR| Order acknowledgment message (HL7 v2) |
|PACS| Picture Archiving and Communication System |
|PID| Patient Identification segment (HL7 v2) |
|RAD| IHE Radiology domain |
|RIS| Radiology Information System |
|SOP| Service-Object Pair (DICOM) |
|SWF| Scheduled Workflow |
|PV1| Patient Visit segment (HL7 v2) |
|TQ1| Timing/Quantity segment (HL7 v2) |
|UID| Unique Identifier |
|URL| Uniform Resource Locator |
|URN| Uniform Resource Name |
|C-FIND| DICOM query operation |
|C-FIND-RSP| DICOM query response |

### References<a name="references"></a>

1. DICOM,[DICOM PS3.4 Section K.6: Modality Worklist SOP Class](https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_K.6.html)
2. IHE Radiology (RAD), [HL7 Order Mapping to DICOM MWL)](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol2x.pdf), Appendix B
3. IHE Radiology (RAD), [Scheduled Workflow (SWF)](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol1.pdf), Section 3
4. HL7 IG [HL7 Version 2 to FHIR](https://build.fhir.org/ig/HL7/v2-to-fhir/)
5. HL7 IG [Clinical Order Worfklows Implementation Guide](https://build.fhir.org/ig/HL7/fhir-cow-ig/)
6. HL7 IG [Order Catalog Implementation Guide](https://build.fhir.org/ig/HL7/fhir-order-catalog/)

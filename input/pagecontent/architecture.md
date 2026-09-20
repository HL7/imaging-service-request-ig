### DICOM Modality Worklist (MWL) Information Model<a name="mwl-information-model"></a>

### Profile-aligned workflow<a name="profile-aligned-workflow"></a>

The diagram below shows how the profiles and operations in this guide fit into a
typical order-to-acquisition workflow. The source is available in
`input/images-source/imaging_service_request_workflow.plantuml`.

The `$create-order` operation represents the order submission to the RIS/DSS
and returns an `OrderBundle` containing the resources needed to resolve a
Modality Worklist entry. A DICOM MWL C-FIND query is then answered by mapping
the scheduled `Task` and its reference chain to a DICOM worklist response.
The acquisition-completion and EHR status-update exchanges are shown as
integration points: this guide provides relevant profiles, but does not define
one end-to-end transaction for them.

While each DICOM MWL entry is represented in FHIR as a single `Task` resource, the MWL entry is conceptually composed of multiple related resources. The following table shows the DICOM MWL information model and its corresponding FHIR resources:

<figure>
  {% include mwl_information_model.svg %}
  <figcaption><b>Figure: Modality Worklist Information Model\n(DICOM PS3.4 Figure K.6-1, annotated with FHIR resource mappings)</b></figcaption>
  <p></p>
</figure>


### Structure of a Modality Worklist Query Response<a name="mwl-structure"></a>

Each Modality Worklist Entry / MWL Query Response contains the following segments:

| Modality Worklist Entry |
|-------------------------|
| *Patient* <br> - Patient identifiers <br> - Patient demographics |
| *Visit (Encounter)* <br> - Visit identifiers <br> - Location |
| *Imaging Service Request (Service Request)* <br> - Accession Number <br> - Placer Order Number / Filler Order Number |
| *Requested Procedure (Service Request)* <br> - Reason for Requested Procedure <br> - Requested Procedure ID    |
| *Imaging Study* <br> - Study Instance UID |
| *Scheduled Procedure Step (Task)* <br> - Procedure Code <br> - Requested Procedure Start Date / Time |
| *Scheduled Station (Device)* <br> - AE Title |

### MWL Resource Reference Chain<a name="mwl-reference-chain"></a>

Each MWL entry corresponds to a Scheduled Procedure Step, modeled as a Task resource (`ImagingScheduledProcedureStepProfile`). To assemble a complete MWL entry, resolve the following reference chain starting from that Task:

1. **Task** (`ImagingScheduledProcedureStepProfile`)
   - This is the scheduled procedure step and the starting point for the MWL entry.

2. **Task.basedOn[requestedProcedureRef]**
   - Resolves to the Requested Procedure resource (`ImagingRequestedProcedureProfile`), a `ServiceRequest`.

3. From the Requested Procedure, read:
   - `subject` -> `ImagingPatientProfile`
   - `encounter` -> `ImagingVisitProfile`
   - `basedOn[imagingServiceRequestRef]` -> `ImagingServiceRequestProfile`

4. From the parent `ImagingServiceRequestProfile`, read:
   - `identifier[accessionNumber]`
   - `identifier[fillerOrder]`
   - `basedOn[placerOrderRef].identifier` (logical reference to the RAD-2 Placer Order; not a resolvable FHIR resource)
   - `subject` -> `ImagingPatientProfile`
   - This provides the ordering and accession identifiers needed for the MWL entry.
   - **Note:** `identifier[fillerOrder]` is populated once the DSS/Order Filler has processed the order (RAD-3); it is absent on a freshly-submitted RAD-2 order. `CreateOrderRequestBundle` enforces this via an invariant on its `imagingServiceRequest` entry rather than a separate profile, since both states are the same resource at different points in its lifecycle. The Placer Order Number is always available (it is assigned when the order is first placed on RAD-2), but since the RAD-2 order is not modeled as a FHIR resource in this IG, it is carried via `basedOn[placerOrderRef]` as a logical reference (an `Identifier` of type `PLAC`, with no resolvable `reference`) rather than as an `identifier` on `ImagingServiceRequestProfile` itself.

5. If the Study Instance UID is needed, resolve the associated **ImagingStudy**:
   - Use `ImagingStudy.basedOn` referencing the same `ImagingServiceRequestProfile` and/or the same Requested Procedure.
   - Read `ImagingStudy.identifier[studyInstanceUid].value` (system `"urn:dicom:uid"`).
   - This is the canonical location for the Study Instance UID in the FHIR model.

6. From the Task, read **requestedPerformer[scheduledStation]**
   - Resolves to the scheduled station/device resource (`ScheduledStationProfile`), providing the requested performer / scheduled station information.

7. Optionally, read `Task.code` and `Task.requestedPeriod`
   - `code.text` = scheduled procedure step description
   - `requestedPeriod.start`/`end` = scheduled time window

The complete chain is:

```
Task
  -> basedOn -> RequestedProcedure
      -> subject -> Patient
      -> encounter -> Visit
      -> basedOn -> ImagingServiceRequest
  -> requestedPerformer -> ScheduledStation
  -> linked ImagingStudy (by same basedOn or subject/encounter relationship)
  -> Study Instance UID from ImagingStudy.identifier[studyInstanceUid]
```

This preserves the intended MWL structure:
- **Task** = scheduled step
- **ServiceRequest** = requested procedure / order
- **ImagingStudy** = study identity
- **Patient / Encounter** = demographics and visit context
- **Device (ScheduledStation)** = performer / location context

### Relationship to the Performed Procedure<a name="mwl-procedure-relationship"></a>

The DICOM Modality Worklist itself only describes *scheduled* work; it does not carry information about the *performed* procedure. Once a Scheduled Procedure Step has been carried out, its execution can be represented as a FHIR `Task` resource (`ImagingPerformedProcedureStepProfile`) that records the actual execution period. Both scheduled and performed procedure-step profiles derive from the abstract `ImagingProcedureStepProfile`, which supplies their common requested-procedure linkage, patient and encounter context, procedure code, modality, and order-derived Task intent.

The performed-step Task and the scheduled-step Task both reference the same Requested Procedure. The performed-step Task is not part of the MWL query/response.

```
Task (ImagingPerformedProcedureStepProfile)
  -> basedOn[requestedProcedureRef] -> RequestedProcedure
  -> for -> Patient
  -> encounter -> Visit
```

The clinical act may additionally be represented as a FHIR `Procedure` resource (`ImagingProcedureProfile`):

```
Procedure (ImagingProcedureProfile)
  -> basedOn[requestedProcedureRef] -> RequestedProcedure
  -> subject -> Patient
  -> encounter -> Visit
```

`Procedure` is not part of the MWL query/response itself and is not referenced by `Task`; it is a downstream resource that an implementer may create after the scheduled procedure step has been performed, linked back to the same `RequestedProcedure` that the Tasks are `basedOn`.

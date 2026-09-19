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
   - `identifier[placerOrder]`
   - `identifier[fillerOrder]`
   - `subject` -> `ImagingPatientProfile`
   - This provides the ordering and accession identifiers needed for the MWL entry.

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

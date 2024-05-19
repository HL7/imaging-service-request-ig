This Implementation Guide defines the use of FHIR resources to convey measurements, derived measurements and  Qualitative Evaluations extracted from a DICOM SR Measurement Report.

### Organization of this implementation guide

This IG is organized into three main sections:

* [Chapter I](background.html): Background - Introduction and overview
    * [Problem](background.html#problem) - Description of the problem
    * [Scope](background.html#scope) - Scope of the IG
    * [Intended Readers](background.html#readers) - Intended readers of the IG
    * [Relationship to IHE Scheduled Workflow](background.html#ihe-scheduled-workflow) - Relationship to IHE Radiology Scheduled Workflow Profile
    * [Use cases](background.html#use-cases) - Key use cases covered by the IG
    * [Glossary](background.html#glossary) - Glossary
    * [References](background.html#references) - References

[comment]: <> (* [Chapter II]&#40;architecture.html&#41;: Architecture & Implementation)

[comment]: <> (    * [Profiles & Extensions]&#40;architecture.html#profiles&#41; - FHIR Profiles and extensions defined in the IG)

[comment]: <> (      * [Resources]&#40;architecture.html#resources&#41; - FHIR Resource Profiles)

[comment]: <> (        * [Observation]&#40;architcture.html#observation&#41; - Observation)

[comment]: <> (        * [ImagingSelection]&#40;architcture.html#imagingselection&#41; - ImagingSelection)

[comment]: <> (        * [Device]&#40;architcture.html#device&#41; - Device)

[comment]: <> (        * [BodySite]&#40;architcture.html#bodysite&#41; - BodySite)

[comment]: <> (      * [Data Types]&#40;architcture.html#datatypes&#41; - FHIR Data Type Profiles)

[comment]: <> (      * [Extensions]&#40;architecture.html#extensions&#41; - FHIR Extensions)

[comment]: <> (      * [Profile Relationships]&#40;architecture.html#relationships&#41; - Relationships between profiled FHIR resources and other standards)

[comment]: <> (        * [DICOM SR Basics]&#40;architecture.html#dicom-sr&#41; - Overview of DICOM SR and terminology)

[comment]: <> (        * [Relationship to DICOM SR TID 1500 Measurement Report]&#40;architecture.html#tid-1500&#41; - Mapping of content from DICOM SR Measurement Report)

[comment]: <> (          * [Imaging Measurement Group Relationship]&#40;architecture.html#imaging-measurement-group&#41; - Mapping of imaging measurement groups)

[comment]: <> (          * [Derived Imaging Measurements Relationship]&#40;architecture.html#derived-imaging-measurement&#41; - Mapping of derived imaging measurements)

[comment]: <> (          * [Imaging Qualitative Evaluations Relationship]&#40;architecture.html#imaging-qualitative-evalutation&#41; - Mapping of imaging qualitative evaluations)

[comment]: <> (        * [Device Relationship]&#40;architecture.html#relationship-device&#41; - Mapping of devices from a DICOM SR Measurement Report)

[comment]: <> (    * [Actors]&#40;architecture.html#actors&#41; - Actors participating in the IG)

[comment]: <> (    * [Terminology]&#40;architecture.html#terminology&#41; - Value Sets defined and used)

[comment]: <> (    * [Security Consideration]&#40;architecture.html#sec&#41; - Security aspects to be taken in consideration)

[comment]: <> (* [Chapter III]&#40;mapping.html&#41;: Measurement Report Processing Mapping)

[comment]: <> (    * [DICOM SR Measurement Report Instance Mapping]&#40;mapping.html#sr_instance&#41;)

[comment]: <> (    * [DICOM SR Document Mapping]&#40;mapping.html#sr_document&#41;)

[comment]: <> (    * [Imaging Measurements Container Mapping]&#40;mapping.html#imaging_measurements_container&#41;)

[comment]: <> (    * [Imaging Measurement Group Mapping]&#40;mapping.html#sr_iimaging_measurement_groupnstance&#41;)

[comment]: <> (* [Chapter IV]&#40;testing.html&#41;: Testing & Conformance)

[comment]: <> (    * [Test Plan]&#40;testing.html#testplan&#41; - Test plans for the different actors)

[comment]: <> (    * [Test Data]&#40;testing.html#testdata&#41; - Test data that can be used)

[comment]: <> (    * [Resources Samples]&#40;testing.html#samples&#41; - Samples of resources profiled following this IG)

### Copyrights and acknowledgments

This document is licensed under Creative Commons "No Rights Reserved" (CC0).

#### Value Sets
Value Sets in this guide include:

* Vocabulary Content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organization (IHTSDO) and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement
* Vocabulary Content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at LOINC/license.

#### Trademarks
LOINC® is a registered United States trademark of Regenstrief Institute, Inc.

SNOMED® and "SNOMED CT" are registered trademarks of the IHTSDO.

HL7®, HEALTH LEVEL SEVEN®, FHIR® and the FHIR® Logo are trademarks owned by Health Level Seven International, registered with the United States Patent and Trademark Office.

DICOM® is a registered trademark of the National Electrical Manufacturers Association for its standards publications relating to digital communications of medical information.

IHE® is a registered trademark of the Healthcare Information Management Systems Society in the United States and trademarks of IHE Europe in the European Community.


### Sponsors Working Groups
* [Imaging Integration Work Group](http://www.hl7.org/Special/committees/imagemgt/index.cfm)

### Contributors

| Name        |      Organization       |  Role |
|--------------------------|-----------------------|--------------|
| Jonathan Whitby | Canon Medical | Author |
| Brian Bialecki | American College of Radiology | Author |

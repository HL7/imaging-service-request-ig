This Implementation Guide defines the use of FHIR resources to convey measurements, derived measurements and  Qualitative Evaluations extracted from a DICOM SR Measurement Report.

### Organization of this implementation guide

This IG is organized into three main sections:

* [Chapter I](background.html): Background - Introduction and overview
  * [Problem](background.html#problem) - Description of the problem
  * [Scope](background.html#scope) - Scope of the IG
  * [Intended Readers](background.html#readers) - Intended readers of the IG
  * [Relationship to IHE Scheduled Workflow](background.html#ihe-scheduled-workflow) - Relationship to IHE Radiology Scheduled Workflow Profile
  * [Use cases](background.html#use-cases) - Key use cases covered by the IG
  * [Glossary](background.html#glossary) -- Glossary
  * [References](background.html#references) -- References
* [Chapter II](architecture.html): Architecture & Implementation
  * [DICOM Modality Worklist (MWL) Information Model](architecture.html#mwl-information-model) - DICOM MWL information model and FHIR resource mappings
  * [Workflow responsibilities](architecture.html#profile-aligned-workflow) - Responsibilities and resource ownership across the order-to-acquisition workflow
  * [MWL Structure](architecture.html#mwl-structure) - Structure of a Modality Worklist Query Response
  * [MWL Resource Reference Chain](architecture.html#mwl-reference-chain) - FHIR references used to assemble an MWL entry
  * [Relationship to the Performed Procedure](architecture.html#mwl-procedure-relationship) - MPPS updates and downstream performed-procedure modeling


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
| Bas van den Heuval | Philips | Author |

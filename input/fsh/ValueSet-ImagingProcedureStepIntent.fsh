Alias: TaskIntent = http://hl7.org/fhir/task-intent

ValueSet:       ImagingProcedureStepIntentVS
Id:             imaging-procedure-step-intent
Title:          "Imaging Procedure Step Intent"
Description:    "Task intent codes that represent an order or an order-derived imaging procedure step. Planning, proposal, option, and unknown intents are excluded."

* TaskIntent#order "Order"
* TaskIntent#original-order "Original Order"
* TaskIntent#reflex-order "Reflex Order"
* TaskIntent#filler-order "Filler Order"
* TaskIntent#instance-order "Instance Order"

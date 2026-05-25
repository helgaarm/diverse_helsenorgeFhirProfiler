Extension: BusinessStatusExtension
Id: businessStatus
Title: "Business status of a request - including referals"
Description: "Business status of a request - including referals"
* ^url = "http://helsenorge.no/fhir/StructureDefinition/businessstatus"
* ^version = "1.3.2"
* ^jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* . ^short = "Business status of a request - including referals"
* . ^definition = "Business status of a request - including referals"
* url = "http://helsenorge.no/fhir/StructureDefinition/businessstatus" (exactly)
* valueCodeableConcept 0..1
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept ^sliceName = "valueCodeableConcept"
* valueCodeableConcept.coding 1..
* valueCodeableConcept.coding.system 1..
* valueCodeableConcept.coding.code 1..
* valueCodeableConcept.coding.code ^short = "Request business status"
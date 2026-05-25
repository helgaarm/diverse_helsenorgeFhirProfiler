Extension: NoMottattDato
Id: mottattDato
Title: "Mottatt dato"
Description: "Date and time when the order was received."
* ^url = "http://helsenorge.no/fhir/StructureDefinition/no-mottatt-dato"
* ^version = "1.3.2"
* ^date = "2025-10-20T21:59:35+00:00"
* ^jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* . ^short = "Mottatt dato"
* . ^definition = "Date and time when the order was received."
* url = "http://helsenorge.no/fhir/StructureDefinition/no-mottatt-dato" (exactly)
* value[x] 1..
* value[x] only dateTime
* value[x] ^short = "Mottattdato er den formelle datoen en henvisning blir registrert og mottatt av mottaker"
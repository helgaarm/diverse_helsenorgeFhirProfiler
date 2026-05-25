Extension: NoVurdertDato
Id: vurdertDato
Title: "Vurdert dato"
Description: "Brukes når forespørsel er vurdert og/eller henvisning er avvist/avsluttet."
* ^url = "http://helsenorge.no/fhir/StructureDefinition/no-vurdert-dato"
* ^version = "1.3.2"
* ^date = "2025-10-20T21:59:35+00:00"
* ^jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* . ^short = "Vurdert dato"
* . ^definition = "Brukes når forespørsel er vurdert og/eller henvisning er avvist/avsluttet."
* url = "http://helsenorge.no/fhir/StructureDefinition/no-vurdert-dato" (exactly)
* value[x] 1..
* value[x] only dateTime
* value[x] ^short = "Vurdert dato."
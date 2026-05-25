Extension: NoFristDatoForVurdering
Id: fristDatoForVurdering
Title: "Dato for frist for vurdering"
Description: "Dato for frist for vurdering."
* ^url = "http://helsenorge.no/fhir/StructureDefinition/no-frist-for-vurdering"
* ^version = "1.3.2"
* ^jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* . ^short = "Dato for frist for vurdering"
* . ^definition = "Dato for frist for vurdering."
* url = "http://helsenorge.no/fhir/StructureDefinition/no-frist-for-vurdering" (exactly)
* value[x] 1..
* value[x] only dateTime
* value[x] ^short = "Frist for vurdering."
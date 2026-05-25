Extension: NoFristForHelsehjelp
Id: fristDatoForHelsehjelp
Title: "Dato for frist for helsehjelp"
Description: "Dato for frist for helsehjelp."
* ^url = "http://helsenorge.no/fhir/StructureDefinition/no-frist-for-helsehjelp"
* ^version = "1.3.2"
* ^jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* . ^short = "Dato for frist for helsehjelp"
* . ^definition = "Dato for frist for helsehjelp."
* url = "http://helsenorge.no/fhir/StructureDefinition/no-frist-for-helsehjelp" (exactly)
* value[x] 1..
* value[x] only dateTime
* value[x] ^short = "Frist for helsehjelp er den datoen spesialisthelsetjenesten har vurdert at pasienten senest må få nødvendig helsehjelp innen, for at det ikke skal oppstå alvorlig helserisiko."
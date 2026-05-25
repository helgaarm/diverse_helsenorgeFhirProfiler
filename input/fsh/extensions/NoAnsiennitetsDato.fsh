Extension: NoAnsiennitetsDato
Id: ansiennitetsDato
Title: "Ansiennitets dato"
Description: "Seniority date is the first date a referral was received by specialist health"
* ^url = "http://helsenorge.no/fhir/StructureDefinition/no-ansiennitets-dato"
* ^version = "1.3.2"
* ^jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* . ^short = "Ansiennitets dato"
* . ^definition = "Seniority date is the first date a referral was received by specialist health"
* url = "http://helsenorge.no/fhir/StructureDefinition/no-ansiennitets-dato" (exactly)
* value[x] 1..
* value[x] only dateTime
* value[x] ^short = "Ansiennitetsdato er definert som den første mottaksdatoen for en henvisning til spesialisthelsetjenesten"
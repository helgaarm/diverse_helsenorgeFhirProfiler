Instance: no-basis-apotekenes-konsesjonsnr
InstanceOf: NamingSystem
Usage: #definition
* extension[0].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.url"
* extension[=].valueUri = "http://helsenorge.no/fhir/NamingSystem/no-basis-apotekenes-konsesjonsnr"
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.version"
* extension[=].valueString = "1.3.2"
* name = "ApotekenesKonsesjonsnr"
* status = #active
* kind = #identifier
* date = "2022-02-10"
* responsible = "Statens legemiddelverk"
* description = "Ved utstedelse av apotekkonsesjon for et nytt apotek tildeles et apotekkonsesjonsnummer. Konsesjonsnummeret er et firesifret nummer, i en nummerserie som starter på 1001, som er unikt for hvert apotek. Tildeles av Statens legemiddelverk."
* jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* uniqueId[0].type = #uri
* uniqueId[=].value = "http://hl7.no/fhir/NamingSystem/AKO"
* uniqueId[=].preferred = false
* uniqueId[+].type = #oid
* uniqueId[=].value = "2.16.578.1.12.4.1.4.107"
* uniqueId[=].preferred = true
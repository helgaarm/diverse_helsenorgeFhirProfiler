Instance: no-basis-dnummer
InstanceOf: NamingSystem
Usage: #definition
* meta.versionId = "1.0"
* extension[0].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.url"
* extension[=].valueUri = "http://helsenorge.no/fhir/NamingSystem/no-basis-dnummer"
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.version"
* extension[=].valueString = "1.3.2"
* name = "Dnummer"
* status = #active
* kind = #identifier
* date = "2018-10-26"
* responsible = "Skatteetaten"
* description = "Personidentifikator for personer som ikke har fødselsnummer og som ikke skal registreres som bosatt i Norge. The D-nummer of the patient. (assigned by the norwegian Skatteetaten)"
* jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* uniqueId[0].type = #uri
* uniqueId[=].value = "http://hl7.no/fhir/NamingSystem/DNR"
* uniqueId[=].preferred = false
* uniqueId[+].type = #oid
* uniqueId[=].value = "2.16.578.1.12.4.1.4.2"
* uniqueId[=].preferred = true
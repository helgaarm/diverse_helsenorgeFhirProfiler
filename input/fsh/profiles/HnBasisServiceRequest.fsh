Profile: HnBasisServiceRequest
Parent: ServiceRequest
Id: hn-basis-serviceRequest
Description: "ServiceRequest sendes til tjenesteytere for å informere om hvilke tjenester som ønskes fra leverandøren."
* ^version = "1.3.2"
* ^status = #draft
* ^jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* extension contains
    NoAnsiennitetsDato named ansiennitetsDato 0..1 and
    NoMottattDato named mottattDato 0..1 and
    NoFristForHelsehjelp named fristDatoForHelsehjelp 0..1 and
    NoFristDatoForVurdering named fristDatoForVurdering 0..1 and
    NoVurdertDato named vurdertDato 0..1 and
    ServiceRequestStatusReason named statusReason 0..1 MS
* extension[statusReason] ^short = "Reason for the current status"
* extension[statusReason] ^definition = "Provides the rationale behind the current status (e.g., on-hold due to patient request)."
* identifier 1..
* identifier ^short = "Skal være UUID"
* identifier ^definition = "Identifier er identifikator som identifiserer serviceRequest uavhengig av ressursens id på en FHIR-server. Skal være en UUID. Kan benyttes for å knytte ServiceRequest sammen med eventuelle etterfølgende oppdateringer."
* identifier.system 1..
* identifier.value 1..
* intent = #order
* category from ServiceRequestCategoryVS (preferred)
* category ^short = "Hvis category er brukt og det mangler code bør beskrivelse av bestilling være i note"
* priority 1..
* subject only Reference(Patient)
* subject ^short = "Subject identifiserer innbygger."
* subject.reference ..0
* subject.type = "Patient"
* subject.identifier.system ^short = "Det skal benyttes fødselsnummer eller d-nummer."
* performerType from ServiceRequestPerformerTypeVS (required)
* supportingInfo ^short = "Supporting info kan brukes for å sende informasjon når det er frykt for smitte."
* supportingInfo ^definition = "Hvis det er frykt for smitte eller bevist smitte er slik informasjonen referert fra supportingInformation som ‘contained’ ressurs."
Extension: HnBasisPostponementReason
Id: hn-basis-postponementreason
Title: "hn-basis-postponementreason"
Description: "The reason code for the postponement."
Context: Appointment
* ^version = "1.0.1"
* ^status = #draft
* . ^short = "hn-basis-postponementreason"
* . ^definition = "The reason code for the postponement."
* value[x] only Coding
* value[x] from urn:oid:2.16.578.1.12.4.1.1.8446 (preferred)
* value[x] ^code.system = "urn:oid:2.16.578.1.12.4.1.1.8446"
* value[x] ^code.display = "Volven kodeverk 8446 - Utsettelseskode"
* value[x] ^short = "The reason for postponing the appointment"
* value[x] ^definition = "The reason for postponing the appointment"
* value[x] ^mustSupport = false
* value[x] ^binding.description = "Volven"
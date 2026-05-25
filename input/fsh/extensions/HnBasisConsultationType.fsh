Extension: HnBasisConsultationType
Id: hn-basis-consultationType
Title: "hn-basis-consultationType"
Description: "Type of consultation."
Context: Appointment
* ^version = "1.0.1"
* ^status = #draft
* ^date = "2025-12-02T13:53:52+00:00"
* . ..1
* . ^short = "hn-basis-consultationType"
* . ^definition = "Type of consultation."
* . ^mustSupport = false
* value[x] only Coding
* value[x] from urn:oid:2.16.578.1.12.4.1.1.9505 (preferred)
* value[x] ^short = "The code is preferred used from Volven 9505. Using other code or valuesets has to be agreed with Helsenorge"
* value[x].system 1..
* value[x].code 1..
* value[x].display 1..
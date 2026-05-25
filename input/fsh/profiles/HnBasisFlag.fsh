Profile: HnBasisFlag
Parent: Flag
Id: hn-basis-Flag
Title: "hn-basis-flag"
Description: "Basisprofil for Flag used in 'ny timeløsning."
* ^version = "1.0.1"
* ^status = #draft
* status.extension ^slicing.discriminator.type = #value
* status.extension ^slicing.discriminator.path = "url"
* status.extension ^slicing.rules = #open
* category.coding obeys inv-4
* code from HnAppointmentFlagCodeVS (extensible)
* code.coding obeys inv-4
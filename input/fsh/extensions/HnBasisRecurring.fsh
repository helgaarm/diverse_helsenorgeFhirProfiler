Extension: HnBasisRecurring
Id: hn-basis-Recurring
Title: "hn-basis-recurring"
Description: "Indicates that this appointment is of recurrence type. In R5 this is handled by own structure."
Context: Appointment
* ^version = "1.0.1"
* ^status = #draft
* . ..1
* . ^short = "no-basis-recurring"
* . ^definition = "Indicates that this appointment is of recurrence type. In R5 this is handled by own structure."
* . ^mustSupport = false
* value[x] only boolean
* value[x] ^short = "The appointment is part of recurring session."
* value[x] ^mustSupport = false
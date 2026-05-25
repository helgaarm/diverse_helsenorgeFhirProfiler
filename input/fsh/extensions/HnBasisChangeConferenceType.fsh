Extension: HnBasisChangeConferenceType
Id: hn-basis-changeConferenceType
Title: "hn-basis-changeConferenceType"
Description: "The basis extension expressing that Patient askes to use anouther type of conference"
Context: AppointmentResponse
* ^version = "1.0.1"
* ^status = #draft
* ^date = "2025-12-02T13:53:52+00:00"
* . ..1
* . ^short = "hn-basis-changeConferenceType"
* . ^definition = "The basis extension expressing that Patient askes to use anouther type of conference"
* value[x] only Coding
* value[x] from NoBasisVirtualServiceType (required)
* value[x] ^short = "Pasient askes for changed conference type."
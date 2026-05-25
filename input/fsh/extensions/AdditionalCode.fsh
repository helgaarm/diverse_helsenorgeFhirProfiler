Extension: AdditionalCode
Id: additional-code
Title: "Alternative codes på serviceRequest.code"
Description: "Ekstensjon som muliggjør å legge til flere koder som alternative codes på serviceRequest.code"
Context: ServiceRequest
* ^version = "1.3.2"
* ^jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* . ^short = "Alternative codes på serviceRequest.code"
* . ^definition = "Ekstensjon som muliggjør å legge til flere koder som alternative codes på serviceRequest.code"
* value[x] only CodeableConcept
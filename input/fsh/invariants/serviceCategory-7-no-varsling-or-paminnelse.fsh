Invariant: serviceCategory-7-no-varsling-or-paminnelse
Description: "When serviceCategory is 7, meta.tag varsling and paminnelse must not be used."
* severity = #error
* expression = "serviceCategory.coding.where(code = '7').empty() or meta.tag.where(system = 'http://helsenorge.no/fhir/varsling' or system = 'http://helsenorge.no/fhir/paminnelse').empty()"
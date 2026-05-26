Invariant: serviceCategory-7-location-exactly-one-of-ptres-of
Description: "When serviceCategory is 7 and virtualService is not present, contained Location must include either PTRES or OF, but not both."
* severity = #error
* expression = "serviceCategory.coding.where(code = '7').empty() or extension('http://helsenorge.no/fhir/StructureDefinition/hn-basis-virtual-service').exists() or (contained.ofType(Location).where(type.coding.where(system = 'http://terminology.hl7.org/CodeSystem/v3-RoleCode' and code = 'PTRES').exists()).exists() != contained.ofType(Location).where(type.coding.where(system = 'http://terminology.hl7.org/CodeSystem/v3-RoleCode' and code = 'OF').exists()).exists())"

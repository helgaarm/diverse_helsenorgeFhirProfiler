Invariant: virtualservice-or-location-required
Description: "If virtualService extension is not present, at least one contained Location resource must be present."
* severity = #error
* expression = "extension('http://helsenorge.no/fhir/StructureDefinition/hn-basis-virtual-service').exists() or contained.ofType(Location).exists()"
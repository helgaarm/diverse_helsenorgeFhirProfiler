Invariant: supportinginformation-organization-partof
Description: "Every Organization referenced from supportingInformation must have only HER-id level 2 identifiers and must have partOf referencing only Organizations with HER-id level 1 identifiers."
* severity = #error
* expression = "supportingInformation.resolve().ofType(Organization).all(identifier.exists() and identifier.all(system = 'urn:oid:2.16.578.1.12.4.1.4.102') and partOf.exists() and partOf.resolve().ofType(Organization).exists() and partOf.resolve().ofType(Organization).all(identifier.exists() and identifier.all(system = 'urn:oid:2.16.578.1.12.4.1.4.101')))"

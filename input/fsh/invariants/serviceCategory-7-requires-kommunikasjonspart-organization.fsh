Invariant: serviceCategory-7-requires-kommunikasjonspart-organization
Description: "When serviceCategory is 7, supportingInformation[kommunikasjonspart] must reference an Organization using HER-id level 2 identifier system."
* severity = #error
* expression = "serviceCategory.coding.where(code = '7').empty() or supportingInformation.resolve().ofType(Organization).where(identifier.where(system = 'urn:oid:2.16.578.1.12.4.1.4.102').exists()).exists()"

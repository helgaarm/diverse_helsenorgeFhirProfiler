Extension: TbaOrganizationcoverage
Id: tba-organizationcoverage
Description: "The coverage of a service hosted by one of the organizations. Specifically used by norwegian Municipalities"
Context: Organization
* ^version = "1.0.1"
* ^status = #draft
* ^date = "2019-05-15"
* . ^definition = "The coverage of a service hosted by one of the organizations. Specifically used by norwegian Municipalities"
* value[x] only Reference(NoBasisOrganization)
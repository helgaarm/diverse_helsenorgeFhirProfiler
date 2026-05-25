Invariant: inv-a
Description: "Only urn:oid:2.16.578.1.12.4.1.4.1 (FNR) or urn:oid:2.16.578.1.12.4.1.4.2 (DNR) are allowed as systems to identify patient in this profile."
* severity = #error
* expression = "system = 'urn:oid:2.16.578.1.12.4.1.4.1' or system = 'urn:oid:2.16.578.1.12.4.1.4.2'"
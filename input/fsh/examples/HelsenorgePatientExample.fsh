// Source: example instance.
// SUSHI generates fsh-generated/resources/Patient-helsenorge-patient-example.json.
Instance: helsenorge-patient-example
InstanceOf: HelsenorgePatient
Usage: #example
Title: "Helsenorge Patient Example"
Description: "Example Patient instance conforming to the Helsenorge Patient profile."
* identifier[0].system = "urn:oid:2.16.578.1.12.4.1.4.1"
* identifier[0].value = "01010112345"
* name[0].family = "Nordmann"
* name[0].given[0] = "Ola"
* gender = #male
* birthDate = "2001-01-01"


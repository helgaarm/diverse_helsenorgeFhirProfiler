// Source: profile definition.
// SUSHI generates fsh-generated/resources/StructureDefinition-HelsenorgePatient.json.
Profile: HelsenorgePatient
Parent: Patient
Id: helsenorge-patient
Title: "Helsenorge Patient"
Description: "Example Helsenorge patient profile for demonstrating the project structure."
* ^status = #draft
* identifier 1..*
* identifier.system 1..1
* identifier.value 1..1
* name 1..*
* name.family 1..1
* name.given 1..*
* birthDate 1..1


Invariant: appointment-participant-actor-patient-reference-identifier
Description: "When actor is a Patient logical reference MUST be used"
* severity = #warning
* expression = "actor.type = 'Patient' implies actor.identifier.exists()"
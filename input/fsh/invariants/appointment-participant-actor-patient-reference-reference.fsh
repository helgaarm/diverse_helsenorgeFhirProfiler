Invariant: appointment-participant-actor-patient-reference-reference
Description: "When actor is a Patient literal reference (relative, internal or absolute) reference MUST not be used"
* severity = #warning
* expression = "(actor.type = 'Patient') implies actor.reference.exists().not()"
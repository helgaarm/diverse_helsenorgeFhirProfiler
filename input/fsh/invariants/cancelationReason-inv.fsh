Invariant: cancelationReason-inv
Description: "Cancelation reason MUST be set when status=cancelled"
* severity = #error
* expression = "(status = 'cancelled') implies cancelationReason.exists()"
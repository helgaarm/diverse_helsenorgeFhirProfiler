Invariant: contained-flag-allowed-codes
Description: "When contained Flag resources are used, only canAcknowledge, canChangeAppointmentDialog, canHaveAppointmentDetails and canInitiateDialog are allowed, and each code may only occur once."
* severity = #error
* expression = "contained.ofType(Flag).code.coding.all(code in ('canAcknowledge' | 'canChangeAppointmentDialog' | 'canHaveAppointmentDetails' | 'canInitiateDialog')) and contained.ofType(Flag).code.coding.where(code = 'canAcknowledge').count() <= 1 and contained.ofType(Flag).code.coding.where(code = 'canChangeAppointmentDialog').count() <= 1 and contained.ofType(Flag).code.coding.where(code = 'canHaveAppointmentDetails').count() <= 1 and contained.ofType(Flag).code.coding.where(code = 'canInitiateDialog').count() <= 1"

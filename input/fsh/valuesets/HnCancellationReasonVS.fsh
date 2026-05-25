ValueSet: HnCancellationReasonVS
Id: hn-cancellation-reason-vs
Title: "Helsenorge Cancellation Reason Value Set"
Description: "Cancellation reasons. Codes SHOULD be taken from 8445. 9179 is allowed as fallback."
* ^status = #active
* ^version = "1.0.0"
* include codes from system urn:oid:2.16.578.1.12.4.1.1.8445
* include codes from system urn:oid:2.16.578.1.12.4.1.1.9179
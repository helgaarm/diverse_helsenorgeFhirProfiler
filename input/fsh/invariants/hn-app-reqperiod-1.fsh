Invariant: hn-app-reqperiod-1
Description: "If status is proposed, requestedPeriod must exist and each requestedPeriod must have both start and end"
* severity = #error
* expression = "status != 'proposed' or (requestedPeriod.exists() and requestedPeriod.all(start.exists() and end.exists()))"
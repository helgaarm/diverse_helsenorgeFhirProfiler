Invariant: hn-app-primary-3
Description: "start is required unless status is proposed"
* severity = #error
* expression = "status = 'proposed' or start.exists()"
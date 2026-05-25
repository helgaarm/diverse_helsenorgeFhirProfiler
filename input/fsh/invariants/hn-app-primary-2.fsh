Invariant: hn-app-primary-2
Description: "If serviceCategory is 7, basedOn must not be used"
* severity = #error
* expression = "serviceCategory.coding.where(code = '7').empty() or basedOn.empty()"
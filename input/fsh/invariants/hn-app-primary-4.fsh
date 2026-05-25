Invariant: hn-app-primary-4
Description: "If serviceCategory is 7, partOf must not be used"
* severity = #error
* expression = "serviceCategory.coding.where(code = '7').empty() or partOf.empty()"
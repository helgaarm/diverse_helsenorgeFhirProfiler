Invariant: hn-app-primary-5
Description: "postponementReason cannot be used when serviceCategory is 7"
* severity = #error
* expression = "serviceCategory.coding.where(code = '7').empty() or postponementReason.empty()"
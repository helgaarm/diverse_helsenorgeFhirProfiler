Invariant: hn-app-proposed-only-servicecategory-7
Description: "status proposed is only allowed when serviceCategory is 7."
* severity = #error
* expression = "status != 'proposed' or serviceCategory.coding.where(code = '7').exists()"

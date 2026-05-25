Invariant: contained-location-must-have-managingorganization
Description: "Contained Location must have managingOrganization when serviceCategory is 27 or 30"
* severity = #error
* expression = "serviceCategory.coding.where(code = '27' or code = '30').empty() or      contained.ofType(Location).all(managingOrganization.exists())"
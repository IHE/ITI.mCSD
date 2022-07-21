Profile:      MCSDLocation
Parent:       Location
Id:           IHE.mCSD.Location
Title:        "mCSD Location"
Description:  """
A profile on the Location resource for mCSD.

Locations are physical places where care can be delivered such as facilities, buildings, wards,
rooms, or vehicles. Locations also include jurisdictions such as a village districts or regions.
A Location has a unique identifier and may have geographic attributes (address, geocode),
attributes regarding its hours of operation, etc. Each Location may be related to one [Organization](StructureDefinition-IHE.mCSD.Organization.html).
A location may have a hierarchical relationship with other locations.
"""

* implicitRules 0..0
* modifierExtension 0..0
* type 1..*
  * ^short = "A code that describes the type of Location."
  * ^definition = "A code that describes the type of Location."
* physicalType 1..1
  * ^short = "A code that describes the physical form of the Location."
  * ^definition = "A code that describes the physical form of the Location."
* name 1..1
  * ^short = "The name of the Location."
  * ^definition = "The name of the Location."
* status 1..1
  * ^short = "The status code of the Location."
  * ^definition = "The status code of the Location:  `active | suspended | inactive`"
* partOf only Reference(MCSDLocation)

Profile:      MCSDLocationDistance
Parent:       MCSDLocation
Id:           IHE.mCSD.LocationDistance
Title:        "mCSD Location with Distance"
Description:  """
A profile on the mCSD Location resource for distance searches.

This profile is for when you want to allow distance based searches for an mCSD Location resource.
"""

* position 1..1
  * ^short = "The geographic point of the Location."
  * ^definition = "The geographic point of the Location."

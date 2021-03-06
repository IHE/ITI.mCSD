Profile:      MCSDFacilityOrganization
Parent:       MCSDOrganization
Id:           IHE.mCSD.FacilityOrganization
Title:        "mCSD Organization for Facilities"
Description:  """
A profile on mCSD Organization for mCSD Facilities.

Facilities are physical care delivery sites such as hospitals, clinics, health outposts, physician offices,
labs, pharmacies, etc. A Facility has a unique identifier, geographic attributes (address, geocode), contact
attributes, attributes regarding its hours of operation, etc. Each Facility is defined by a pairing of 
[Location](StructureDefinition-IHE.mCSD.FacilityLocation.html) and
[Organization](StructureDefinition-IHE.mCSD.FacilityOrganization.html).

In addition to the base requirements of [mCSD Organization](StructureDefinition-IHE.mCSD.Organization.html),
one `type` must be set to `https://profiles.ihe.net/ITI/mCSD/CodeSystem/IHE.mCSD.Organization.Location.Types#facility`.
"""

* insert requireAtLeastOneMatch( type, facility, MCSDOrganizationLocationTypes#facility)
* type 1..
  * ^short = "One type must be set to: https://profiles.ihe.net/ITI/mCSD/CodeSystem/IHE.mCSD.Organization.Location.Types#facility"
  * ^definition = "One type must be set to: https://profiles.ihe.net/ITI/mCSD/CodeSystem/IHE.mCSD.Organization.Location.Types#facility"


Profile:      MCSDFacilityLocation
Parent:       MCSDLocation
Id:           IHE.mCSD.FacilityLocation
Title:        "mCSD Location for Facilities"
Description:  """
A profile on mCSD Location for mCSD Facilities.

Facilities are physical care delivery sites such as hospitals, clinics, health outposts, physician offices,
labs, pharmacies, etc. A Facility has a unique identifier, geographic attributes (address, geocode), contact
attributes, attributes regarding its hours of operation, etc. Each Facility is defined by a pairing of 
[Location](StructureDefinition-IHE.mCSD.FacilityLocation.html) and
[Organization](StructureDefinition-IHE.mCSD.FacilityOrganization.html).

In addition to the base requirements of [mCSD Location](StructureDefinition-IHE.mCSD.Location.html),
one `type` must be set to `https://profiles.ihe.net/ITI/mCSD/CodeSystem/IHE.mCSD.Organization.Location.Types#facility`.
"""

* insert requireAtLeastOneMatch( type, facility, MCSDOrganizationLocationTypes#facility)
* type 2..*
  * ^short = "One type must be set to: https://profiles.ihe.net/ITI/mCSD/CodeSystem/IHE.mCSD.Organization.Location.Types#facility"
  * ^definition = "One type must be set to: https://profiles.ihe.net/ITI/mCSD/CodeSystem/IHE.mCSD.Organization.Location.Types#facility"
* type contains service 0..
* type[service] from http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType
* managingOrganization 1..1 
* managingOrganization only Reference(MCSDFacilityOrganization)
  * ^short = "The reference to the mCSD Organization resource for this facility."
  * ^definition = "The reference to the mCSD Organization resource for this facility."

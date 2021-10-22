Invariant:    mcsd-type-1
Description:  "One type must be set as an mCSD Facility."
Expression:   "type.where( coding.system = 'urn:ietf:rfc:3986' and coding.code = 'urn:ihe:iti:mcsd:2019:facility' ).exists()"
Severity:     #error

Profile:      MCSDFacilityOrganization
Parent:       MCSDOrganization
Id:           IHE.mCSD.FacilityOrganization
Title:        "mCSD Organization for Facilities"
Description:  "A profile on the mCSD Organization profile for mCSD Facilities."

* obeys mcsd-type-1
* type 2..*


Profile:      MCSDFacilityLocation
Parent:       MCSDLocation
Id:           IHE.mCSD.FacilityLocation
Title:        "mCSD Location for Facilities"
Description:  "A profile on the mCSD Location profile for mCSD Facilities."

* obeys mcsd-type-1
* type 2..*
* managingOrganization 1..1 
* managingOrganization only Reference(MCSDFacilityOrganization)

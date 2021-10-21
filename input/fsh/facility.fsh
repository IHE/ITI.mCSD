Profile:      MCSDFacilityOrganization
Parent:       MCSDOrganization
Id:           IHE.mCSD.FacilityOrganization
Title:        "mCSD Organization for Facilities"
Description:  "A profile on the mCSD Organization profile for mCSD Facilities."

* type 2..*
* type ^slicing.discriminator[+].type = #pattern
* type ^slicing.discriminator[=].path = "coding.system"
* type ^slicing.discriminator[+].type = #pattern
* type ^slicing.discriminator[=].path = "coding.code"
* type ^slicing.rules = #closed
* type ^slicing.description = "Slicing based on the code."
* type contains facility 1..1 and @default 1..*
* type[facility] = urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:facility (exactly)
* type[@default].coding 1..*

Profile:      MCSDFacilityLocation
Parent:       MCSDLocation
Id:           IHE.mCSD.FacilityLocation
Title:        "mCSD Location for Facilities"
Description:  "A profile on the mCSD Location profile for mCSD Facilities."

* type 2..*
* type ^slicing.discriminator.type = #pattern
* type ^slicing.discriminator.path = "coding.system"
* type ^slicing.discriminator[+].type = #pattern
* type ^slicing.discriminator[=].path = "coding.code"
* type ^slicing.rules = #closed
* type ^slicing.description = "Slicing based on the code."
* type contains facility 1..1 and @default 1..*
* type[facility] = urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:facility (exactly)
* type[@default].coding 1..*
* managingOrganization 1..1 
* managingOrganization only Reference(MCSDFacilityOrganization)

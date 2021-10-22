Invariant:    mcsd-type-2
Description:  "One type must be set as an mCSD Jurisdiction."
Expression:   "type.where( coding.system = 'urn:ietf:rfc:3986' and coding.code = 'urn:ihe:iti:mcsd:2019:jurisdiction' ).exists()"
Severity:     #error

Profile:      MCSDJurisdictionOrganization
Parent:       MCSDOrganization
Id:           IHE.mCSD.JurisdictionOrganization
Title:        "mCSD Organization for Jurisdictions"
Description:  "A profile on the mCSD Organization for mCSD Jurisdictions"

* obeys mcsd-type-2
* type 2..*

Profile:      MCSDJurisdictionLocation
Parent:       MCSDLocation
Id:           IHE.mCSD.JurisdictionLocation
Title:        "mCSD Location for Jurisdictions"
Description:  "A profile on the mCSD Location for mCSD Jurisdictions"

* obeys mcsd-type-2
* type 2..*
* managingOrganization 1..1 
* managingOrganization only Reference(MCSDJurisdictionOrganization)
* extension contains $BOUNDARY named boundary 0..1
* extension[boundary].valueAttachment 1..1
* extension[boundary].valueAttachment.contentType = #application/geo+json
* extension[boundary].valueAttachment.data 1..1

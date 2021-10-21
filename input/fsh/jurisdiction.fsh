Profile:      MCSDJurisdictionOrganization
Parent:       MCSDOrganization
Id:           IHE.mCSD.JurisdictionOrganization
Title:        "mCSD Organization for Jurisdictions"
Description:  "A profile on the mCSD Organization for mCSD Jurisdictions"

* type 2..*
* type ^slicing.discriminator[+].type = #pattern
* type ^slicing.discriminator[=].path = "coding.system"
* type ^slicing.discriminator[+].type = #pattern
* type ^slicing.discriminator[=].path = "coding.code"
* type ^slicing.rules = #closed
* type ^slicing.description = "Slicing based on the code."
* type contains jurisdiction 1..1 and @default 1..*
* type[jurisdiction] = urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:jurisdiction (exactly)
* type[@default].coding 1..*

Profile:      MCSDJurisdictionLocation
Parent:       MCSDLocation
Id:           IHE.mCSD.JurisdictionLocation
Title:        "mCSD Location for Jurisdictions"
Description:  "A profile on the mCSD Location for mCSD Jurisdictions"

* type 2..*
* type ^slicing.discriminator[+].type = #pattern
* type ^slicing.discriminator[=].path = "coding.system"
* type ^slicing.discriminator[+].type = #pattern
* type ^slicing.discriminator[=].path = "coding.code"
* type ^slicing.rules = #closed
* type ^slicing.description = "Slicing based on the code."
* type contains jurisdiction 1..1 and @default 1..*
* type[jurisdiction] = urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:jurisdiction (exactly)
* type[@default].coding 1..*
* managingOrganization 1..1 
* managingOrganization only Reference(MCSDJurisdictionOrganization)
* extension contains $BOUNDARY named boundary 0..1
* extension[boundary].valueAttachment 1..1
* extension[boundary].valueAttachment.contentType = #application/geo+json
* extension[boundary].valueAttachment.data 1..1

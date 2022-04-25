Invariant:    mcsd-type-jurisdiction
Description:  "One type must be set as an mCSD Jurisdiction."
Expression:   "$this.where( coding.system = 'urn:ietf:rfc:3986' and coding.code = 'urn:ihe:iti:mcsd:2019:jurisdiction' ).exists()"
Severity:     #error

Profile:      MCSDJurisdictionOrganization
Parent:       MCSDOrganization
Id:           IHE.mCSD.JurisdictionOrganization
Title:        "mCSD Organization for Jurisdictions"
Description:  """
A profile on the mCSD Organization for mCSD Jurisdictions.

Jurisdictions are political administrative units or other territories over which authority is exercised. A Jurisdiction
has a unique identifier, geographic attributes, etc. Jurisdictions include political administrative units such as village
districts or regions.  Each Jurisdiction is defined by a pairing of [Location](StructureDefinition-IHE.mCSD.JurisdictionLocation.html)
and [Organization](StructureDefinition-IHE.mCSD.JurisdictionOrganization.html).

In addition to the base requirements of [mCSD Organization](StructureDefinition-IHE.mCSD.Organization.html),
one `type` must be set to `urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:jurisdiction`.
"""

* type obeys mcsd-type-jurisdiction
* type 2..*
  * ^short = "One type must be set to: urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:jurisdiction"
  * ^definition = "One type must be set to: urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:jurisdiction"

Profile:      MCSDJurisdictionLocation
Parent:       MCSDLocation
Id:           IHE.mCSD.JurisdictionLocation
Title:        "mCSD Location for Jurisdictions"
Description:  """
A profile on the mCSD Location for mCSD Jurisdictions.

Jurisdictions are political administrative units or other territories over which authority is exercised. A Jurisdiction
has a unique identifier, geographic attributes, etc. Jurisdictions include political administrative units such as village
districts or regions.  Each Jurisdiction is defined by a pairing of [Location](StructureDefinition-IHE.mCSD.JurisdictionLocation.html)
and [Organization](StructureDefinition-IHE.mCSD.JurisdictionOrganization.html).

In addition to the base requirements of [mCSD Location](StructureDefinition-IHE.mCSD.Location.html),
one `type` must be set to `urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:jurisdiction`.
"""

* type obeys mcsd-type-jurisdiction
* type 2..*
  * ^short = "One type must be set to: urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:jurisdiction"
  * ^definition = "One type must be set to: urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:jurisdiction"
* managingOrganization 1..1 
* managingOrganization only Reference(MCSDJurisdictionOrganization)
  * ^short = "The reference to the mCSD Organization resource for this jurisdiction."
  * ^definition = "The reference to the mCSD Organization resource for this jurisdiction."
* extension contains $BOUNDARY named boundary 0..1
* extension[boundary]
  * ^short = "When a boundary is available, the location-boundary-geojson extension should be used."
  * ^definition = "When a boundary is available, the location-boundary-geojson extension should be used with the given url, contentType, and data."
* extension[boundary].valueAttachment 1..1
* extension[boundary].valueAttachment.contentType = #application/geo+json (exactly)
  * ^short = "The boundary contentType shall be application/geo+json."
  * ^definition = "The boundary contentType shall be application/geo+json."
* extension[boundary].valueAttachment.data 1..1
  * ^short = "The boundary data shall be in the valueAttachment data element."
  * ^definition = "The boundary data shall be in the valueAttachment data element."

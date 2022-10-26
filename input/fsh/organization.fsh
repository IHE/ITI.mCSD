CodeSystem:     MCSDOrganizationIdentifierTypes
Title:          "mCSD Type codes for Organization.identifier"
Description:    "mCSD Type codes for specific business identifiers for Organization resources."

* ^caseSensitive = true
* ^experimental = false
* #HCID "Home Community Identifier"
* #AuthOrgId "Organization identifier used in authentication or authorization transactions (e.g. IHE XUA, IUA)"

ValueSet:     MCSDOrganizationIdentifierTypeValueSet
Title:          "mCSD Type codes for Organization.identifier"
Description:    "mCSD Type codes for specific business identifiers for Organization resources."

* ^experimental = false
* codes from system MCSDOrganizationIdentifierTypes

Profile:      MCSDOrganization
Parent:       Organization
Id:           IHE.mCSD.Organization
Title:        "mCSD Organization"
Description:  """
A profile on the Organization resource for mCSD.

Organizations are “umbrella” entities; these may be consideredthe administrative bodies under whose auspices
care services are provided such as Healthcare Information Exchanges (HIEs), Integrated Delivery Networks
(IDNs), Non-Government Organizations (NGOs), Faith-Based Organizations (FBOs) or even a one-physician family
practice. An organization has a unique identifier and may have additional administrative attributes such as
contact person, mailing address, etc. Departments of an institution, or other administrative units, may be
represented as child Organizations of a parent Organization.
"""
* implicitRules 0..0
* modifierExtension 0..0
* type 1..*
  * ^short = "A code that describes the type of Organization."
  * ^definition = "A code that describes the type of Organization."
* name 1..1
  * ^short = "The name of the Organization."
  * ^definition = "The name of the Organization."
* partOf only Reference(MCSDOrganization)
  * ^short = "If the Organization belongs to a single hierarchy, the partOf element shall be used."
  * ^definition = "If the Organization belongs to a single hierarchy, the partOf element shall be used."
* extension contains MCSDPurposeOfUse named purposeOfUse 0..*

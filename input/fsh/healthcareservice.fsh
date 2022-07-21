
Profile:      MCSDHealthcareService
Parent:       HealthcareService
Id:           IHE.mCSD.HealthcareService
Title:        "mCSD HealthcareService"
Description:  """
A profile on the HealthcareService resource for mCSD.

Each healthcare service has a unique identifier. Examples include surgical services, antenatal
care services, or primary care services. The combination of a Healthcare Service offered at a
[Location](StructureDefinition-IHE.mCSD.Location.html) may have specific attributes including
contact person, hours of operation, etc.
"""
* implicitRules 0..0
* modifierExtension 0..0
* type 1..*
  * ^short = "The type of service being provided."
  * ^definition = "The type of service being provided."
* name 1..1
  * ^short = "The name of the service being provided."
  * ^definition = "The name of the service being provided."
* location only Reference(MCSDLocation)
  * ^short = "The location where the service is being provided."
  * ^definition = "The location where the service is being provided."
* providedBy only Reference(MCSDOrganization)
  * ^short = "The organization providing this service."
  * ^definition = "The organization providing this service."


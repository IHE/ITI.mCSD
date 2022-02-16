Profile:      MCSDPractitioner
Parent:       Practitioner
Id:           IHE.mCSD.Practitioner
Title:        "mCSD Practitioner"
Description:  """
A profile on the Practitioner resource for mCSD.

A Practitioner is a [health worker such as defined by WHO](http://www.who.int/whr/2006/06_chap1_en.pdf); a Practitioner 
might be a physician, nurse, pharmacist, community health worker, district health manager, etc. Practitioners have
contact and demographic attributes. Each Practitioner may be related to one or more
[Organizations](StructureDefinition-IHE.mCSD.Organization.html), one or more
[Locations](StructureDefinition-IHE.mCSD.Location.html)
and one or more [Healthcare Services](StructureDefinition-IHE.mCSD.HealthcareService.html) through a
[Practitioner Role](StructureDefinition-IHE.mCSD.PractitionerRole.html). Specific attributes may be associated with
the Practitioner relationship with these other entities.
"""

* name 1..*
  * ^short = "The name of the Practitioner."
  * ^definition = "The name of the Practitioner."

Profile:      MCSDPractitionerRole
Parent:       PractitionerRole
Id:           IHE.mCSD.PractitionerRole
Title:        "mCSD PractitionerRole"
Description:  """
A profile on the PractitionerRole resource for mCSD.

A PractitionerRole links a [Practitioner](StructureDefinition-IHE.mCSD.Practitioner.html) with a particular
health care role to perform [Healthcare Services](StructureDefinition-IHE.mCSD.HealthcareService.html)
at a particular [Location](StructureDefinition-IHE.mCSD.Location.html)
for an [Organization](StructureDefinition-IHE.mCSD.Organization.html)
"""

* code 1..*
  * ^short = "The roles the Practitioner performs."
  * ^definition = "The roles the Practitioner performs."
* practitioner only Reference(MCSDPractitioner)
  * ^short = "The Practitioner that performs this role."
  * ^definition = "The Practitioner that performs this role."
* organization only Reference(MCSDOrganization)
  * ^short = "The Organization where the roles are available."
  * ^definition = "The Organization where the roles are available."
* location only Reference(MCSDLocation)
  * ^short = "The Location where the Practitioner provides care."
  * ^definition = "The Location where the Practitioner provides care."
* healthcareService only Reference(MCSDHealthcareService)
  * ^short = "The HealthcareServices provided by this Practitioner at an Organization and/or Location."
  * ^definition = "The HealthcareServices provided by this Practitioner at an Organization and/or Location."

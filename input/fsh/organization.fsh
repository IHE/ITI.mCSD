Profile:      MCSDOrganization
Parent:       Organization
Id:           IHE.mCSD.Organization
Title:        "mCSD Organization"
Description:  "A profile on the Organization resource for mCSD."

* type 1..*
* name 1..1
* partOf 0..1
* extension contains MCSDOrganizationHierarchy named hierarchy 0..* MS


Extension:    MCSDOrganizationHierarchy
Id:           IHE.mCSD.OrganizationHierarchy
Title:        "mCSD Additional Hierarchies extension for mCSD Organization."
Description:  "If there are additional hierarchies (such as funding source),then use this extension."

* ^context.type = #element
* ^context.expression = "MCSDOrganization"
* extension contains
            hierarchy-type 1..1 MS and
            part-of 1..1 MS
* extension[hierarchy-type].value[x] only CodeableConcept
* extension[hierarchy-type].valueCodeableConcept 1..1 MS
* extension[part-of].value[x] only Reference(MCSDOrganization)
* extension[part-of].valueReference 1..1 MS

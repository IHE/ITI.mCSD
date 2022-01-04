Profile:      MCSDOrganization
Parent:       Organization
Id:           IHE.mCSD.Organization
Title:        "mCSD Organization"
Description:  "A profile on the Organization resource for mCSD."

* type 1..*
* name 1..1
* partOf 0..1
* extension contains MCSDOrganizationHierarchy named hierarchy 0..* 


Extension:    MCSDOrganizationHierarchy
Id:           IHE.mCSD.OrganizationHierarchy
Title:        "mCSD Additional Hierarchies extension for mCSD Organization."
Description:  "If there are additional hierarchies (such as funding source),then use this extension."

* ^context.type = #element
* ^context.expression = "Organization"
* extension contains
            hierarchy-type 1..1 and
            part-of 1..1
* extension[hierarchy-type].value[x] only CodeableConcept
* extension[hierarchy-type].valueCodeableConcept 1..1
* extension[part-of].value[x] only Reference(MCSDOrganization)
* extension[part-of].valueReference 1..1

Instance:     MCSDSearchOrganizationHierarchyType
InstanceOf:   SearchParameter
Title:        "Search on the IHE defined extension for hierarchy type."
* url = "http://profiles.ihe.net/ITI/mCSD/SearchParameter/IHE.mCSD.Organization.HierarchyType"
* id = "IHE.mCSD.Organization.HierarchyType"
* description = "This Search Parameter enables finding Organizations by the hierarchy type."
* name = "IHE_mCSD_Hierarchy_Type"
* status = #active
* code = #ihe-mcsd-hierarchy-type
* base = #Organization
* type = #token
* expression = "extension('http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.OrganizationHierarchy').extension('hierarchy-type').value as CodeableConcept"

Instance:     MCSDSearchOrganizationHierarchyPartOf
InstanceOf:   SearchParameter
Title:        "Search on the IHE defined extension for hierarchy part of."
* url = "http://profiles.ihe.net/ITI/mCSD/SearchParameter/IHE.mCSD.Organization.HierarchyPartOf"
* id = "IHE.mCSD.Organization.HierarchyPartOf"
* description = "This Search Parameter enables finding Organizations by the hierarchy part of."
* name = "IHE_mCSD_Hierarchy_PartOf"
* status = #active
* code = #ihe-mcsd-hierarchy-partof
* base = #Organization
* type = #reference
* expression = "extension('http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.OrganizationHierarchy').extension('part-of').value as Reference"
* modifier[+] = #below
* modifier[+] = #above


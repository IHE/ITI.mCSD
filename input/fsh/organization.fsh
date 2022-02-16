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

* type 1..*
  * ^short = "A code that describes the type of Organization."
  * ^definition = "A code that describes the type of Organization."
* name 1..1
  * ^short = "The name of the Organization."
  * ^definition = "The name of the Organization."
* partOf only Reference(MCSDOrganization)
  * ^short = "If the Organization belongs to a single hierarchy, the partOf element shall be used."
  * ^definition = "If the Organization belongs to a single hierarchy, the partOf element shall be used."
* extension contains MCSDOrganizationHierarchy named hierarchy 0..* 
* extension[hierarchy]
  * ^short = "If there are additional hierarchies (such as funding source), include them in this extension."
  * ^definition = "If there are additional hierarchies (such as funding source), include them in this extension."

Extension:    MCSDOrganizationHierarchy
Id:           IHE.mCSD.OrganizationHierarchy
Title:        "mCSD Additional Hierarchies extension for mCSD Organization."
Description:  "If there are additional hierarchies (such as funding source), then use this extension."

* ^context.type = #element
* ^context.expression = "Organization"
* extension contains
            hierarchy-type 1..1 and
            part-of 1..1
* extension[hierarchy-type].value[x] only CodeableConcept
* extension[hierarchy-type].valueCodeableConcept 1..1
  * ^short = "A code for the type of the hierarchy."
  * ^definition = "A code for the type of the hierarchy."
* extension[part-of].value[x] only Reference(MCSDOrganization)
* extension[part-of].valueReference 1..1
  * ^short = "The parent mCSD organization in this hierarchy."
  * ^definition = "The parent mCSD organization in this hierarchy."

Instance:     MCSDSearchOrganizationHierarchyType
InstanceOf:   SearchParameter
Title:        "Search on the IHE defined extension for hierarchy type."
* url = "http://profiles.ihe.net/ITI/mCSD/SearchParameter/IHE.mCSD.Organization.HierarchyType"
* id = "IHE.mCSD.Organization.HierarchyType"
* description = """
This Search Parameter enables finding [Organizations](StructureDefinition-IHE.mCSD.Organization.html) by the
[mCSD extension](StructureDefinition-IHE.mCSD.OrganizationHierarchy.html) hierarchy type.
"""
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
* description = """
This Search Parameter enables finding [Organizations](StructureDefinition-IHE.mCSD.Organization.html)
by the hierarchy [mCSD extension](StructureDefinition-IHE.mCSD.OrganizationHierarchy.html) part of.
"""

* name = "IHE_mCSD_Hierarchy_PartOf"
* status = #active
* code = #ihe-mcsd-hierarchy-partof
* base = #Organization
* type = #reference
* expression = "extension('http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.OrganizationHierarchy').extension('part-of').value as Reference"
* modifier[+] = #below
* modifier[+] = #above

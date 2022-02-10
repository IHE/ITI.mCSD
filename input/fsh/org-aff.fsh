
CodeSystem:  MCSDOrgAffTypes
Title: "mCSD Organization Affiliation Types"
Description:  "mCSD OrganizationAffiliation types beyond those in the FHIR core."
* ^caseSensitive = true
* #XCAfacade "XCA facade"
//TODO Define what an XCA facade is -- It means if org A is a "parent" of org B through OrgAff and it has this code, then when doing doc sharing, when pulling, that results of Org B will be aggregated in Org A's responses, and when pushing, that Org B can be specified as intendedRecipient in a push to Org A.


ValueSet: MCSDOrgAffTypesVS
Title: "mCSD Organization Affiliation Types ValueSet"
Description: "ValueSet of Organization Affiliation types allowed"
* codes from system MCSDOrgAffTypes
* codes from system http://hl7.org/fhir/organization-role



Profile:      MCSDOrganizationAffiliation
Parent:       OrganizationAffiliation
Id:           IHE.mCSD.OrganizationAffiliation
Title:        "mCSD Organization Affiliation"
Description:  "A profile on the OrganizationAffiliation resource for mCSD."
* identifier MS
* active 1..1
* period 1..1
* organization 1..1
* organization only Reference(MCSDOrganization)
* participatingOrganization MS
* participatingOrganization only Reference(MCSDOrganization)
* participatingOrganization ^short = "TODO"
* network MS
* network only Reference(MCSDOrganization)
* network ^short = "TODO"
* code 1..*
* code from MCSDOrgAffTypesVS (extensible)
* code ^short = "the type of affiliation"
* specialty MS
* location MS
* telecom MS
* endpoint only Reference(MCSDEndpointXCA or Endpoint)



Instance: ex-endpointOrgAff
InstanceOf: MCSDOrganizationAffiliation
Title: "Example of an OrganizationAffiliation in mCSD."
Description: """
explain this
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* active = true
* period.start = 2022-02-10
* organization = Reference(MCSDOrganization-ExamplePartner)
* code = 	http://hl7.org/fhir/organization-role#HIE/HIO
* endpoint[+] = Reference(Endpoint/ex-endpointDicom)
* endpoint[+] = Reference(Endpoint/ex-endpointXCAquery)
* endpoint[+] = Reference(Endpoint/ex-endpointXCAretrieve)





// Need to clarify that Karen's Cross does not need OrgAff. Karen's Cross is supported simplistically with simply Organization->Endpoint(s); where each endpoint expresses the various protocols supported. Where Document Sharing OrgAff is needed is when a network service is made available to mediate between originating Org-A needing to talk to Org-B where either (a) they don't have a common protocol (spirit of Karen's cross service), or (b) don't have a common direct link (proxy service). The Document Sharing OrgAff enables both (a) and (b). The OrgAff resource links a network endpoint hosting organization (OrgAff.organization and .participatingOrganization) and that organizations endpoint (OrgAff.endpoint and/or OrgAff.organization.endpoint, which is on the network) with a destination (push destination, or query/retrieve destination) organization (OrgAff.network) that does not have an endpoint present on the network.
// Jira ticket filed on unclear .network -- https://jira.hl7.org/browse/FHIR-36019
// Jira ticket filed on unclear .participatingOrganization -- https://jira.hl7.org/browse/FHIR-25406


CodeSystem:  MCSDOrgAffTypes
Title: "mCSD Organization Affiliation Types"
Description:  "mCSD OrganizationAffiliation types beyond those in the FHIR core."
* ^caseSensitive = true
* #DocShare-federate """
Federation to any Document Sharing exchange. This code states that the
.participatingOrganization is accessible via the OrganizationAffiliation.endpoint. This endpoint
may be shared with other participatingOrganizations (via their own OrganizationAffiliations).
So, for example, when pulling documents (e.g. ITI-38), results of the .participatingOrganization
will be aggregated in the responses, and when pushing documents (e.g. ITI-41) the
.participatingOrganization may be specified as an intendedRecipient.
"""

// Unclear if there needs to be many codes, or just one. Do we need a code for transparent fed vs opaque fed? 


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
* active 1..1
* endpoint only Reference(MCSDEndpoint)
* code ^short = "the type of affiliation"
* organization 1..1
* organization only Reference(MCSDOrganization)
* organization ^short = "Organization hosting endpoints on behalf of the ParticipaintOrganization."
* participatingOrganization 1..1
* participatingOrganization only Reference(MCSDOrganization)
* participatingOrganization ^short = "The Organization who is served by the hosting Organization."
// TODO. Not clear what to say about the participatingOrganization... it seems this is duplicate of the .organization.
* network 0..0
* specialty MS
* location MS
* telecom MS


Profile:      MCSDOrganizationAffiliationDocShare
Parent:       MCSDOrganizationAffiliation
Id:           IHE.mCSD.OrganizationAffiliation.DocShare
Title:        "mCSD Organization Affiliation DocumentSharing"
Description:  """
A profile on the OrganizationAffiliation resource for mCSD in Document Sharing. Karen's Cross, when expanded to either/or a service that translates protocols, or a proxy that mediates network communication.

Not used for direct connected mesh networks of depth 2 as that is handled fine with Organization->Endpoint. 

Affiliation is used to show Document Sharing network linkage to a set of communities that are not directly addressible.  
The participating organization would not have Organization->Endpoint advertised in the network directory. 
There will be many OrganizationAffiliations, one for each pathway provided on the network by the serving organization (.organization) to another organization (.participatingOrganization).
"""
* identifier 1..* MS
* identifier ^short = "the homeCommunityId(s)"
* identifier ^definition = "Shall be all the homeCommunityId(s) of all the communities in the affiliation network."
* identifier ^comment = "Open-Issue: should this be mandated, recommended, or forbidden?"
* code = MCSDOrgAffTypes#DocShare-federate
* endpoint only Reference(MCSDEndpointDocShare)



Instance: ex-OrgAff
InstanceOf: MCSDOrganizationAffiliation
Title: "Example of an OrganizationAffiliation in mCSD."
Description: """
This is a simple OrganizationAffiliation for an HIE. This is NOT representative of a Document Sharing affiliation.
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* active = true
* period.start = 2022-02-10
* organization = Reference(MCSDOrganization-ExamplePartner)
* participatingOrganization = Reference(Organization/ex-OrgA)
* code = 	http://hl7.org/fhir/organization-role#HIE/HIO


// Setup a scenario for DocumentSharing
// OrgA wants to communicate with OrgB, but OrgB does not have an endpoint on the network. So OrgA looks for OrgAff that can connect them and finds OrgC can connect them.
Instance: ex-OrgA
InstanceOf: MCSDOrganization
Title: "Example Organization A"
Description: """
Example Organization A that wants to communicate with Organization B
- Note this Organization has no endpoint, but it is a client in this scenario
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* name = "OrgA"
* active = true
* type[+] = http://terminology.hl7.org/CodeSystem/organization-type#govt


Instance: ex-OrgB
InstanceOf: MCSDOrganization
Title: "Example Organization B"
Description: """
Example Organization B that is not on the network directly
- Note that this organization has no endpoint as it is not directly participating in the network
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier.type =  urn:ihe:iti:xca:2010#homeCommunityIdhomeCommunityId
* identifier.value = "urn:uuid:4f88dade-42a7-4fb3-b0a6-f877ff6b23b7" // OrgB
* name = "OrgB"
* active = true
* type[+] = http://terminology.hl7.org/CodeSystem/organization-type#govt


Instance: ex-OrgC
InstanceOf: MCSDOrganization
Title: "Example Organization C"
Description: """
Example Organization C supports communication with Organization B
- Note that this organization hosts an XDS Query endpoint on the network. 
- More endponts would be here, but the use-case is simplified to just XDS Query
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* name = "OrgC"
* active = true
* type[+] = http://terminology.hl7.org/CodeSystem/organization-type#govt
* endpoint[+] = Reference(Endpoint/ex-endpointXCAquery)

Instance: ex-OrgAffC
InstanceOf: MCSDOrganizationAffiliationDocShare
Title: "Example OrganizationAffiliation C"
Description: """
Example OrganizationAffiliation C that indicates that C will provide communication to B.
- Note that the endpoint is listed here in addition to in ex-OrgC to be more efficient
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier.type =  urn:ihe:iti:xca:2010#homeCommunityIdhomeCommunityId
* identifier.value = "urn:uuid:4f88dade-42a7-4fb3-b0a6-f877ff6b23b7" // OrgB
* active = true
* code = MCSDOrgAffTypes#DocShare-federate
* organization = Reference(Organization/ex-OrgC)
* participatingOrganization = Reference(Organization/ex-OrgB)
* endpoint[+] = Reference(Endpoint/ex-endpointXCAquery)

// TODO: Second use-case would show how multiple OrgAff can point at the same endpoint resources

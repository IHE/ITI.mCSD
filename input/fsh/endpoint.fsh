
CodeSystem:  MCSDEndpointTypes
Title: "mCSD Endpoint Types"
Description:  "mCSD Endpoint types beyond those in the FHIR core."
* ^caseSensitive = true
* #XCA-RespGateway-Query "XCA RespondingGateway Query Synchronous"
* #XCA-RespGateway-Query-async "XCA RespondingGateway Query Asynchronous"
* #XCA-RespGateway-Query-as4async "XCA RespondingGateway Query AS4 Asynchronous"
* #XCA-RespGateway-Retrieve "XCA RespondingGateway Retrieve Synchronous"
* #XCA-RespGateway-Retrieve-async "XCA RespondingGateway Retrieve Asynchronous"
* #XCA-RespGateway-Retrieve-as4async "XCA RespondingGateway Retrieve AS4 Asynchronous"


ValueSet: MCSDEndpointTypesXcaVS
Title: "mCSD Endpoint XCA Types ValueSet"
Description: "ValueSet of the XCA Endpint types allowed"
* codes from system MCSDEndpointTypes
//* codes from http://hl7.org/fhir/ValueSet/endpoint-connection-type
//* exclude http://terminology.hl7.org/CodeSystem/endpoint-connection-type#ihe-xca


Profile:      MCSDEndpointXCA
Parent:       Endpoint
Id:           IHE.mCSD.Endpoint.XCA
Title:        "mCSD Endpoint for XCA"
Description:  """
A profile on the mCSD Endpoint for use in XCA environments.

Each type of endpoint will be indicated with an independent Endpoint resource. Thus the most simple of RespondingGateway will be described with two Endpoints; Query, and Retrieve.
"""

//TODO: should identifier hold the homeCommunityId(s)?
* identifier 1..*
* identifier ^short = "the homeCommunityId(s)"
* status MS
* status ^short = "represents the current status of this endpoint."
* status ^comment = "Should be updated when maintenance or other status changes happen."
* connectionType from MCSDEndpointTypesXcaVS (extensible)
//TODO is there any  useful thing to put in name?
* name 0..0
* managingOrganization 1..1
* managingOrganization only Reference(MCSDOrganization)
* contact MS
* period MS
* payloadType MS
//* payloadType from http://ihe.net/fhir/ihe.formatcode.fhir/ValueSet/formatcode (extensible)
// TODO -- not sure what the mime-type should be on XCA query vs retrieve? Presume they will be the same?
* payloadMimeType MS
* address 1..1
* header 0..0


Instance: ex-endpointXCAquery
InstanceOf: MCSDEndpointXCA
Title: "Example of an mCSD XCA Query Endpoint"
Description: """
explain this
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier.type =  urn:ihe:iti:xca:2010#homeCommunityIdhomeCommunityId
* identifier.value = "urn:uuid:cadbf8d0-5493-11ec-bf63-0242ac130002"
* status = #active
* connectionType = MCSDEndpointTypes#XCA-RespGateway-Query
// no name
* managingOrganization = Reference(MCSDOrganization-ExamplePartner)
// no contact, use the managing Org
* period.start = 2022-02-10
* payloadType[+] = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:pcc:xphr:2007
* payloadType[+] = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:pcc:ips:2020
* payloadMimeType[+] = #application/fhir+xml
* payloadMimeType[+] = #application/fhir+json
* payloadMimeType[+] = #application/pdf
* payloadMimeType[+] = #text/xml
* address = "http://example.org/xca/query"
// no header

Instance: ex-endpointXCAretrieve
InstanceOf: MCSDEndpointXCA
Title: "Example of an mCSD XCA Retrieve Endpoint"
Description: """
explain this
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier.type =  urn:ihe:iti:xca:2010#homeCommunityIdhomeCommunityId
* identifier.value = "urn:uuid:cadbf8d0-5493-11ec-bf63-0242ac130002"
* status = #active
* connectionType = MCSDEndpointTypes#XCA-RespGateway-Retrieve
// no name
* managingOrganization = Reference(MCSDOrganization-ExamplePartner)
// no contact, use the managing Org
* period.start = 2022-02-10
* payloadType[+] = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:pcc:xphr:2007
* payloadType[+] = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:pcc:ips:2020
* payloadMimeType[+] = #application/fhir+xml
* payloadMimeType[+] = #application/fhir+json
* payloadMimeType[+] = #application/pdf
* payloadMimeType[+] = #text/xml
* address = "http://example.org/xca/retrieve"
// no header


Instance: ex-endpointDicom
InstanceOf: Endpoint
Title: "Example of an Endpoint that is not constrained by mCSD XCA constraints."
Description: """
explain this
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs
* name = "The PACS"
* managingOrganization = Reference(MCSDOrganization-ExamplePartner)
// no contact, use the managing Org
* period.start = 2022-02-10
* address = "http://example.org/pacs"
// no header
// note payloadType is manditory, but will not be in R5 https://jira.hl7.org/browse/FHIR-25393
* payloadType[+].text = "DICOM WADO-RS"
* payloadMimeType[+] = #image/dicom+jpeg

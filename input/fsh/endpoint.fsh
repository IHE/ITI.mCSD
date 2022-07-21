// Open-Issue - explaining that we only defined the sync pattern for XDS/XCA/XDR for the public-comment deadline, and that after that is addressed we will add in async and as4; and MHD.
// TODO: Digital Certificates to support async end-to-end security -- Not needed for sync that uses TLS
// Given that PA refuses to put in a publicKey, and recommends local extension. I will add an extension.
//  https://jira.hl7.org/browse/FHIR-10764
// Note VhDir has an extension http://hl7.org/fhir/uv/vhdir/StructureDefinition/digitalcertificate
// VhDir is a very complex extension. Not clear to me if this complexity is needed. Not clear who advised this structure.


Extension: EndpointSpecificType
Id: ihe-endpointspecifictype
Title: "Endpoint Specific Type"
Description: """
The specific endpoint type. Given that the FHIR R4 Endpoint.connectionType is limited to a one value from a valueSet given by FHIR core and that valueSet includes XCA thus by Extensible rules one is forced to pick that value, we choose to add an additional codeableConcept for a more detailed code(s).
"""
* value[x] only CodeableConcept
* valueCodeableConcept from 	MCSDEndpointTypesVS (preferred)


Instance: Endpoint-EndpointSpecificType
InstanceOf: SearchParameter
Title: "Search on the IHE defined extension for Endpoint specificType"
Usage: #definition
* url = "http://profiles.ihe.net/ITI/mCSD/SearchParameter/Endpoint-EndpointSpecificType"
* description = "This SearchParameter enables finding Endpoints by the specificType code.  This resource is created as informative content."
* name = "EndpointSpecificType"
* status = #active
* code = #specificType
* base = #Endpoint
* expression = "(extension('http://profiles.ihe.net/ITI/mCSD/StructureDefinition/EndpointSpecificType').value as CodeableConcept)"
* type = #token


CodeSystem:  MCSDEndpointTypes
Title: "mCSD Endpoint Types"
Description:  """
mCSD Endpoint types beyond those in the FHIR core.

The codes defined here are endpoint types defined in IHE profiles at the time of publication. 
Other codes might be defined in new IHE profiles written later, where they could define their own code and own codeSystem.

Code pattern: `{Profile}-{Actor}-{Transaction}[-{option}]`
* Where Profile is the acronym
* Where Actor name compressed to be short yet clear (camel case)
* Where Transaction name is compressed to be short yet clear (camel case)
* Where the code definition spells out these using the formal names and transaction number
* Where an option is important it can be prepended

Note that this codeSystem contains only endpoints needed for Some IHE profiles, and only for the synchronous communication pattern. When Async is supported additional entries will be needed on these actors, and the peer actor will also need to be described. Async is not in scope at this time.
"""
* ^caseSensitive = true
* ^hierarchyMeaning = #part-of
// XCA Actor transactions for Synchronous use https://profiles.ihe.net/ITI/TF/Volume1/ch-18.html
* #ihe-xca "XCA"
  * #XCA-InitGateway-Query "XCA InitiatingGateway ITI-18 Registry Stored Query Synchronous"
  * #XCA-InitGateway-Retrieve "XCA InitiatingGateway ITI-43 Retrieve Document Set Synchronous"
  * #XCA-InitGateway-Query-Async "XCA InitiatingGateway ITI-18 Registry Stored Query Asynchronous"
  * #XCA-InitGateway-Retrieve-Async "XCA InitiatingGateway ITI-43 Retrieve Document Set Asynchronous"
  * #XCA-InitGateway-Query-AsyncResponse "XCA InitiatingGateway ITI-38 Cross Gateway Query Asynchronous Response"
  * #XCA-InitGateway-Retrieve-AsyncResponse "XCA InitiatingGateway ITI-39 Cross Gateway Retrieve Asynchronous Response"
  * #XCA-RespGateway-Query "XCA RespondingGateway ITI-38 Cross Gateway Query Synchronous"
  * #XCA-RespGateway-Retrieve "XCA RespondingGateway ITI-39 Cross Gateway Retrieve Synchronous"
  * #XCA-RespGateway-Query-Async "XCA RespondingGateway ITI-38 Cross Gateway Query Asynchronous"
  * #XCA-RespGateway-Retrieve-Async "XCA RespondingGateway ITI-39 Cross Gateway Retrieve Asynchronous"
// XCPD Actor transactions for Synchronous use https://profiles.ihe.net/ITI/TF/Volume1/ch-27.html
* #ihe-xcpd "XCPD"
  * #XCPD-InitGateway-PatientDiscovery-AsyncResponse "XCPD InitiatingGateway ITI-55 Cross Gateway Patient Discovery Asynchronous Response"
  * #XCPD-RespGateway-PatientDiscovery "XCPD RespondingGateway ITI-55 Cross Gateway Patient Discovery Synchronous"
  * #XCPD-RespGateway-PatientDiscovery-Async "XCPD RespondingGateway ITI-55 Cross Gateway Patient Discovery Asynchronous"
// XDS Actor transactions for Synchronous use https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html
* #ihe-xds "XDS"
  * #XDS-Registry-Feed "XDS Registry ITI-8 Patient Identity Feed Synchronous"
  * #XDS-Registry-Feed-v3 "XDS Registry ITI-44 Patient Identity Feed HL7v3 Synchronous"
  * #XDS-Registry-Register "XDS Registry ITI-42 Register Document Set-b Synchronous"
  * #XDS-Registry-Query "XDS Registry ITI-18 Registry Stored Query Synchronous"
  * #XDS-Registry-RegOnDemand "XDS Registry ITI-61 Register On-Demand Document Entry Synchronous"
  * #XDS-Registry-Register-Async "XDS Registry ITI-42 Register Document Set-b Asynchronous"
  * #XDS-Registry-Query-Async "XDS Registry ITI-18 Registry Stored Query Asynchronous"
  * #XDS-Registry-RegOnDemand-Async "XDS Registry ITI-61 Register On-Demand Document Entry Asynchronous"
  * #XDS-Repository-ProvideReg "XDS Repository ITI-41 Provide&Register Document Set-b Synchronous"
  * #XDS-Repository-Retrieve "XDS Repository/IntegratedSourceRepository ITI-43 Retrieve Document Set Synchronous"
  * #XDS-Repository-ProvideReg-Async "XDS Repository ITI-41 Provide&Register Document Set-b Asynchronous"
  * #XDS-Repository-Retrieve-Async "XDS Repository/IntegratedSourceRepository ITI-43 Retrieve Document Set Asynchronous"
  * #XDS-Repository-Register-AsyncResponse "XDS Repository/IntegratedSourceRepository ITI-42 Register Document Set-b Asynchronous Response"
  * #XDS-OnDemandSource-Retrieve "XDS OnDemandSource ITI-43 Retrieve Document Set Synchronous"
  * #XDS-OnDemandSource-Retrieve-Async "XDS OnDemandSource ITI-43 Retrieve Document Set Asynchronous"
  * #XDS-OnDemandSource-RegOnDemand-AsyncResponse "XDS OnDemandSource ITI-61 Register On-Demand Document Entry Asynchronous Response"
  * #XDS-Source-ProvideReg-AsyncResponse "XDS Document Source ITI-41 Provide&Register Document Set-b Asynchronous Response"
  * #XDS-Consumer-Query-AsyncResponse "XDS Document Consumer ITI-18 Registry Stored Query Asynchronous Response"
  * #XDS-Consumer-Retrieve-AsyncResponse "XDS Document Consumer ITI-43 Retrieve Document Set Asynchronous Response"
// PDQ Actor transactions https://profiles.ihe.net/ITI/TF/Volume1/ch-8.html
* #ihe-pdq "PDQ"
  * #PDQ-Supplier-Query "PDQ Patient Demographics Supplier ITI-21 Patient Demographics Query Synchronous"
  * #PDQ-Supplier-VisitQuery "PDQ Patient Demographics Supplier ITI-22 Patient Demographics and Visit Query Synchronous"
// PIX Actor transactions https://profiles.ihe.net/ITI/TF/Volume1/ch-5.html
* #ihe-pix "PIX"
  * #PIX-Xmanager-Feed "PIX Patient Identity Cross-Reference Manager ITI-8 Patient Identity Feed Synchronous"
  * #PIX-Xmanager-Feed-v3 "PIX Patient Identity Cross-Reference Manager ITI-30 Patient Identity Management Synchronous"
  * #PIX-Xmanager-Query "PIX Patient Identity Cross-Reference Manager ITI-9 PIX Query Synchronous"
  * #PIX-Consumer "PIX Patient Identifier Cross-reference Consumer ITI-10 PIX Update Notification Synchronous"
// XDR Actor transactions https://profiles.ihe.net/ITI/TF/Volume1/ch-15.html
* #ihe-xdr "XDR"
  * #XDR-Recipient-ProvideReg "XDR Document Recipient ITI-41 Provide and Register Document Set-B Synchronous"
// MHD Actor transactions https://profiles.ihe.net/ITI/MHD/index.html
* #ihe-mhd "MHD"
  * #MHD-Recipient-ProvideReg "MHD Document Recipient ITI-65 Provide Document Bundle"
// MHD Document Responder is RESTful, so should it have one or many?
//* #MHD-Responder "MHD Document Responder ITI-66/ITI-67/ITI-68"


ValueSet: MCSDEndpointTypesVS
Title: "mCSD Endpoint Types ValueSet"
Description: "ValueSet of the Endpoint types allowed"
//Note that when MCSDEndpointTypes has more than Document Sharing in it, this will need to be more explicit. 
* codes from system MCSDEndpointTypes

ValueSet: MCSDEndpointTypesCoreDocShareVS
Title: "mCSD Endpoint Core Document Sharing Types ValueSet"
Description: "ValueSet of the Core Document Sharing Endpoint types allowed"
* http://terminology.hl7.org/CodeSystem/endpoint-connection-type#ihe-xcpd
* http://terminology.hl7.org/CodeSystem/endpoint-connection-type#ihe-xca
* http://terminology.hl7.org/CodeSystem/endpoint-connection-type#ihe-xds
* http://terminology.hl7.org/CodeSystem/endpoint-connection-type#ihe-xdr
* MCSDEndpointTypes#ihe-pdq
* MCSDEndpointTypes#ihe-pix
* MCSDEndpointTypes#ihe-mhd


CodeSystem:     MCSDEndpointIdentifierTypes
Title:          "mCSD Type codes for Endpoint.identifier"
Description:    "mCSD Type codes for specific business identifiers for Endpoint resources."

* ^caseSensitive = true
* #HCID "Home Community Identifier: Identifies an Endpoint to an IHE community."
* #DocRepoId "Identifies an Endpoint that is a source or repository of clinical documents."

ValueSet:     MCSDEndpointIdentifierTypeValueSet
Title:          "mCSD Type codes for Endpoint.identifier"
Description:    "mCSD Type codes for specific business identifiers for Endpoint resources."

* codes from system MCSDEndpointIdentifierTypes

// TODO: Create an invariant so that either managingOrganization or contact must be populated. For now we just force manaingOrganization like the other resources in mCSD



Profile:      MCSDEndpoint
Parent:       Endpoint
Id:           IHE.mCSD.Endpoint
Title:        "mCSD Endpoint"
Description:  """
A profile on the mCSD Endpoint.

An Organization may be reachable through electronic Endpoint(s).
An Endpoint may be a FHIR server, an IHE web services actor, or some other
mechanism. If an Organization does not have an Endpoint, it may still be
reachable via an Endpoint at its parent Organization or an affiliated Organization.

Given that in FHIR R4 the .connnectionType is 1..1, each type of endpoint will be indicated with an independent Endpoint resource.
"""
* implicitRules 0..0
* modifierExtension 0..0
* status MS
* status ^short = "represents the current status of this endpoint."
* status ^comment = "Should be updated when maintenance or other status changes happen."

* managingOrganization 1..1
* managingOrganization only Reference(MCSDOrganization)
* managingOrganization ^short = "Organization that manages this endpoint."
* managingOrganization ^definition = "The organization that manages this endpoint, even if technically another organization is hosting this in the cloud."
* managingOrganization ^comment = """
This element is used when there is a technical problem with the endpoint operation, and would be used to contact for technical support.

This managing organization relationship is potentially independent of if the organization is the custodian/owner of the data available thru this endpoint.
"""
* contact ^definition = "Contact details for a human to contact about the endpoint. The primary use of this for system administrator troubleshooting."
* period MS
* period ^short = "Overall deployment lifetime for this endpoint."
* period ^comment = "usually indicating when the endpoint was deployed, and may indicate when this endpoint will be decommissioned."
* extension contains MCSDPurposeOfUse named purposeOfUse 0..*



Profile:      MCSDEndpointDocShare
Parent:       MCSDEndpoint
Id:           IHE.mCSD.Endpoint.DocShare
Title:        "mCSD Endpoint for Document Sharing"
Description:  """
A profile on the mCSD Endpoint for Document Sharing environments.

Given that in FHIR R4 the .connnectionType is 1..1, each type of endpoint will be indicated with an independent Endpoint resource. Thus a XCA Responding Gateway will need two Endpoint instances to express Query vs Retrieve.

Open-Issues:
1. That payloadType and payloadMimeType are either empty to indicate that the endpoint is not constrained; or fully populated. 
2. That payloadType and PayloadMimeType for XCA/XDS/MHD Query and XCA/XDS/MHD Retrieve would be the same thus replicating the capability at both endpoints. 
3. It did not seem right that Query be indicated with a mimeType of ebRegistry as that is not helpful to the use-case.
4. should the homeCommunityId be mandated here, should those behind it be here, should this be empty?
5. would a Proxy service that is supporting OrgAff be a good example of NOT putting a homeCommunityId in the endpoint.identifier?
"""
* identifier 0..*
* identifier ^short = "should be the homeCommunityId(s)"
* identifier ^definition = "For simple single depth XCA communites."
* extension contains EndpointSpecificType named specificType 0..* MS
* connectionType from MCSDEndpointTypesCoreDocShareVS (required)
* name 0..0 
* name ^short = "Nothing useful to put in the name"
* payloadType MS
//* payloadType from http://ihe.net/fhir/ihe.formatcode.fhir/ValueSet/formatcode (extensible)
// TODO -- not sure what the mime-type should be on XCA query vs retrieve? Presume they will be the same?
* payloadType ^short = "FormatCode(s)"
* payloadType ^definition = "The list of FormatCode(s) available at this endpoint."
* payloadType ^comment = "Empty list of FormatCode(s) indicates indeterminate set of FormatCodes supported. For XCA Responding Gateways that do not host data themselves, but rather proxy for other communities, leave this element empty."
* payloadMimeType MS
* address 1..1
* address ^comment = "XCA SOAP endpoint"
* header 0..0
* header ^short = "XCA defines protocol"



Instance: ex-endpointXCAquery
InstanceOf: MCSDEndpointDocShare
Title: "Example of an mCSD XCA Query Endpoint"
Description: """
This is an example of an XCA Retrieve endpoint for OrgA
- supports XPHR and IPS
- supports mime-type for FHIR, CDA, and PDF
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier.type =  urn:ihe:iti:xca:2010#homeCommunityIdhomeCommunityId
* identifier.value = "urn:uuid:cadbf8d0-5493-11ec-bf63-0242ac130002" // OrgA
* status = #active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#ihe-xca
* extension[specificType].valueCodeableConcept = MCSDEndpointTypes#XCA-RespGateway-Query
// no name
* managingOrganization = Reference(Organization/ex-OrgA)
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
InstanceOf: MCSDEndpointDocShare
Title: "Example of an mCSD XCA Retrieve Endpoint"
Description: """
This is an example of an XCA Retrieve endpoint
- supports XPHR and IPS
- supports mime-type for FHIR, CDA, and PDF
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier.type =  urn:ihe:iti:xca:2010#homeCommunityIdhomeCommunityId
* identifier.value = "urn:uuid:cadbf8d0-5493-11ec-bf63-0242ac130002" // OrgA
* status = #active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#ihe-xca
* extension[specificType].valueCodeableConcept = MCSDEndpointTypes#XCA-RespGateway-Retrieve
// no name
* managingOrganization = Reference(Organization/ex-OrgA)
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
InstanceOf: MCSDEndpoint
Title: "Example of an Endpoint that is not constrained by mCSD XCA constraints."
Description: """
This is an example of a DICOM WADO-RS endpoint.
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

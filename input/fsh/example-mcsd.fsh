// jurisdiction pair

Instance: MCSDJurisdictionOrganization-Example
InstanceOf: MCSDJurisdictionOrganization
Title: "Example mCSD Jurisdiction Organization"
Description: "Organization resource for an example mCSD Jurisdiction"
Usage: #example
* name = "MCSDJurisdictionOrganization-Example"
* active = true
* type[+] = urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:jurisdiction
* type[+] = http://terminology.hl7.org/CodeSystem/organization-type#govt

Instance: MCSDJurisdictionLocation-Example
InstanceOf: MCSDJurisdictionLocation
Title: "Example mCSD Jurisdiction Location"
Description: "Location resource for an example mCSD Jurisdiction"
Usage: #example
* name = "MCSDJurisdictionLocation-Example"
* status = #active
* managingOrganization = Reference(MCSDJurisdictionOrganization-Example)
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#jdn
* type[+] = urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:jurisdiction
* type[+] = http://terminology.hl7.org/CodeSystem/organization-type#govt

// another department

Instance: MCSDOrganization-ExamplePartner
InstanceOf: MCSDOrganization
Title: "Example Partner Organization"
Description: "Example Organization for a Partner Organization"
Usage: #example
* name = "Organization-ExamplePartner"
* active = true
* type[+] = http://terminology.hl7.org/CodeSystem/organization-type#govt

// Hierarchy Code System Example
CodeSystem:  MCSDExampleHierarchy
Id: mcsd-example-hierarchy
Title: "mCSD Example Hierarchy Code System"
Description:  "An example vocabulary of hierarchies."
* ^caseSensitive = false
* ^content = #complete
* ^experimental = true
// * ^url = http://example.org/IHE/CodeSystem/mcsd-example-hierarchy
* #supply "Supply Chain"
* #admin "Administrative"

// facility pair which is part of a jurisdiction and has one other external org attached

Instance: MCSDFacilityOrganization-Example
InstanceOf: MCSDFacilityOrganization
Title: "Example mCSD Facility Organization"
Description: "Organization resource for an example mCSD Facility"
Usage: #example
* name = "MCSDFacilityOrganization-Example"
* active = true
* type[+] = urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:facility
* type[+] = http://terminology.hl7.org/CodeSystem/organization-type#govt
* partOf = Reference(MCSDJurisdictionOrganization-Example)

Instance: MCSDFacilityOrganizationAffiliation-Example
InstanceOf: MCSDOrganizationAffiliation
Title: "Example mCSD Facility Admin Organization Affiliation"
Description: "Organization Affiliation resource for an example administrative relationship for a facility."
Usage: #example
* active = true
* organization = Reference(MCSDOrganization-ExamplePartner)
* participatingOrganization = Reference(MCSDFacilityOrganization-Example)
* code = MCSDExampleHierarchy#admin

Instance: MCSDFacilityLocation-Example
InstanceOf: MCSDFacilityLocation
Title: "Example mCSD Facility Location"
Description: "Location resource for an example mCSD Facility"
Usage: #example
* name = "MCSDFacilityLocation-Example"
* status = #active
* managingOrganization = Reference(MCSDFacilityOrganization-Example)
* partOf = Reference(MCSDJurisdictionLocation-Example)
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bu
* type[+] = urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:facility
* type[+] = http://terminology.hl7.org/CodeSystem/v3-RoleCode#HOSP

Instance: MCSDLocation-Example
InstanceOf: MCSDLocation
Title: "Example mCSD Location"
Description: "Location resource for an example of an mCSD Location (Ward)"
Usage: #example
* name = "MCSDLocation-Example"
* status = #active
* partOf = Reference(MCSDFacilityLocation-Example)
* type[+] = http://terminology.hl7.org/CodeSystem/v3-RoleCode#RNEU
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#wa

Instance: MCSDLocationDistance-Example
InstanceOf: MCSDLocationDistance
Title: "Example mCSD Location with Distance Option"
Description: "Location resource for an example of an mCSD Location with Distance Option"
Usage: #example
* name = "MCSDLocationDistance-Example"
* status = #active
* type[+] = http://terminology.hl7.org/CodeSystem/v3-RoleCode#HOSP
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bu
* position.latitude = -1.46929510804737
* position.longitude = -78.81700744576973

// service, role, practitioner

Instance: MCSDHealthcareService-Example
InstanceOf: MCSDHealthcareService
Title: "Example mCSD HealthcareService"
Description: "HealthcareService resource example for mCSD."
Usage: #example
* name = "ANC"
* type = http://terminology.hl7.org/CodeSystem/service-type#124 "General Practice"
* location = Reference(MCSDFacilityLocation-Example)

Instance: MCSDPractitionerRole-Example
InstanceOf: MCSDPractitionerRole
Title: "Example mCSD PractitionerRole"
Description: "PractitionerRole resource example for mCSD."
Usage: #example
* code = http://terminology.hl7.org/CodeSystem/practitioner-role#nurse
* location = Reference(MCSDFacilityLocation-Example)
* healthcareService = Reference(MCSDHealthcareService-Example)
* organization = Reference(MCSDFacilityOrganization-Example)
* practitioner = Reference(MCSDPractitioner-Example)

Instance: MCSDPractitioner-Example
InstanceOf: MCSDPractitioner
Title: "Example mCSD Practitioner"
Description: "Practitioner resource example for mCSD."
Usage: #example
* name.text = "John Galt" 

// bundler

Instance: Example-MCSD
InstanceOf: Bundle
Title: "Example Bundle of mCSD Resources"
Description: "Example Bundle of Core mCSD Resources."
Usage: #example
* type = #transaction


* entry[+].fullUrl = "http://www.example.org/fhir/Organization/MCSDJurisdictionOrganization-Example"
* entry[=].request.url = "Organization/MCSDJurisdictionOrganization-Example"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDJurisdictionOrganization-Example

* entry[+].fullUrl = "http://www.example.org/fhir/Location/MCSDJurisdictionLocation-Example"
* entry[=].request.url = "Location/MCSDJurisdictionLocation-Example"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDJurisdictionLocation-Example

* entry[+].fullUrl = "http://www.example.org/fhir/Organization/MCSDOrganization-ExamplePartner"
* entry[=].request.url = "Organization/MCSDOrganization-ExamplePartner"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDOrganization-ExamplePartner

* entry[+].fullUrl = "http://www.example.org/fhir/Organization/MCSDFacilityOrganization-Example"
* entry[=].request.url = "Organization/MCSDFacilityOrganization-Example"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDFacilityOrganization-Example

* entry[+].fullUrl = "http://www.example.org/fhir/Location/MCSDFacilityLocation-Example"
* entry[=].request.url = "Location/MCSDFacilityLocation-Example"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDFacilityLocation-Example

* entry[+].fullUrl = "http://www.example.org/fhir/HealthcareService/MCSDHealthcareService-Example"
* entry[=].request.url = "HealthcareService/MCSDHealthcareService-Example"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDHealthcareService-Example

* entry[+].fullUrl = "http://www.example.org/fhir/PractitionerRole/MCSDPractitionerRole-Example"
* entry[=].request.url = "PractitionerRole/MCSDPractitionerRole-Example"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDPractitionerRole-Example

* entry[+].fullUrl = "http://www.example.org/fhir/Practitioner/MCSDPractitioner-Example"
* entry[=].request.url = "Practitioner/MCSDPractitioner-Example"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDPractitioner-Example

* entry[+].fullUrl = "http://www.example.org/fhir/OrganizationAffiliation/ex-OrgAff"
* entry[=].request.url = "OrganizationAffiliation/ex-OrgAff"
* entry[=].request.method = #PUT
* entry[=].resource = ex-OrgAff

* entry[+].fullUrl = "http://www.example.org/fhir/Organization/ex-OrgA"
* entry[=].request.url = "Organization/ex-OrgA"
* entry[=].request.method = #PUT
* entry[=].resource = ex-OrgA

* entry[+].fullUrl = "http://www.example.org/fhir/Organization/ex-OrgB"
* entry[=].request.url = "Organization/ex-OrgB"
* entry[=].request.method = #PUT
* entry[=].resource = ex-OrgB

* entry[+].fullUrl = "http://www.example.org/fhir/Organization/ex-OrgC"
* entry[=].request.url = "Organization/ex-OrgC"
* entry[=].request.method = #PUT
* entry[=].resource = ex-OrgC

* entry[+].fullUrl = "http://www.example.org/fhir/OrganizationAffiliation/ex-OrgAffC"
* entry[=].request.url = "OrganizationAffiliation/ex-OrgAffC"
* entry[=].request.method = #PUT
* entry[=].resource = ex-OrgAffC

* entry[+].fullUrl = "http://www.example.org/fhir/Endpoint/ex-endpointXCAquery"
* entry[=].request.url = "Endpoint/ex-endpointXCAquery"
* entry[=].request.method = #PUT
* entry[=].resource = ex-endpointXCAquery

* entry[+].fullUrl = "http://www.example.org/fhir/Endpoint/ex-endpointXCAretrieve"
* entry[=].request.url = "Endpoint/ex-endpointXCAretrieve"
* entry[=].request.method = #PUT
* entry[=].resource = ex-endpointXCAretrieve

* entry[+].fullUrl = "http://www.example.org/fhir/Endpoint/ex-endpointDicom"
* entry[=].request.url = "Endpoint/ex-endpointDicom"
* entry[=].request.method = #PUT
* entry[=].resource = ex-endpointDicom

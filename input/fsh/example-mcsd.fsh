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
// extensions to allow for additional hierarchy
* extension[hierarchy].extension[hierarchy-type].valueCodeableConcept = MCSDExampleHierarchy#admin
* extension[hierarchy].extension[part-of].valueReference = Reference(MCSDOrganization-ExamplePartner)

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
Description: "Example Bundle of Core mCSD Resources: Organization, Location, HealthcareService, Practitioner, and PractitionerRole with Facility and Jursidiction."
Usage: #example
* type = #transaction


* entry[+].fullUrl = "http://www.example.org/fhir/Organization/MCSDJurisdictionOrganization-Example"
* entry[=].request.url = "Organization"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDJurisdictionOrganization-Example

* entry[+].fullUrl = "http://www.example.org/fhir/Location/MCSDJurisdictionLocation-Example"
* entry[=].request.url = "Location"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDJurisdictionLocation-Example

* entry[+].fullUrl = "http://www.example.org/fhir/Organization/MCSDOrganization-ExamplePartner"
* entry[=].request.url = "Organization"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDOrganization-ExamplePartner

* entry[+].fullUrl = "http://www.example.org/fhir/Organization/MCSDFacilityOrganization-Example"
* entry[=].request.url = "Organization"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDFacilityOrganization-Example

* entry[+].fullUrl = "http://www.example.org/fhir/Location/MCSDFacilityLocation-Example"
* entry[=].request.url = "Location"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDFacilityLocation-Example

* entry[+].fullUrl = "http://www.example.org/fhir/HealthcareService/MCSDHealthcareService-Example"
* entry[=].request.url = "HealthcareService"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDHealthcareService-Example

* entry[+].fullUrl = "http://www.example.org/fhir/PractitionerRole/MCSDPractitionerRole-Example"
* entry[=].request.url = "PractitionerRole"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDPractitionerRole-Example

* entry[+].fullUrl = "http://www.example.org/fhir/Practitioner/MCSDPractitioner-Example"
* entry[=].request.url = "Practitioner"
* entry[=].request.method = #PUT
* entry[=].resource = MCSDPractitioner-Example



Alias: $mcsd = https://github.com/ihe/ITI.mCSD

// jurisdiction pair

Instance: MCSDJurisdictionOrganization-Example
InstanceOf: MCSDJurisdictionOrganization
Usage: #example
* name = "MCSDJurisdictionOrganization-Example"
* active = true
* type[+] = #govt
* type[+] = $mcsd#Jurisdiction

Instance: MCSDJurisdictionLocation-Example
InstanceOf: MCSDJurisdictionLocation
Usage: #example
* name = "MCSDJurisdictionLocation-Example"
* status = #active
* managingOrganization = Reference(MCSDJurisdictionOrganization-Example)
* physicalType = #PC
* type[+] = #govt
* type[+] = $mcsd#Jurisdiction

// another department

Instance: MCSDOrganization-ExamplePartner
InstanceOf: MCSDOrganization
Usage: #example
* name = "Organization-ExamplePartner"
* active = true
* type[+] = #govt

// facility pair which is part of a jurisdiction and has one other external org attached

Instance: MCSDFacilityOrganization-Example
InstanceOf: MCSDFacilityOrganization
Usage: #example
* name = "MCSDFacilityOrganization-Example"
* active = true
* type[+] = #govt
* type[+] = $mcsd#Facility
* partOf = Reference(MCSDJurisdictionOrganization-Example)
// extensions to allow for additional hierarchy
* extension[MCSDOrganizationHierarchy].extension[hierarchy-type].valueCodeableConcept = #ihe-mcsd-hierarchy-type
* extension[MCSDOrganizationHierarchy].extension[part-of].valueReference = Reference(MCSDOrganization-ExamplePartner)

Instance: MCSDFacilityLocation-Example
InstanceOf: MCSDFacilityLocation
Usage: #example
* name = "MCSDFacilityLocation-Example"
* status = #active
* managingOrganization = Reference(MCSDFacilityOrganization-Example)
* physicalType = #PC
* type[+] = #HOSP
* type[+] = $mcsd#Facility

// service, role, practitioner

Instance: MCSDHealthcareService-Example
InstanceOf: MCSDHealthcareService
Usage: #example
* name = "ANC"
* type = #124 "General Practice"
* location = Reference(MCSDFacilityLocation-Example)

Instance: MCSDPractitionerRole-Example
InstanceOf: MCSDPractitionerRole
Usage: #example
* code = #nurse
* location = Reference(MCSDFacilityLocation-Example)
* healthcareService = Reference(MCSDHealthcareService-Example)
* organization = Reference(MCSDFacilityOrganization-Example)
* practitioner = Reference(MCSDPractitioner-Example)

Instance: MCSDPractitioner-Example
InstanceOf: MCSDPractitioner
Usage: #example
* name.text = "Wil E. Coyote" 

// bundler

Instance: Example-MCSD
InstanceOf: Bundle
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



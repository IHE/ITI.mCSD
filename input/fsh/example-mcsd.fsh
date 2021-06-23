Instance: MCSDFacilityOrganization-Example
InstanceOf: MCSDFacilityOrganization
Usage: #example
// Title: "MCSDFacilityOrganization-Example"
// Description: ""
* name = "MCSDFacilityOrganization-Example"
* active = true
* type = #govt
* type[govt].coding.system = "stuff:mcsd"
* type[govt].coding.code = "stuff:mcsd:helloworld"
* type = Facility
* type[Facility].coding.system = "urn:ietf:rfc:3986"
* type[Facility].coding.code = #urn:ihe:iti:mcsd:2019:facility

Instance: MCSDFacilityLocation-Example
InstanceOf: MCSDFacilityLocation
Usage: #example
// Title: "MCSDFacilityLocation-Example"
// Description: ""
* name = "MCSDFacilityLocation-Example"
* status = #active
* managingOrganization = Reference(MCSDFacilityOrganization-Example)
* physicalType = #PC
* type = Facility
* type[Facility].coding.system = "urn:ietf:rfc:3986"
* type[Facility].coding.code = #urn:ihe:iti:mcsd:2019:facility



// Instance: Example-English
// InstanceOf: Bundle
// Usage: #example

// * type = #transaction
// * entry[+].fullUrl = "http://www.example.org/fhir/Patient/DDCC-Patient-English"
// * entry[=].request.url = "Patient"
// * entry[=].request.method = #PUT
// * entry[=].resource = DDCC-Patient-English

// * entry[+].fullUrl = "http://www.example.org/fhir/Patient/DDCC-Organization-English"
// * entry[=].request.url = "Organization"
// * entry[=].request.method = #PUT
// * entry[=].resource = DDCC-Organization-English

// * entry[+].fullUrl = "http://www.example.org/fhir/Patient/DDCC-Immunization-English"
// * entry[=].request.url = "Immunization"
// * entry[=].request.method = #PUT
// * entry[=].resource = DDCC-Immunization-English
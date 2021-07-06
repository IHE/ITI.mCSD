Instance: Organization-Example
InstanceOf: Organization
Usage: #example
// Title: "Organization-Example"
// Description: ""
* name = "Organization-Example"
* active = true

Instance: Location-Example
InstanceOf: Location
Usage: #example
// Title: "Location-Example"
// Description: ""
* name = "Location-Example"
* status = #active
* managingOrganization = Reference(Organization-Example)

Instance: HealthcareService-Example
InstanceOf: HealthcareService
Usage: #example
// Title: "HealthcareService-Example"
// Description: ""
* providedBy = Reference(Organization-Example)
* location = Reference(Location-Example)
* type = #567

Instance: Practitioner-Example
InstanceOf: Practitioner
Usage: #example
// Title: "Practitioner-Example"
// Description: ""
* name[+].text = "Hello, World!"
* gender = #other

Instance: PractitionerRole-Example
InstanceOf: PractitionerRole
Usage: #example
// Title: "PractitionerRole-Example"
// Description: ""
* practitioner = Reference(Practitioner-Example)
* organization = Reference(Organization-Example)
* location = Reference(Location-Example)

Instance: Example-CoreOnly
InstanceOf: Bundle
Usage: #example

* type = #transaction
* entry[+].fullUrl = "http://www.example.org/fhir/Organization/Organization-Example"
* entry[=].request.url = "Organization"
* entry[=].request.method = #PUT
* entry[=].resource = Organization-Example

* entry[+].fullUrl = "http://www.example.org/fhir/Location/Location-Example"
* entry[=].request.url = "Location"
* entry[=].request.method = #PUT
* entry[=].resource = Location-Example

* entry[+].fullUrl = "http://www.example.org/fhir/HealthcareService/HealthcareService-Example"
* entry[=].request.url = "HealthcareService"
* entry[=].request.method = #PUT
* entry[=].resource = HealthcareService-Example

* entry[+].fullUrl = "http://www.example.org/fhir/PractitionerRole/PractitionerRole-Example"
* entry[=].request.url = "PractitionerRole"
* entry[=].request.method = #PUT
* entry[=].resource = PractitionerRole-Example

* entry[+].fullUrl = "http://www.example.org/fhir/Practitioner/Practitioner-Example"
* entry[=].request.url = "Practitioner"
* entry[=].request.method = #PUT
* entry[=].resource = Practitioner-Example



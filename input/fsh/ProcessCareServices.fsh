ValueSet: RestrictedHTTPVerbVS
Id: restricted-http-verb-vs
Title: "Restricted HTTP Verb Value Set"
Description: "Value set for allowed HTTP verbs, excluding GET operations."
* http://hl7.org/fhir/http-verb#POST "POST"
* http://hl7.org/fhir/http-verb#PUT "PUT"
* http://hl7.org/fhir/http-verb#DELETE "DELETE"

Profile:        MCSDProcessCareServices
Parent:         Bundle
Id:             IHE.mCSD.ProcessCareServices
Title:          "Process"
Description:    "A profile on the Bundle transaction for ITI-130 Process Care Services Resources Request Message"
* type = #transaction
* entry.request 1..1 MS
* entry.request.method from RestrictedHTTPVerbVS (required)
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry and entry.resource MS
* entry contains 
    MCSDPractitioner 0..* and
    MCSDPractitionerRole 0..* and
    MCSDOrganization 0..* and
    MCSDLocation 0..* and
    MCSDHealthcareService 0..* and
    MSDOrganizationAffiliation 0..* and
    MCSDEndpoint 0..*
* entry[MCSDPractitioner].resource only IHE.mCSD.Practitioner 
* entry[MCSDPractitioner] ^short = "Practitioner"
* entry[MCSDPractitionerRole].resource only IHE.mCSD.PractitionerRole 
* entry[MCSDPractitionerRole] ^short = "PractitionerRole"
* entry[MCSDOrganization].resource only IHE.mCSD.Organization 
* entry[MCSDOrganization] ^short = "Organization"
* entry[MCSDLocation].resource only IHE.mCSD.Location 
* entry[MCSDLocation] ^short = "Location"
* entry[MCSDHealthcareService].resource only IHE.mCSD.HealthcareService 
* entry[MCSDHealthcareService] ^short = "HealthcareService"
* entry[MSDOrganizationAffiliation].resource only IHE.mCSD.OrganizationAffiliation 
* entry[MSDOrganizationAffiliation] ^short = "OrganizationAffiliation"
* entry[MCSDEndpoint].resource only IHE.mCSD.Endpoint 
* entry[MCSDEndpoint] ^short = "Endpoint"
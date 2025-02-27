Instance: IHE.mCSD.Directory
InstanceOf: CapabilityStatement
Usage: #definition
* version = "20250218"
* name = "IHE_mCSD_Directory"
* title = "IHE ITI Mobile Care Services Discovery (mCSD) - Directory"
* status = #active
* experimental = false
* date = "2025-02-18"
* description = "CapabilityStatement for Directory Actor in the IHE IT Infrastructure Technical Framework Supplement IHE mCSD."
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * documentation = "IHE ITI mCSD ITI-90 endpoint"
  * resource[+]
    * insert Expectation(MAY)
    * type = #HealthcareService
    * supportedProfile = Canonical(MCSDHealthcareService)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #search-type
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "active"
      * type = #token
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "location"
      * type = #reference
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "name"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "name:contains"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "name:exact"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "organization"
      * type = #reference
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "service-type"
      * type = #token
  * resource[+]
    * insert Expectation(MAY)
    * type = #Location
    * supportedProfile[+] = Canonical(MCSDLocation)
    * supportedProfile[+] = Canonical(MCSDFacilityLocation)
    * supportedProfile[+] = Canonical(MCSDJurisdictionLocation)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #search-type
    * searchInclude = "Location:organization"
      * insert Expectation(SHALL)
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "name"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "name:contains"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "name:exact"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "organization"
      * type = #reference
    * searchParam[+]
      * insert Expectation(SHOULD)
      * name = "partof"
      * type = #reference
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "type"
      * type = #token
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "status"
      * type = #token
  * resource[+]
    * insert Expectation(MAY)
    * type = #Organization
    * supportedProfile[+] = Canonical(MCSDOrganization)
    * supportedProfile[+] = Canonical(MCSDFacilityOrganization)
    * supportedProfile[+] = Canonical(MCSDJurisdictionOrganization)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #search-type
    * searchInclude = "Organization:endpoint"
      * insert Expectation(SHALL)
    * searchRevInclude[+] = "Location:organization"
    * searchRevInclude[+] = "OrganizationAffiliation:participating-organization"
    * searchRevInclude[+] = "OrganizationAffiliation:primary-organization"
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "active"
      * type = #token
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "name"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "name:contains"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "name:exact"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHOULD)
      * name = "partof"
      * type = #reference
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "type"
      * type = #token
  * resource[+]
    * insert Expectation(MAY)
    * type = #Practitioner
    * supportedProfile = Canonical(MCSDPractitioner)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #search-type
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "active"
      * type = #token
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "name"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "name:contains"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "name:exact"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "given"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "given:contains"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "given:exact"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "family"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "family:contains"
      * type = #string
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "family:exact"
      * type = #string
  * resource[+]
    * insert Expectation(MAY)
    * type = #PractitionerRole
    * supportedProfile = Canonical(MCSDPractitionerRole)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #search-type
    * searchInclude = "PractitionerRole:practitioner"
      * insert Expectation(SHALL)
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "active"
      * type = #token
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "location"
      * type = #reference
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "organization"
      * type = #reference
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "role"
      * type = #token
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "service"
      * type = #reference
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "specialty"
      * type = #token
  * resource[+]
    * insert Expectation(MAY)
    * type = #Endpoint
    * supportedProfile[+] = Canonical(MCSDEndpoint)
    * supportedProfile[+] = Canonical(MCSDEndpointDocShare)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #search-type
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "organization"
      * type = #reference
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "status"
      * type = #token
  * resource[+]
    * insert Expectation(MAY)
    * type = #OrganizationAffiliation
    * supportedProfile[+] = Canonical(MCSDOrganizationAffiliation)
    * supportedProfile[+] = Canonical(MCSDOrganizationAffiliationDocShare)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #search-type
    * searchInclude = "OrganizationAffiliation:endpoint"
      * insert Expectation(SHALL)
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "active"
      * type = #token
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "date"
      * type = #date
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "participating-organization"
      * type = #reference
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "primary-organization"
      * type = #reference
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "role"
      * type = #token
  * searchParam[+]
    * insert Expectation(SHALL)
    * name = "_id"
    * type = #token
  * searchParam[+]
    * insert Expectation(SHALL)
    * name = "_lastUpdated"
    * type = #token
    * documentation = "The values for this shall support these prefixes: gt, lt, ge, le, sa, and eb"

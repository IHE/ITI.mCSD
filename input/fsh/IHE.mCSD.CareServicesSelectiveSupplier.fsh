Instance: IHE.mCSD.CareServicesSelectiveSupplier
InstanceOf: CapabilityStatement
Usage: #definition
* version = "20250218"
* name = "IHE_mCSD_Care_Services_Selective_Supplier"
* title = "IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Selective Supplier"
* status = #active
* experimental = false
* date = "2025-02-18"
* description = "CapabilityStatement for Care Services Selective Supplier Actor in the IHE IT Infrastructure Technical Framework Supplement IHE mCSD."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * documentation = "IHE ITI mCSD ITI-90 endpoint"
  * resource[0]
    * type = #HealthcareService
    * supportedProfile = Canonical(MCSDHealthcareService)
    * documentation = "."
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchParam[0]
      * name = "active"
      * type = #token
    * searchParam[+]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "location"
      * type = #reference
    * searchParam[+]
      * name = "name"
      * type = #string
    * searchParam[+]
      * name = "name:contains"
      * type = #string
    * searchParam[+]
      * name = "name:exact"
      * type = #string
    * searchParam[+]
      * name = "organization"
      * type = #reference
    * searchParam[+]
      * name = "service-type"
      * type = #token
  * resource[+]
    * type = #Location
    * supportedProfile[0] = Canonical(MCSDLocation)
    * supportedProfile[+] = Canonical(MCSDFacilityLocation)
    * supportedProfile[+] = Canonical(MCSDJurisdictionLocation)
    * documentation = "."
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchInclude = "Location:organization"
    * searchParam[0]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "name"
      * type = #string
    * searchParam[+]
      * name = "name:contains"
      * type = #string
    * searchParam[+]
      * name = "name:exact"
      * type = #string
    * searchParam[+]
      * name = "organization"
      * type = #reference
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHOULD
      * name = "partof"
      * type = #reference
    * searchParam[+]
      * name = "type"
      * type = #token
    * searchParam[+]
      * name = "status"
      * type = #token
  * resource[+]
    * type = #Organization
    * supportedProfile[0] = Canonical(MCSDOrganization)
    * supportedProfile[+] = Canonical(MCSDFacilityOrganization)
    * supportedProfile[+] = Canonical(MCSDJurisdictionOrganization)
    * documentation = "."
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchInclude = "Organization:endpoint"
    * searchRevInclude[0] = "Location:organization"
    * searchRevInclude[+] = "OrganizationAffiliation:participating-organization"
    * searchRevInclude[+] = "OrganizationAffiliation:primary-organization"
    * searchParam[0]
      * name = "active"
      * type = #token
    * searchParam[+]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "name"
      * type = #string
    * searchParam[+]
      * name = "name:contains"
      * type = #string
    * searchParam[+]
      * name = "name:exact"
      * type = #string
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHOULD
      * name = "partof"
      * type = #reference
    * searchParam[+]
      * name = "type"
      * type = #token
  * resource[+]
    * type = #Practitioner
    * supportedProfile = Canonical(MCSDPractitioner)
    * documentation = "."
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchParam[0]
      * name = "active"
      * type = #token
    * searchParam[+]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "name"
      * type = #string
    * searchParam[+]
      * name = "name:contains"
      * type = #string
    * searchParam[+]
      * name = "name:exact"
      * type = #string
    * searchParam[+]
      * name = "given"
      * type = #string
    * searchParam[+]
      * name = "given:contains"
      * type = #string
    * searchParam[+]
      * name = "given:exact"
      * type = #string
    * searchParam[+]
      * name = "family"
      * type = #string
    * searchParam[+]
      * name = "family:contains"
      * type = #string
    * searchParam[+]
      * name = "family:exact"
      * type = #string
  * resource[+]
    * type = #PractitionerRole
    * supportedProfile = Canonical(MCSDPractitionerRole)
    * documentation = "."
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchInclude = "PractitionerRole:practitioner"
    * searchParam[0]
      * name = "active"
      * type = #token
    * searchParam[+]
      * name = "location"
      * type = #reference
    * searchParam[+]
      * name = "organization"
      * type = #reference
    * searchParam[+]
      * name = "role"
      * type = #token
    * searchParam[+]
      * name = "service"
      * type = #reference
    * searchParam[+]
      * name = "specialty"
      * type = #token
  * resource[+]
    * type = #Endpoint
    * supportedProfile[0] = Canonical(MCSDEndpoint)
    * supportedProfile[+] = Canonical(MCSDEndpointDocShare)
    * documentation = "."
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchParam[0]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "organization"
      * type = #reference
    * searchParam[+]
      * name = "status"
      * type = #token
  * resource[+]
    * type = #OrganizationAffiliation
    * supportedProfile[+] = Canonical(MCSDOrganizationAffiliation)
    * supportedProfile[+] = Canonical(MCSDOrganizationAffiliationDocShare)
    * documentation = "."
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchInclude = "OrganizationAffiliation:endpoint"
    * searchParam[0]
      * name = "active"
      * type = #token
    * searchParam[+]
      * name = "date"
      * type = #date
    * searchParam[+]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "participating-organization"
      * type = #reference
    * searchParam[+]
      * name = "primary-organization"
      * type = #reference
    * searchParam[+]
      * name = "role"
      * type = #token
  * searchParam[0]
    * name = "_id"
    * type = #token
  * searchParam[+]
    * name = "_lastUpdated"
    * type = #token
    * documentation = "The values for this shall support these prefixes: gt, lt, ge, le, sa, and eb"

Instance: IHE.mCSD.Directory.Update
InstanceOf: CapabilityStatement
Usage: #definition
* version = "20250218"
* name = "IHE_mCSD_Directory_Update"
* title = "IHE ITI Mobile Care Services Discovery (mCSD) - Directory with Update Option"
* status = #active
* experimental = false
* date = "2025-02-18"
* description = "CapabilityStatement for Directory Actor with the Update Option in the IHE IT Infrastructure Technical Framework Supplement IHE mCSD."
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * documentation = "IHE ITI mCSD ITI-91 endpoint"
  * resource[+]
    * insert Expectation(MAY)
    * type = #Organization
    * supportedProfile[+] = Canonical(MCSDOrganization)
    * supportedProfile[+] = Canonical(MCSDFacilityOrganization)
    * supportedProfile[+] = Canonical(MCSDJurisdictionOrganization)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #history-type
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "_since"
      * type = #date
  * resource[+]
    * insert Expectation(MAY)
    * type = #Location
    * supportedProfile[+] = Canonical(MCSDLocation)
    * supportedProfile[+] = Canonical(MCSDFacilityLocation)
    * supportedProfile[+] = Canonical(MCSDJurisdictionLocation)
    * supportedProfile[+] = Canonical(MCSDLocationDistance)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #history-type
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "_since"
      * type = #date
  * resource[+]
    * insert Expectation(MAY)
    * type = #Practitioner
    * supportedProfile = Canonical(MCSDPractitioner)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #history-type
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "_since"
      * type = #date
  * resource[+]
    * insert Expectation(MAY)
    * type = #PractitionerRole
    * supportedProfile = Canonical(MCSDPractitionerRole)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #history-type
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "_since"
      * type = #date
  * resource[+]
    * insert Expectation(MAY)
    * type = #HealthcareService
    * supportedProfile = Canonical(MCSDHealthcareService)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #history-type
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "_since"
      * type = #date
  * resource[+]
    * insert Expectation(MAY)
    * type = #Endpoint
    * supportedProfile[+] = Canonical(MCSDEndpoint)
    * supportedProfile[+] = Canonical(MCSDEndpointDocShare)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #history-type
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "_since"
      * type = #date
  * resource[+]
    * insert Expectation(MAY)
    * type = #OrganizationAffiliation
    * supportedProfile[+] = Canonical(MCSDOrganizationAffiliation)
    * supportedProfile[+] = Canonical(MCSDOrganizationAffiliationDocShare)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #history-type
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "_since"
      * type = #date

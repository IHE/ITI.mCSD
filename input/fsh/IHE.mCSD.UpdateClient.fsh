Instance: IHE.mCSD.UpdateClient
InstanceOf: CapabilityStatement
Usage: #definition
* version = "20250218"
* name = "IHE_mCSD_Update_Client"
* title = "IHE ITI Mobile Care Services Discovery (mCSD) - Update Client"
* status = #active
* experimental = false
* date = "2025-02-18"
* description = "CapabilityStatement for Update Client Actor in the IHE IT Infrastructure Technical Framework Supplement IHE mCSD."
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #client
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

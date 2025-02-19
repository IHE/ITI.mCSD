Instance: IHE.mCSD.CareServicesUpdateConsumer
InstanceOf: CapabilityStatement
Usage: #definition
* version = "20250218"
* name = "IHE_mCSD_Care_Services_Update_Consumer"
* title = "IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Update Consumer"
* status = #active
* experimental = false
* date = "2025-02-18"
* description = "CapabilityStatement for Care Services Update Consumer Actor in the IHE IT Infrastructure Technical Framework Supplement IHE mCSD."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #client
  * documentation = "IHE ITI mCSD ITI-91 endpoint"
  * resource[0]
    * type = #Organization
    * supportedProfile[0] = Canonical(MCSDOrganization)
    * supportedProfile[+] = Canonical(MCSDFacilityOrganization)
    * supportedProfile[+] = Canonical(MCSDJurisdictionOrganization)
    * documentation = "."
    * interaction.code = #history-type
    * searchParam
      * name = "_since"
      * type = #date
  * resource[+]
    * type = #Location
    * supportedProfile[0] = Canonical(MCSDLocation)
    * supportedProfile[+] = Canonical(MCSDFacilityLocation)
    * supportedProfile[+] = Canonical(MCSDJurisdictionLocation)
    * documentation = "."
    * interaction.code = #history-type
    * searchParam
      * name = "_since"
      * type = #date
  * resource[+]
    * type = #Practitioner
    * supportedProfile = Canonical(MCSDPractitioner)
    * documentation = "."
    * interaction.code = #history-type
    * searchParam
      * name = "_since"
      * type = #date
  * resource[+]
    * type = #PractitionerRole
    * supportedProfile = Canonical(MCSDPractitionerRole)
    * documentation = "."
    * interaction.code = #history-type
    * searchParam
      * name = "_since"
      * type = #date
  * resource[+]
    * type = #HealthcareService
    * supportedProfile = Canonical(MCSDHealthcareService)
    * documentation = "."
    * interaction.code = #history-type
    * searchParam
      * name = "_since"
      * type = #date
  * resource[+]
    * type = #Endpoint
    * supportedProfile[0] = Canonical(MCSDEndpoint)
    * supportedProfile[+] = Canonical(MCSDEndpointDocShare)
    * documentation = "."
    * interaction.code = #history-type
    * searchParam
      * name = "_since"
      * type = #date
  * resource[+]
    * type = #OrganizationAffiliation
    * supportedProfile[+] = Canonical(MCSDOrganizationAffiliation)
    * supportedProfile[+] = Canonical(MCSDOrganizationAffiliationDocShare)
    * documentation = "."
    * interaction.code = #history-type
    * searchParam
      * name = "_since"
      * type = #date

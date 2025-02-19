Instance: IHE.mCSD.CareServicesFeedSupplier
InstanceOf: CapabilityStatement
Usage: #definition
* version = "20250218"
* name = "IHE_mCSD_Care_Services_Feed_Supplier"
* title = "IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Supplier"
* status = #active
* experimental = false
* date = "2025-02-18"
* description = "CapabilityStatement for Care Services Feed Supplier Actor in the IHE IT Infrastructure Technical Framework Supplement IHE mCSD."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #client
  * documentation = "IHE ITI mCSD ITI-YY1 endpoint"
  * resource[0]
    * type = #HealthcareService
    * supportedProfile = Canonical(MCSDHealthcareService)
    * documentation = "."
    * interaction[+].code = #create
    * interaction[+].code = #update
    * interaction[+].code = #delete
  * resource[+]
    * type = #Location
    * supportedProfile[0] = Canonical(MCSDLocation)
    * supportedProfile[+] = Canonical(MCSDFacilityLocation)
    * supportedProfile[+] = Canonical(MCSDJurisdictionLocation)
    * documentation = "."
    * interaction[+].code = #create
    * interaction[+].code = #update
    * interaction[+].code = #delete
  * resource[+]
    * type = #Organization
    * supportedProfile[0] = Canonical(MCSDOrganization)
    * supportedProfile[+] = Canonical(MCSDFacilityOrganization)
    * supportedProfile[+] = Canonical(MCSDJurisdictionOrganization)
    * documentation = "."
    * interaction[+].code = #create
    * interaction[+].code = #update
    * interaction[+].code = #delete
  * resource[+]
    * type = #Practitioner
    * supportedProfile = Canonical(MCSDPractitioner)
    * documentation = "."
    * interaction[+].code = #create
    * interaction[+].code = #update
    * interaction[+].code = #delete
  * resource[+]
    * type = #PractitionerRole
    * supportedProfile = Canonical(MCSDPractitionerRole)
    * documentation = "."
    * interaction[+].code = #create
    * interaction[+].code = #update
    * interaction[+].code = #delete
  * resource[+]
    * type = #Endpoint
    * supportedProfile[0] = Canonical(MCSDEndpoint)
    * supportedProfile[+] = Canonical(MCSDEndpointDocShare)
    * documentation = "."
    * interaction[+].code = #create
    * interaction[+].code = #update
    * interaction[+].code = #delete
  * resource[+]
    * type = #OrganizationAffiliation
    * supportedProfile[+] = Canonical(MCSDOrganizationAffiliation)
    * supportedProfile[+] = Canonical(MCSDOrganizationAffiliationDocShare)
    * documentation = "."
    * interaction[+].code = #create
    * interaction[+].code = #update
    * interaction[+].code = #delete
  * interaction[+].code = #batch
  * interaction[+].code = #transaction

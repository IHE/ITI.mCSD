Instance: IHE.mCSD.CareServicesSelectiveConsumer.LocationDistance
InstanceOf: CapabilityStatement
Usage: #definition
* version = "20250218"
* name = "IHE_mCSD_Care_Services_Selective_Consumer_Location_Distance_Option"
* title = "IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Selective Consumer Location Distance Option"
* status = #active
* experimental = false
* date = "2025-02-18"
* description = "CapabilityStatement for Care Services Selective Consumer Actor with the Location Distance Option in the IHE IT Infrastructure Technical Framework Supplement IHE mCSD."
* kind = #requirements
* imports = "https://profiles.ihe.net/ITI/mCSD/CapabilityStatement/IHE.mCSD.CareServicesSelectiveConsumer"
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #client
  * documentation = "IHE ITI mCSD ITI-90 endpoint"
  * resource
    * type = #Location
    * supportedProfile = Canonical(MCSDLocationDistance)
    * documentation = "."
    * interaction.code = #search-type
    * searchParam[0]
      * name = "near"
      * type = #token
    * searchParam[+]
      * name = "near-distance"
      * type = #quantity
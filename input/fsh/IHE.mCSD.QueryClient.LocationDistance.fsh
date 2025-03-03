Instance: IHE.mCSD.QueryClient.LocationDistance
InstanceOf: CapabilityStatement
Usage: #definition
* version = "20250218"
* name = "IHE_mCSD_Query_Client_Location_Distance_Option"
* title = "IHE ITI Mobile Care Services Discovery (mCSD) - Query Client Location Distance Option"
* status = #active
* experimental = false
* date = "2025-02-18"
* description = "CapabilityStatement for Query Client Actor with the Location Distance Option in the IHE IT Infrastructure Technical Framework Supplement IHE mCSD."
* kind = #requirements
* imports = "https://profiles.ihe.net/ITI/mCSD/CapabilityStatement/IHE.mCSD.QueryClient"
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #client
  * documentation = "IHE ITI mCSD ITI-90 endpoint"
  * resource[+]
    * insert Expectation(SHALL) 
    * type = #Location
    * supportedProfile = Canonical(MCSDLocationDistance)
    * documentation = "."
    * interaction[+]
      * insert Expectation(SHALL)
      * code = #search-type
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "near"
      * type = #token
    * searchParam[+]
      * insert Expectation(SHALL)
      * name = "near-distance"
      * type = #quantity
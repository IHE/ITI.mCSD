Instance: IHE.mCSD.CareServicesUpdateConsumer.LocationDistance
InstanceOf: CapabilityStatement
Usage: #definition
* version = "20250218"
* name = "IHE_mCSD_Care_Services_Update_Consumer_Location_Distance_Option"
* title = "IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Update Consumer Location Distance Option"
* status = #active
* experimental = false
* date = "2025-02-18"
* description = "CapabilityStatement for Care Services Update Consumer Actor with the Location Distance option in the IHE IT Infrastructure Technical Framework Supplement IHE mCSD."
* kind = #requirements
* imports = "https://profiles.ihe.net/ITI/mCSD/CapabilityStatement/IHE.mCSD.CareServicesUpdateConsumer"
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #client
  * documentation = "IHE ITI mCSD ITI-91 endpoint"
  * resource
    * type = #Location
    * supportedProfile = Canonical(MCSDLocationDistance)
    * documentation = "."

Instance: IHE.mCSD.CareServicesUpdateSupplier.LocationDistance
InstanceOf: CapabilityStatement
Usage: #definition
* version = "20250218"
* name = "IHE_mCSD_Care_Services_Update_Supplier_Location_Distance_Option"
* title = "IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Update Supplier Location Distance Option"
* status = #active
* experimental = false
* date = "2025-02-18"
* description = "CapabilityStatement for Care Services Update Supplier Actor with the Location Distance option in the IHE IT Infrastructure Technical Framework Supplement IHE mCSD."
* kind = #requirements
* imports = "https://profiles.ihe.net/ITI/mCSD/CapabilityStatement/IHE.mCSD.CareServicesUpdateSupplier"
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * documentation = "IHE ITI mCSD ITI-91 endpoint"
  * resource
    * type = #Location
    * supportedProfile = Canonical(MCSDLocationDistance)
    * documentation = "."

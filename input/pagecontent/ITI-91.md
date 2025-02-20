
### 2:3.91.1 Scope

The Request Care Services Updates transaction is used to return a list of updated care services resources. A Care Services Update Consumer initiates a Request Care Services Updates transaction against a Care Services Update Supplier.

### 2:3.91.2 Actor Roles

| Actor | Role |
| ----- | ---- |
| Care Services Update Consumer | Requests a list of updated resources from the Care Services Update Supplier. |
| Care Services Update Supplier | Accepts the update request and returns a list of updated resources.          |
{: .grid}

### 2:3.91.3 Referenced Standards

  - [HL7 FHIR standard Release 4]({{site.data.fhir.path}}index.html)


### 2:3.91.4 Messages

<div>
{%include ITI-91-seq.svg%}
</div>
<br clear="all">

**Figure 2:3.91.4-1: Interaction Diagram**

#### 2:3.91.4.1 Request Care Services Updates Request Message

A Request Care Services Updates message is a FHIR history operation, optionally using the ```_since``` parameter, on the mCSD Resources.

##### 2:3.91.4.1.1 Trigger Events

A Care Services Update Consumer triggers a Request Care Services Updates Request to a Care Services Update Supplier according to the business rules for the query. These business rules are outside the scope of this transaction.

##### 2:3.91.4.1.2 Message Semantics

A Care Services Update Consumer initiates a history request using HTTP GET as defined at [{{site.data.fhir.path}}http.html#history]({{site.data.fhir.path}}http.html#history) on the mCSD Resources.

A Care Services Update Supplier and Care Services Update Consumer shall support the following parameters.

```
_since
```

They shall also support the requirements in [ITI TF-2: Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format), Populating the Expected Response Format.

A Care Services Update Supplier shall support receiving a request for both the JSON and the XML messaging formats as defined in FHIR. A Care Services Update Consumer shall accept either the JSON or the XML messaging formats as defined in FHIR.

See [ITI TF-2: Appendix W](https://profiles.ihe.net/ITI/TF/Volume2/ch-W.html) for informative implementation material for this transaction.

See the CapabilityStatements for the Care Services Update Consumer for additional details:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Update Consumer](CapabilityStatement-IHE.mCSD.CareServicesUpdateConsumer.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Update Consumer Location Distance Option](CapabilityStatement-IHE.mCSD.CareServicesUpdateConsumer.LocationDistance.html)

##### 2:3.91.4.1.3 Expected Actions

The Care Services Update Supplier shall process the query to discover the resources that match the search parameters given, and gives a response as per [Section 2:3.91.4.2](#239142-request-care-services-updates-response-message) or an error as per [{{site.data.fhir.path}}search.html#errors]({{site.data.fhir.path}}search.html#errors).

#### 2:3.91.4.2 Request Care Services Updates Response Message

The Request Care Services Updates \[ITI-91\] transaction uses the response semantics as defined at [{{site.data.fhir.path}}http.html#history]({{site.data.fhir.path}}http.html#history) as applicable for the resources.

##### 2:3.91.4.2.1 Trigger Events

The Care Services Update Supplier sends the Request Care Services Updates Response to the Care Services Update Consumer when results are ready.

##### 2:3.91.4.2.2 Message Semantics

The Care Services Update Supplier shall support the history response message as defined at [http://hl7.org.fhir/R4/http.html#history](http://hl7.org.fhir/R4/http.html#history) on the Care Services Resources:
    
All References (reference.reference element) to Resources defined in
this transaction shall be populated with an accessible URL (see
[https://www.hl7.org/fhir/references-definitions.html#Reference.reference](https://www.hl7.org/fhir/references-definitions.html#Reference.reference)), unless the referenced resource is not present on a server
accessible to the client.

See the CapabilityStatements for the Care Services Update Supplier for additional details:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Update Supplier](CapabilityStatement-IHE.mCSD.CareServicesUpdateSupplier.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Update Supplier Location Distance Option](CapabilityStatement-IHE.mCSD.CareServicesUpdateSupplier.LocationDistance.html)

###### 2:3.91.4.2.2.1 FHIR Organization Resource Constraints

A Care Services Update Consumer and a Care Services Update Supplier shall query or return an Organization Resource. The Organization Resource shall be further constrained as described in the [Organization Profile for mCSD](StructureDefinition-IHE.mCSD.Organization.html).

When the Organization represents a Facility and is paired with a Location, the FHIR Organization Resource shall be further constrained as described in the [Organization for Facilities Profile for mCSD](StructureDefinition-IHE.mCSD.FacilityOrganization.html).

When the Organization represents a Jurisdiction and is paired with a Location, the FHIR Organization Resource shall be further constrained as described in the [Organization for Jurisdictions Profile for mCSD](StructureDefinition-IHE.mCSD.JurisdictionOrganization.html).

###### 2:3.91.4.2.2.2 FHIR Location Resource Constraints

A Care Services Update Consumer and a Care Services Update Supplier shall query or return a Location Resource. The Location Resource shall be further constrained as described in the [Location Profile for mCSD](StructureDefinition-IHE.mCSD.Location.html).

When the Location represents a Facility and is paired with an Organization, the FHIR Location Resource shall be further constrained as described in the 
[Location for Facilities Profile for mCSD](StructureDefinition-IHE.mCSD.FacilityLocation.html).

When the Location represents a Jurisdiction and is paired with an Organization, the FHIR Location Resource shall be further constrained as described in the [Location for Jurisdictions Profile for mCSD](StructureDefinition-IHE.mCSD.JurisdictionLocation.html).

When supporting the Location Distance Option, the FHIR Location Resource shall be further constrained as described in the [Location with Distance Option Profile for mCSD](StructureDefinition-IHE.mCSD.LocationDistance.html).

###### 2:3.91.4.2.2.3 FHIR Practitioner Resource Constraints

A Care Services Update Consumer and a Care Services Update Supplier shall query or return a Practitioner Resource. The Practitioner Resource shall be further constrained as described in the [Practitioner Profile for mCSD](StructureDefinition-IHE.mCSD.Practitioner.html).

###### 2:3.91.4.2.2.4 FHIR PractitionerRole Resource Constraints

A Care Services Update Consumer and a Care Services Update Supplier shall query or return a PractitionerRole Resource. The PractitionerRole Resource shall be further constrained as described in the [PractitionerRole Profile for mCSD](StructureDefinition-IHE.mCSD.PractitionerRole.html).

###### 2:3.91.4.2.2.5 FHIR HealthcareService Resource Constraints

A Care Services Update Consumer and a Care Services Update Supplier shall query or return a HealthcareService Resource. The HealthcareService Resource shall be further constrained as described in the [HealthcareService Profile for mCSD](StructureDefinition-IHE.mCSD.HealthcareService.html).

###### 2:3.91.4.2.2.6 FHIR OrganizationAffiliation Resource Constraints

A Care Services Update Consumer may query on OrganizationAffiliation Resources. A Care Services Update Supplier shall return a Bundle of matching OrganizationAffiliation Resources. The OrganizationAffiliation Resource shall be further constrained as described in the [OrganizationAffiliation Profile for mCSD](StructureDefinition-IHE.mCSD.OrganizationAffiliation.html).

When the OrganizationAffiliation contains an Endpoint to an IHE document sharing environment, it shall further be constrained as described in the [OrganizationAffiliation for Document Sharing Profile for mCSD](StructureDefinition-IHE.mCSD.OrganizationAffiliation.DocShare.html).

###### 2:3.91.4.2.2.7 FHIR Endpoint Resource Constraints

A Care Services Update Consumer may query on Endpoint Resources. A Care Services Update Supplier shall return a Bundle of matching Endpoint Resources. The Endpoint Resource shall be further constrained as described in the [Endpoint Profile for mCSD](StructureDefinition-IHE.mCSD.Endpoint.html).

When the Endpoint is to an IHE document sharing environment, it shall further be constrained as described in the [Endpoint for Document Sharing Profile for mCSD](StructureDefinition-IHE.mCSD.Endpoint.DocShare.html).

##### 2:3.91.4.2.3 Expected Actions

The Care Services Update Consumer has received the response and continues with its workflow.

### 2:3.91.5 Security Considerations

See [ITI TF-1: 46.5](volume-1.html#1465-mcsd-security-considerations) for security considerations for the mCSD Profile.

See [ITI TF-2: Appendix Z.8](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations) for common mobile security considerations.

#### 2:3.91.5.1 Security Audit Considerations

Note that the same audit message is recorded by both Care Services Update Supplier and Care Services Update Consumer. The
difference being the Audit Source element. Both sides record to show consistency
between the message sent by the Supplier and the action taken at the Consumer.

The actors involved shall record audit events according to the
[Audit Event for Request Care Services Updates by the Care Services Update Supplier and Consumer](StructureDefinition-IHE.mCSD.Audit.CareServices.Updates.html).


### 2:3.90.1 Scope

The Find Matching Care Services transaction returns a list of matching care services resources based on the query sent. A Care Services Selective Consumer initiates a Find Matching Care Services transaction against a Care Services Selective Supplier.

### 2:3.90.2 Actor Roles

| **Actor** | **Role** |
| ----- | ---- |
| Care Services Selective Consumer  | Requests a list of resources from the Care Services Selective Supplier based on query parameters |
| Care Services Selective Supplier  | Accepts the query request and returns a list of matching resources                              |
{: .grid}

### 2:3.90.3 Referenced Standards

  - HL7 FHIR standard Release 4 [{{site.data.fhir.path}}index.html]({{site.data.fhir.path}}index.html)

### 2:3.90.4 Messages

<div>
{%include ITI-90-seq.svg%}
</div>
<br clear="all">

**Figure 2:3.90.4-1: Interaction Diagram**

#### 2:3.90.4.1 Find Matching Care Services Request Message

The Find Matching Care Services message is a FHIR search operation on the mCSD Resources.

##### 2:3.90.4.1.1 Trigger Events

A Care Services Selective Consumer triggers a Find Matching Care Services Request to a Care Services Selective Supplier according to the business rules for the query. These business rules are outside the scope of this transaction.

##### 2:3.90.4.1.2 Message Semantics

A Care Services Selective Consumer initiates a search request using HTTP GET or POST as defined at [{{site.data.fhir.path}}http.html#search]({{site.data.fhir.path}}http.html#search) on the mCSD Resources. The Care Services Selective Supplier shall support both GET and POST based searches. The query parameters are identified below. A Care Services Selective Consumer may query any combination or subset of the parameters.

A Care Services Selective Supplier shall support responding to a request for both the JSON and the XML messaging formats as defined in FHIR. A Care Services Selective Consumer shall accept either the JSON or the XML messaging formats as defined in FHIR. See [ITI TF-2: Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details.

A Care Services Selective Supplier shall implement the parameters described below for the mCSD resources it supports. A Care Services Selective Supplier may choose to support additional query parameters beyond the subset listed below. Any additional query parameters supported shall be supported according to the core FHIR specification.

See [ITI TF-2: Appendix W](https://profiles.ihe.net/ITI/TF/Volume2/ch-W.html) for informative implementation material for this transaction.

See the CapabilityStatements for the Care Services Selective Consumer for additional details:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Selective Consumer](CapabilityStatement-IHE.mCSD.CareServicesSelectiveConsumer.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Selective Consumer Location Distance Option](CapabilityStatement-IHE.mCSD.CareServicesSelectiveConsumer.LocationDistance.html)

###### 2:3.90.4.1.2.1 Common Parameters

The Care Services Selective Supplier shall support the `:contains` and `:exact` modifiers in all of the string query parameters below.

The Care Services Selective Supplier shall support the following search parameters as defined at [{{site.data.fhir.path}}search.html#all]({{site.data.fhir.path}}search.html#all).

```
_id
_lastUpdated
```

The Care Services Selective Supplier shall also support the following prefixes for the `_lastUpdated` parameter: `gt`, `lt`, `ge`, `le`, `sa`, and `eb`.

###### 2:3.90.4.1.2.2 Organization Resource Message Semantics

The Care Services Selective Supplier shall support the following search parameters on the Organization Resource as defined at [{{site.data.fhir.path}}organization.html#search]({{site.data.fhir.path}}organization.html#search). String parameter modifiers are defined at [{{site.data.fhir.path}}search.html#string]({{site.data.fhir.path}}search.html#string).

```
active
identifier
name
type
_include=Organization:endpoint
_revInclude=Location:organization
_revInclude=OrganizationAffiliation:participating-organization
_revInclude=OrganizationAffiliation:primary-organization
```

The Care Services Selective Supplier should support the following search parameters on the Organization Resource.

```
partof
```

###### 2:3.90.4.1.2.3 Location Resource Message Semantics

The Care Services Selective Supplier shall support the following search parameters on the Location Resource as defined at [{{site.data.fhir.path}}location.html#search]({{site.data.fhir.path}}location.html#search). String parameter modifiers are defined at [{{site.data.fhir.path}}search.html#string]({{site.data.fhir.path}}search.html#string).

```
identifier
name
organization
status
type
_include=Location:organization
```

The Care Services Selective Supplier should support the following search parameters on the Location Resource.

```
partof
```

###### 2:3.90.4.1.2.4 Practitioner Resource Message Semantics

The Care Services Selective Supplier shall support the following search parameters on the Practitioner Resource as defined at [{{site.data.fhir.path}}practitioner.html#search]({{site.data.fhir.path}}practitioner.html#search). String parameter modifiers are defined at [{{site.data.fhir.path}}search.html#string]({{site.data.fhir.path}}search.html#string).

```
active
identifier
name
given
family
```

###### 2:3.90.4.1.2.5 PractitionerRole Resource Message Semantics

The Care Services Selective Supplier shall support the following search parameters on the PractitionerRole Resource as defined at [{{site.data.fhir.path}}practitionerrole.html#search]({{site.data.fhir.path}}practitionerrole.html#search).

```
active
location
organization
practitioner
role
service
specialty
_include=PractitionerRole:practitioner
```

###### 2:3.90.4.1.2.6 HealthcareService Resource Message Semantics

The Care Services Selective Supplier shall support the following search parameters on the HealthcareService Resource as defined at [{{site.data.fhir.path}}healthcareservice.html#search]({{site.data.fhir.path}}healthcareservice.html#search). String parameter modifiers are defined at [{{site.data.fhir.path}}search.html#string]({{site.data.fhir.path}}search.html#string).

```
active
identifier
location
name
organization
service-type
```

###### 2:3.90.4.1.2.7 Location Distance Option Message Semantics

The Care Services Selective Supplier supporting the Location Distance Option shall support the following search parameters on the Location Resource as defined at [{{site.data.fhir.path}}location.html#search]({{site.data.fhir.path}}location.html#search).

```
near
```

###### 2:3.90.4.1.2.8 Endpoint Resource Message Semantics

The Care Services Selective Supplier shall support the following search parameters on the Endpoint Resource as defined at [{{site.data.fhir.path}}endpoint.html#search]({{site.data.fhir.path}}endpoint.html#search). String parameter modifiers are defined at [{{site.data.fhir.path}}search.html#string]({{site.data.fhir.path}}search.html#string).

```
identifier
organization
status
```

###### 2:3.90.4.1.2.9 OrganizationAffiliation Resource Message Semantics

The Care Services Selective Supplier shall support the following search parameters on the OrganizationAffiliation Resource as defined at [{{site.data.fhir.path}}organizationaffiliation.html#search]({{site.data.fhir.path}}organizationaffiliation.html#search). String parameter modifiers are defined at [{{site.data.fhir.path}}search.html#string]({{site.data.fhir.path}}search.html#string).

```
active
date
identifier
participating-organization
primary-organization
role
_include=OrganizationAffiliation:endpoint
```

##### 2:3.90.4.1.3 Expected Actions

The Care Services Selective Supplier shall process the query to discover the resources that match the search parameters given, and return a response as per Section 2:3.90.4.2 or an error as per
[{{site.data.fhir.path}}search.html#errors]({{site.data.fhir.path}}search.html#errors).

#### 2:3.90.4.2 Find Matching Care Services Response Message

##### 2:3.90.4.2.1 Trigger Events

The Care Services Selective Supplier sends the Find Matching Care Services Response to the Care Services Selective Consumer when results to the query are ready.

##### 2:3.90.4.2.2 Message Semantics

The Care Services Selective Supplier shall support the search response message as defined at [{{site.data.fhir.path}}http.html#search]({{site.data.fhir.path}}http.html#search) on the Care Services Resources.

It is possible to use HTTP protocol or HTTPS protocol. The HTTPS protocol is highly recommended.

They shall also support the requirements in [ITI TF-2: Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format), Populating the Expected Response Format.

All References (Reference.reference element) to Resources defined in this transaction shall be populated with an accessible URL (see [https://www.hl7.org/fhir/references-definitions.html#Reference.reference](https://www.hl7.org/fhir/references-definitions.html#Reference.reference)), unless the referenced resource is not available at a URL known to the server.

See the CapabilityStatements for the Care Services Selective Supplier for additional details:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Selective Supplier](CapabilityStatement-IHE.mCSD.CareServicesSelectiveSupplier.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Selective Supplier Location Distance Option](CapabilityStatement-IHE.mCSD.CareServicesSelectiveSupplier.LocationDistance.html)

###### 2:3.90.4.2.2.1 FHIR Organization Resource Constraints

A Care Services Selective Consumer may query on Organization Resources. A Care Services Selective Supplier shall return a Bundle of matching Organization Resources. The Organization Resource shall be further constrained as described in the [Organization Profile for mCSD](StructureDefinition-IHE.mCSD.Organization.html).

A Care Services Selective Consumer may query on Organization Resources when working with Facilities. A Care Services Selective Supplier shall return a Bundle of matching Organization Resources when working with Facilities. The FHIR Organization Resource shall be further constrained as described in the [Organization for Facilities Profile for mCSD](StructureDefinition-IHE.mCSD.FacilityOrganization.html).

A Care Services Selective Consumer may query on Organization Resources when working with Jurisdictions. A Care Services Selective Supplier shall return a Bundle of matching Organization Resources when working with Jurisdictions. The FHIR Organization Resource shall be further constrained as described in the [Organization for Jurisdictions Profile for mCSD](StructureDefinition-IHE.mCSD.JurisdictionOrganization.html).

###### 2:3.90.4.2.2.2 FHIR Location Resource Constraints

A Care Services Selective Consumer may query on Location Resources. A Care Services Selective Supplier shall return a Bundle of matching Location Resources. The Location Resource shall be further constrained as described in the [Location Profile for mCSD](StructureDefinition-IHE.mCSD.Location.html).

When the resource is a Facility, the Location Resource shall be paired with an Organization Resource using the managingOrganization element in Location. A Care Services Selective Consumer may query on Location Resources when working with Facilities. A Care Services Selective Supplier shall return a Bundle of matching Location Resources when working with Facilities. The FHIR Location Resource shall be further constrained as described in the [Location for Facilities Profile for mCSD](StructureDefinition-IHE.mCSD.FacilityLocation.html).

When the resource is a Jurisdiction, the Location Resource shall be paired with an Organization Resource using the managingOrganization element in Location. A Care Services Selective Consumer 
may query on Location Resources when working with Jurisdictions. A Care Services Selective Supplier shall return a Bundle of matching Location Resources when working with Jurisdictions. The FHIR Location Resource shall be further constrained as described in the [Location for Jurisdictions Profile for mCSD](StructureDefinition-IHE.mCSD.JurisdictionLocation.html).

When a geographic boundary is available for the Jurisdiction Location, the location-boundary-geojson extension defined at [http://hl7.org/fhir/extension-location-boundary-geojson.html](http://hl7.org/fhir/extension-location-boundary-geojson.html) shall be used to store this information.

When supporting the Location Distance Option, the Location Resource shall be further constrained as described in the [Location with Distance Option Profile for mCSD](StructureDefinition-IHE.mCSD.LocationDistance.html).

###### 2:3.90.4.2.2.3 FHIR Practitioner Resource Constraints

A Care Services Selective Consumer may query on Practitioner Resources. A Care Services Selective Supplier shall return a Bundle of matching Practitioner Resources. The Practitioner Resource shall be further constrained as described in the [Practitioner Profile for mCSD](StructureDefinition-IHE.mCSD.Practitioner.html).

###### 2:3.90.4.2.2.4 FHIR PractitionerRole Resource Constraints

A Care Services Selective Consumer may query on PractitionerRole Resources. A Care Services Selective Supplier shall return a Bundle of matching PractitionerRole Resources. The PractitionerRole Resource shall be further constrained as described in the 
[PractitionerRole Profile for mCSD](StructureDefinition-IHE.mCSD.PractitionerRole.html).

###### 2:3.90.4.2.2.5 FHIR HealthcareService Resource Constraints

A Care Services Selective Consumer may query on HealthcareService Resources. A Care Services Selective Supplier shall return a Bundle of matching HealthcareService Resources. The HealthcareService Resource shall be further constrained as described in the [HealthcareService Profile for mCSD](StructureDefinition-IHE.mCSD.HealthcareService.html).

###### 2:3.90.4.2.2.6 FHIR OrganizationAffiliation Resource Constraints

A Care Services Selective Consumer may query on OrganizationAffiliation Resources. A Care Services Selective Supplier shall return a Bundle of matching OrganizationAffiliation Resources. The OrganizationAffiliation Resource shall be further constrained as described in the [OrganizationAffiliation Profile for mCSD](StructureDefinition-IHE.mCSD.OrganizationAffiliation.html).

When the OrganizationAffiliation contains an Endpoint to an IHE document sharing environment, it shall further be constrained as described in the [OrganizationAffiliation for Document Sharing Profile for mCSD](StructureDefinition-IHE.mCSD.OrganizationAffiliation.DocShare.html).

###### 2:3.90.4.2.2.7 FHIR Endpoint Resource Constraints

A Care Services Selective Consumer may query on Endpoint Resources. A Care Services Selective Supplier shall return a Bundle of matching Endpoint Resources. The Endpoint Resource shall be further constrained as described in the [Endpoint Profile for mCSD](StructureDefinition-IHE.mCSD.Endpoint.html).

When the Endpoint is to an IHE document sharing environment, it shall further be constrained as described in the [Endpoint for Document Sharing Profile for mCSD](StructureDefinition-IHE.mCSD.Endpoint.DocShare.html).

##### 2:3.90.4.2.3 Expected Actions

The Care Services Selective Consumer has received the response and continues with its workflow.

#### 2:3.90.4.3 Retrieve Care Services Resource message
This message represents an HTTP GET from the Care Services Selective Consumer to the Care Services Selective Supplier and provides a mechanism for retrieving a single Care Services Resource with a known resource identifier.

##### 2:3.90.4.3.1 Trigger Events
When the Care Services Selective Consumer possesses a Care Services Resource identifier (either through query, database lookup, or other mechanism) for which it requires additional or new information, it issues a Retrieve Care Services Resource interaction.

##### 2:3.90.4.3.2  Message Semantics
The Retrieve Care Services Resource is conducted by executing an HTTP GET against the Care Services Selective Supplier’s Care Services Resource URL, providing the resource id of the resource being retrieved. The target is formatted as:

```    GET [base]/[resource]/[resourceId]```

The Care Services Selective Supplier shall respond to this query by sending a single Care Services Resource instance.

The `resourceId` included in the request always represents the unique identifier for the Resource within the scope of the URL. For example, while `http://example1.org/ihe/Practitioner/1` and `http://example2.com/ihe/Practitioner/1` both contain the same `[resourceId]`, they reference two different resource instances.

Note: The use of "http" or "https" in URL does not override requirements to use TLS for security purposes.

See the CapabilityStatements for the Care Services Selective Consumer for additional details:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Selective Consumer](CapabilityStatement-IHE.mCSD.CareServicesSelectiveConsumer.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Selective Consumer Location Distance Option](CapabilityStatement-IHE.mCSD.CareServicesSelectiveConsumer.LocationDistance.html)

##### 2:3.90.4.3.3 Expected Actions
The Care Services Selective Supplier shall retrieve the record indicated by the Resource identifier on the HTTP GET supplied by the Care Services Selective Consumer. The Care Services Selective Supplier shall respond to the retrieve request as described by the following cases:

**Case 1**: The Care Services Selective Supplier finds the care services record matching the `resourceId` sent in the HTTP request.

`HTTP 200` (OK) is returned as the HTTP status code.

A Care Services Resource is returned representing the result.

**Case 2**: The Care Services Selective Supplier fails to find the care services record matching the `resourceId` sent in the HTTP request.

`HTTP 404` (Not Found) is returned as the HTTP status code

An `OperationOutcome` Resource is returned indicating that the Care Services Resource could not be found, in an issue having:

Attribute|Value
---|---
severity|error
code|not-found
{:.grid}

The Care Services Selective Supplier may return other HTTP status codes to represent specific error conditions. When HTTP error status codes are returned by the Care Services Selective Supplier, they shall conform to the HTTP standard [RFC2616](https://tools.ietf.org/html/rfc2616). Their use is not further constrained or specified by this transaction.

#### 2:3.90.4.4 Retrieve Care Services Resource Response message

The Care Services Selective Supplier’s response to a successful Retrieve Care Services Resource message shall be an `HTTP 200` (OK) Status code with a Care Services Resource, or an appropriate error code.  See the [Retrieve Care Services Resource message expected actions](#2390433-expected-actions) for additional details.

##### 2:3.90.4.4.1 Trigger Events
The Care Services Selective Supplier found a record matching the Resource identifier specified by the Care Services Selective Consumer.

##### 2:3.90.4.4.2 Message Semantics
The Retrieve Care Services Resource response is sent from the Care Services Selective Supplier to the Care Services Selective Consumer as a single Care Services Resource. 

See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details on response format handling. See [ITI TF-2: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.7-guidance-on-access-denied-results) for guidance on Access Denied.

If the Care Services Selective Supplier is unable to produce a response in the requested format, it shall respond with an `HTTP 400` error indicating that it was unable to fulfill the request. The Care Services Selective Supplier may be capable of servicing requests for response formats not listed, but shall, at minimum, be capable of producing XML and JSON encodings.

See the CapabilityStatements for the Care Services Selective Supplier for additional details:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Selective Supplier](CapabilityStatement-IHE.mCSD.CareServicesSelectiveSupplier.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Selective Supplier Location Distance Option](CapabilityStatement-IHE.mCSD.CareServicesSelectiveSupplier.LocationDistance.html)

###### 2:3.90.4.4.2.1 Care Services Resource Definition in the Context of Care Services Resource Response
The Care Services Resource definition in the context of a retrieve interaction is the FHIR definition of the various Care Services Resources. Table 2:3.90.4.4.2.1-1 lists the resources with where to find the additional constraints.

**Table 2:3.90.4.4.2.1-1: Care Services Resource Constraints**

| Resource | Section |
| ------------------- | --------- |
| `Organization`      | [2:3.90.4.2.2.1 FHIR Organization Resource Constraints](#23904221-fhir-organization-resource-constraints) |
| `Location`          | [2:3.90.4.2.2.2 FHIR Location Resource Constraints](#23904222-fhir-location-resource-constraints) |
| `Practitioner`      | [2:3.90.4.2.2.3 FHIR Practitioner Resource Constraints](#23904223-fhir-practitioner-resource-constraints) |
| `PractitionerRole`  | [2:3.90.4.2.2.4 FHIR PractitionerRole Resource Constraints](#23904224-fhir-practitionerrole-resource-constraints) |
| `HealthcareService` | [2:3.90.4.2.2.5 FHIR HealthcareService Resource Constraints](#23904225-fhir-healthcareservice-resource-constraints) |
| `OrganizationAffiliation` | [2:3.90.4.2.2.6 FHIR OrganizationAffiliation Resource Constraints](#23904226-fhir-organizationaffiliation-resource-constraints) |
| `Endpoint` | [2:3.90.4.2.2.7 FHIR Endpoint Resource Constraints](#23904227-fhir-endpoint-resource-constraints) |
{: .grid .table-striped}

### 2:3.90.5 Security Considerations

See [ITI TF-1: 46.5](volume-1.html#1465-mcsd-security-considerations) for security considerations for the mCSD Profile.

See [ITI TF-2: Appendix Z.8](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations) for common mobile security considerations.

#### 2:3.90.5.1 Security Audit Considerations

Note that the same audit message is recorded by both Care Services Selective Supplier and Care Services Selective Consumer. The
difference being the Audit Source element. Both sides record to show consistency
between the message sent by the Consumer and the action taken at the Supplier.

The actors involved shall record audit events according to the
[Audit Event for Find Matching Care Services for Read by the Care Services Selective Supplier and Consumer](StructureDefinition-IHE.mCSD.Audit.CareServices.Read.html)
or the [Audit Event for Find Matching Care Services for Query by the Care Services Selective Supplier and Consumer](StructureDefinition-IHE.mCSD.Audit.CareServices.Query.html).

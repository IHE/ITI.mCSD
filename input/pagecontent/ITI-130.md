
### 2:3.YY1.1 Scope

The Care Services Feed transaction is used to create, update, or delete care services resources. A Care Services Feed Supplier initiates a Care Services Feed transaction against a Care Services Feed Consumer.

### 2:3.YY1.2 Actor Roles

| Actor | Role |
| ----- | ---- |
| Care Services Feed Supplier | Sends the feed request to the Care Services Feed Consumer.          |
| Care Services Feed Consumer | Receives and processes the feed request. |
{: .grid}

### 2:3.YY1.3 Referenced Standards

  - [HL7 FHIR standard Release 4]({{site.data.fhir.path}}index.html)


### 2:3.YY1.4 Messages

<div>
{%include ITI-YY1-seq.svg%}
</div>
<br clear="all">

**Figure 2:3.YY1.4-1: Interaction Diagram**

#### 2:3.YY1.4.1 Create Care Services Resource Request Message

A Create Care Services Resource Request Message is a FHIR create operation on any supported Care Services resource the Care Services Feed Consumer supports.

##### 2:3.YY1.4.1.1 Trigger Events

A Care Services Feed Supplier triggers a Create Care Services Resource Request to a Care Services Feed Consumer when it needs to submit a new Care Services resource.

##### 2:3.YY1.4.1.2 Message Semantics

A Care Services Feed Supplier SHALL initiate a create request using HTTP POST as defined at [{{site.data.fhir.path}}http.html#create]({{site.data.fhir.path}}http.html#create) on the Care Services Resource. 

A Care Services Feed Supplier SHALL submit the Care Services resource in either XML format or JSON format 
thus the media type of the HTTP body SHALL be either `application/fhir+json` or `application/fhir+xml` respectively.
A Care Services Feed Consumer SHALL accept both XML and JSON formats.

It is possible to use HTTP protocol or HTTPS protocol. The HTTPS protocol is highly recommended.

They shall also support the requirements in [ITI TF-2: Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format), Populating the Expected Response Format.

All References (Reference.reference element) to Resources defined in this transaction shall be populated with an accessible URL (see [https://www.hl7.org/fhir/references-definitions.html#Reference.reference](https://www.hl7.org/fhir/references-definitions.html#Reference.reference)), unless the referenced resource is not available at a URL known to the server.

See the CapabilityStatements for the Care Services Feed Supplier for additional details:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Supplier](CapabilityStatement-IHE.mCSD.CareServicesFeedSupplier.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Supplier Location Distance Option](CapabilityStatement-IHE.mCSD.CareServicesFeedSupplier.LocationDistance.html)

###### 2:3.YY1.4.1.2.1 FHIR Organization Resource Constraints

A Care Services Feed Supplier may submit Organization Resources. The Organization Resource shall be further constrained as described in the [Organization Profile for mCSD](StructureDefinition-IHE.mCSD.Organization.html).

A Care Services Feed Supplier may submit Organization Resources when working with Facilities. The FHIR Organization Resource shall be further constrained as described in the [Organization for Facilities Profile for mCSD](StructureDefinition-IHE.mCSD.FacilityOrganization.html).

A Care Services Feed Supplier may submit Organization Resources when working with Jurisdictions. The FHIR Organization Resource shall be further constrained as described in the [Organization for Jurisdictions Profile for mCSD](StructureDefinition-IHE.mCSD.JurisdictionOrganization.html).

###### 2:3.YY1.4.1.2.2 FHIR Location Resource Constraints

A Care Services Feed Supplier may submit Location Resources. A Care Services Selective Supplier shall return a Bundle of matching Location Resources. The Location Resource shall be further constrained as described in the [Location Profile for mCSD](StructureDefinition-IHE.mCSD.Location.html).

When the resource is a Facility, the Location Resource shall be paired with an Organization Resource using the managingOrganization element in Location. A Care Services Feed Supplier may submit Location Resources when working with Facilities. The FHIR Location Resource shall be further constrained as described in the [Location for Facilities Profile for mCSD](StructureDefinition-IHE.mCSD.FacilityLocation.html).

When the resource is a Jurisdiction, the Location Resource shall be paired with an Organization Resource using the managingOrganization element in Location. A Care Services Feed Supplier may submit Location Resources when working with Jurisdictions. The FHIR Location Resource shall be further constrained as described in the [Location for Jurisdictions Profile for mCSD](StructureDefinition-IHE.mCSD.JurisdictionLocation.html).

When a geographic boundary is available for the Jurisdiction Location, the location-boundary-geojson extension defined at [http://hl7.org/fhir/extension-location-boundary-geojson.html](http://hl7.org/fhir/extension-location-boundary-geojson.html) shall be used to store this information.

When supporting the Location Distance Option, the Location Resource shall be further constrained as described in the [Location with Distance Option Profile for mCSD](StructureDefinition-IHE.mCSD.LocationDistance.html).

###### 2:3.YY1.4.1.2.3 FHIR Practitioner Resource Constraints

A Care Services Feed Supplier may submit Practitioner Resources. The Practitioner Resource shall be further constrained as described in the [Practitioner Profile for mCSD](StructureDefinition-IHE.mCSD.Practitioner.html).

###### 2:3.YY1.4.1.2.4 FHIR PractitionerRole Resource Constraints

A Care Services Feed Supplier may submit PractitionerRole Resources. The PractitionerRole Resource shall be further constrained as described in the 
[PractitionerRole Profile for mCSD](StructureDefinition-IHE.mCSD.PractitionerRole.html).

###### 2:3.YY1.4.1.2.5 FHIR HealthcareService Resource Constraints

A Care Services Feed Supplier may submit HealthcareService Resources. The HealthcareService Resource shall be further constrained as described in the [HealthcareService Profile for mCSD](StructureDefinition-IHE.mCSD.HealthcareService.html).

###### 2:3.YY1.4.1.2.6 FHIR OrganizationAffiliation Resource Constraints

A Care Services Feed Supplier may submit OrganizationAffiliation Resources. The OrganizationAffiliation Resource shall be further constrained as described in the [OrganizationAffiliation Profile for mCSD](StructureDefinition-IHE.mCSD.OrganizationAffiliation.html).

When the OrganizationAffiliation contains an Endpoint to an IHE document sharing environment, it shall further be constrained as described in the [OrganizationAffiliation for Document Sharing Profile for mCSD](StructureDefinition-IHE.mCSD.OrganizationAffiliation.DocShare.html).

###### 2:3.YY1.4.1.2.7 FHIR Endpoint Resource Constraints

A Care Services Feed Supplier may submit Endpoint Resources. The Endpoint Resource shall be further constrained as described in the [Endpoint Profile for mCSD](StructureDefinition-IHE.mCSD.Endpoint.html).

When the Endpoint is to an IHE document sharing environment, it shall further be constrained as described in the [Endpoint for Document Sharing Profile for mCSD](StructureDefinition-IHE.mCSD.Endpoint.DocShare.html).


##### 2:3.YY1.4.1.3 Expected Actions

A Care Services Feed Consumer SHALL process the submission to validate the resources submitted, and give a response as per [Section 2:3.YY1.4.2](#23YY142-create-care-services-resources-response-message) or an error as per [{{site.data.fhir.path}}http.html#create]({{site.data.fhir.path}}http.html#create).

#### 2:3.YY1.4.2 Create Care Services Resource Response Message

The Create Care Services Resource response message uses the response semantics as defined at [{{site.data.fhir.path}}http.html#create]({{site.data.fhir.path}}http.html#create) as applicable for the resources.

##### 2:3.YY1.4.2.1 Trigger Events

The Care Services Feed Consumer sends the Create Care Services Resource response message to the Care Services Feed Supplier when submitted resource has been processed.

##### 2:3.YY1.4.2.2 Message Semantics

A Care Services Feed Consumer SHALL respond with an `HTTP 201 Created` status code as indicated at [{{site.data.fhir.path}}http.html#create]({{site.data.fhir.path}}http.html#create) or an appropriate error status code.

See the CapabilityStatements for the Care Services Feed Consumer for additional details:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Consumer](CapabilityStatement-IHE.mCSD.CareServicesFeedConsumer.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Consumer Location Distance Option](CapabilityStatement-IHE.mCSD.CareServicesFeedConsumer.LocationDistance.html)

##### 2:3.YY1.4.2.3 Expected Actions

The Care Services Feed Supplier has received the response and continues with its workflow.

#### 2:3.YY1.4.3 Update Care Services Resource Request Message

A Update Care Services Resource Request Message is a FHIR update operation on any supported Care Services resource the Care Services Feed Consumer supports.

##### 2:3.YY1.4.3.1 Trigger Events

A Care Services Feed Supplier triggers a Update Care Services Resource Request to a Care Services Feed Consumer when it needs to update a Care Services resource.

##### 2:3.YY1.4.3.2 Message Semantics

A Care Services Feed Supplier SHALL initiate a update request using HTTP PUT as defined at [{{site.data.fhir.path}}http.html#update]({{site.data.fhir.path}}http.html#update) on the Care Services Resource. 

A Care Services Feed Supplier SHALL submit the Care Services resource in either XML format or JSON format 
thus the media type of the HTTP body SHALL be either `application/fhir+json` or `application/fhir+xml` respectively.
A Care Services Feed Consumer SHALL accept both XML and JSON formats.

It is possible to use HTTP protocol or HTTPS protocol. The HTTPS protocol is highly recommended.

They shall also support the requirements in [ITI TF-2: Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format), Populating the Expected Response Format.

All References (Reference.reference element) to Resources defined in this transaction shall be populated with an accessible URL (see [https://www.hl7.org/fhir/references-definitions.html#Reference.reference](https://www.hl7.org/fhir/references-definitions.html#Reference.reference)), unless the referenced resource is not available at a URL known to the server.

See the CapabilityStatements for the Care Services Feed Supplier for additional details:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Supplier](CapabilityStatement-IHE.mCSD.CareServicesFeedSupplier.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Supplier Location Distance Option](CapabilityStatement-IHE.mCSD.CareServicesFeedSupplier.LocationDistance.html)

###### 2:3.YY1.4.3.2.1 FHIR Organization Resource Constraints

A Care Services Feed Supplier may submit Organization Resources. The Organization Resource shall be further constrained as described in the [Organization Profile for mCSD](StructureDefinition-IHE.mCSD.Organization.html).

A Care Services Feed Supplier may submit Organization Resources when working with Facilities. The FHIR Organization Resource shall be further constrained as described in the [Organization for Facilities Profile for mCSD](StructureDefinition-IHE.mCSD.FacilityOrganization.html).

A Care Services Feed Supplier may submit Organization Resources when working with Jurisdictions. The FHIR Organization Resource shall be further constrained as described in the [Organization for Jurisdictions Profile for mCSD](StructureDefinition-IHE.mCSD.JurisdictionOrganization.html).

###### 2:3.YY1.4.3.2.2 FHIR Location Resource Constraints

A Care Services Feed Supplier may submit Location Resources. A Care Services Selective Supplier shall return a Bundle of matching Location Resources. The Location Resource shall be further constrained as described in the [Location Profile for mCSD](StructureDefinition-IHE.mCSD.Location.html).

When the resource is a Facility, the Location Resource shall be paired with an Organization Resource using the managingOrganization element in Location. A Care Services Feed Supplier may submit Location Resources when working with Facilities. The FHIR Location Resource shall be further constrained as described in the [Location for Facilities Profile for mCSD](StructureDefinition-IHE.mCSD.FacilityLocation.html).

When the resource is a Jurisdiction, the Location Resource shall be paired with an Organization Resource using the managingOrganization element in Location. A Care Services Feed Supplier may submit Location Resources when working with Jurisdictions. The FHIR Location Resource shall be further constrained as described in the [Location for Jurisdictions Profile for mCSD](StructureDefinition-IHE.mCSD.JurisdictionLocation.html).

When a geographic boundary is available for the Jurisdiction Location, the location-boundary-geojson extension defined at [http://hl7.org/fhir/extension-location-boundary-geojson.html](http://hl7.org/fhir/extension-location-boundary-geojson.html) shall be used to store this information.

When supporting the Location Distance Option, the Location Resource shall be further constrained as described in the [Location with Distance Option Profile for mCSD](StructureDefinition-IHE.mCSD.LocationDistance.html).

###### 2:3.YY1.4.3.2.3 FHIR Practitioner Resource Constraints

A Care Services Feed Supplier may submit Practitioner Resources. The Practitioner Resource shall be further constrained as described in the [Practitioner Profile for mCSD](StructureDefinition-IHE.mCSD.Practitioner.html).

###### 2:3.YY1.4.3.2.4 FHIR PractitionerRole Resource Constraints

A Care Services Feed Supplier may submit PractitionerRole Resources. The PractitionerRole Resource shall be further constrained as described in the 
[PractitionerRole Profile for mCSD](StructureDefinition-IHE.mCSD.PractitionerRole.html).

###### 2:3.YY1.4.3.2.5 FHIR HealthcareService Resource Constraints

A Care Services Feed Supplier may submit HealthcareService Resources. The HealthcareService Resource shall be further constrained as described in the [HealthcareService Profile for mCSD](StructureDefinition-IHE.mCSD.HealthcareService.html).

###### 2:3.YY1.4.3.2.6 FHIR OrganizationAffiliation Resource Constraints

A Care Services Feed Supplier may submit OrganizationAffiliation Resources. The OrganizationAffiliation Resource shall be further constrained as described in the [OrganizationAffiliation Profile for mCSD](StructureDefinition-IHE.mCSD.OrganizationAffiliation.html).

When the OrganizationAffiliation contains an Endpoint to an IHE document sharing environment, it shall further be constrained as described in the [OrganizationAffiliation for Document Sharing Profile for mCSD](StructureDefinition-IHE.mCSD.OrganizationAffiliation.DocShare.html).

###### 2:3.YY1.4.3.2.7 FHIR Endpoint Resource Constraints

A Care Services Feed Supplier may submit Endpoint Resources. The Endpoint Resource shall be further constrained as described in the [Endpoint Profile for mCSD](StructureDefinition-IHE.mCSD.Endpoint.html).

When the Endpoint is to an IHE document sharing environment, it shall further be constrained as described in the [Endpoint for Document Sharing Profile for mCSD](StructureDefinition-IHE.mCSD.Endpoint.DocShare.html).

##### 2:3.YY1.4.3.3 Expected Actions

A Care Services Feed Consumer SHALL process the submission to validate the resources submitted, and give a response as per [Section 2:3.YY1.4.3](#23YY144-update-care-services-resources-response-message) or an error as per [{{site.data.fhir.path}}http.html#update]({{site.data.fhir.path}}http.html#update).

#### 2:3.YY1.4.4 Update Care Services Resource Response Message

The Update Care Services Resource response message uses the response semantics as defined at [{{site.data.fhir.path}}http.html#update]({{site.data.fhir.path}}http.html#update) as applicable for the resources.

##### 2:3.YY1.4.4.1 Trigger Events

The Care Services Feed Consumer sends the Update Care Services Resource response message to the Care Services Feed Supplier when submitted resource has been processed.

##### 2:3.YY1.4.4.2 Message Semantics

A Care Services Feed Consumer SHALL respond with an `HTTP 200 OK` status code as indicated at [{{site.data.fhir.path}}http.html#update]({{site.data.fhir.path}}http.html#update) or an appropriate error status code as indicated at [{{site.data.fhir.path}}http.html#update]({{site.data.fhir.path}}http.html#rejecting-updates)

See the CapabilityStatements for the Care Services Feed Consumer for additional details:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Consumer](CapabilityStatement-IHE.mCSD.CareServicesFeedConsumer.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Consumer Location Distance Option](CapabilityStatement-IHE.mCSD.CareServic

##### 2:3.YY1.4.4.3 Expected Actions

The Care Services Feed Supplier has received the response and continues with its workflow.

#### 2:3.YY1.4.5 Delete Care Services Resource Request Message

A Delete Care Services Resource Request Message is a FHIR delete operation on any supported Care Services resource the Care Services Feed Consumer supports.

##### 2:3.YY1.4.5.1 Trigger Events

A Care Services Feed Supplier triggers a Delete Care Services Resource Request to a Care Services Feed Consumer when it needs to delete a Care Services resource.

##### 2:3.YY1.4.5.2 Message Semantics

A Care Services Feed Supplier SHALL initiate a delete request using HTTP DELETE as defined at [{{site.data.fhir.path}}http.html#delete]({{site.data.fhir.path}}http.html#delete) on the Care Services Resource. 

It is possible to use HTTP protocol or HTTPS protocol. The HTTPS protocol is highly recommended.

They shall also support the requirements in [ITI TF-2: Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format), Populating the Expected Response Format.

See the CapabilityStatements for the Care Services Feed Supplier for additional details:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Supplier](CapabilityStatement-IHE.mCSD.CareServicesFeedSupplier.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Supplier Location Distance Option](CapabilityStatement-IHE.mCSD.CareServicesFeedSupplier.LocationDistance.html)

##### 2:3.YY1.4.5.3 Expected Actions

A Care Services Feed Consumer SHALL process the submission and give a response as per [Section 2:3.YY1.4.5](#23YY146-delete-care-services-resources-response-message) or an error as per [{{site.data.fhir.path}}http.html#delete]({{site.data.fhir.path}}http.html#delete).

#### 2:3.YY1.4.6 Delete Care Services Resource Response Message

The Delete Care Services Resource response message uses the response semantics as defined at [{{site.data.fhir.path}}http.html#delete]({{site.data.fhir.path}}http.html#delete) as applicable for the resources.

##### 2:3.YY1.4.6.1 Trigger Events

The Care Services Feed Consumer sends the Delete Care Services Resource response message to the Care Services Feed Supplier when submitted resource has been processed.

##### 2:3.YY1.4.6.2 Message Semantics

A Care Services Feed Consumer SHALL respond with an `HTTP 200 OK` status code as indicated at [{{site.data.fhir.path}}http.html#delete]({{site.data.fhir.path}}http.html#delete) or an appropriate error status code as indicated at [{{site.data.fhir.path}}http.html#delete]({{site.data.fhir.path}}http.html#delete)

See the CapabilityStatements for the Care Services Feed Consumer for additional details:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Consumer](CapabilityStatement-IHE.mCSD.CareServicesFeedConsumer.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Consumer Location Distance Option](CapabilityStatement-IHE.mCSD.CareServicesFeedConsumer.LocationDistance.html)


##### 2:3.YY1.4.6.3 Expected Actions

The Care Services Feed Supplier has received the response and continues with its workflow.

#### 2:3.YY1.4.7 Process Care Services Resources Request Message

A Process Care Services Resources Request Message is a FHIR batch/transaction operation including Care Services resources the Care Services Feed Consumer supports.

##### 2:3.YY1.4.7.1 Trigger Events

A Care Services Feed Supplier triggers a Process Care Services Resources Request to a Care Services Feed Consumer when it needs to process multiple Care Services resource feed messages.

##### 2:3.YY1.4.7.2 Message Semantics

A Care Services Feed Supplier SHALL initiate a batch/transaction request using HTTP POST as defined at [{{site.data.fhir.path}}http.html#transaction]({{site.data.fhir.path}}http.html#transaction) on the server with a FHIR Bundle as the body of the request.

A Care Services Feed Supplier SHALL submit the Care Services resource in either XML format or JSON format 
thus the media type of the HTTP body SHALL be either `application/fhir+json` or `application/fhir+xml` respectively.
A Care Services Feed Consumer SHALL accept both XML and JSON formats.

It is possible to use HTTP protocol or HTTPS protocol. The HTTPS protocol is highly recommended.

They shall also support the requirements in [ITI TF-2: Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format), Populating the Expected Response Format.

See the CapabilityStatements for the Care Services Feed Supplier for additional details:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Supplier](CapabilityStatement-IHE.mCSD.CareServicesFeedSupplier.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Supplier Location Distance Option](CapabilityStatement-IHE.mCSD.CareServicesFeedSupplier.LocationDistance.html)

##### 2:3.YY1.4.7.3 Expected Actions

A Care Services Feed Consumer SHALL process the submission and give a response as per [Section 2:3.YY1.4.7](#23YY148-process-care-services-resources-response-message) or an error as per [{{site.data.fhir.path}}http.html#transaction]({{site.data.fhir.path}}http.html#transaction).

#### 2:3.YY1.4.8 Process Care Services Resources Response Message

The Process Care Services Resources response message uses the response semantics as defined at [{{site.data.fhir.path}}http.html#transaction]({{site.data.fhir.path}}http.html#transaction) as applicable for the resources.  Each entry in the bundle SHALL conform to the other feed messages:

* [Create Care Services Resource](#23YY141-create-care-services-resources-request-message)
* [Update Care Services Resource](#23YY143-update-care-services-resources-request-message)
* [Delete Care Services Resource](#23YY145-delete-care-services-resources-request-message)

##### 2:3.YY1.4.8.1 Trigger Events

The Care Services Feed Consumer sends the Process Care Services Resources response message to the Care Services Feed Supplier when submitted resources have been processed.

##### 2:3.YY1.4.8.2 Message Semantics

A Care Services Feed Consumer SHALL respond with an `HTTP 200 OK` status code as indicated at [{{site.data.fhir.path}}http.html#transaction]({{site.data.fhir.path}}http.html#transaction) or an appropriate error status code as indicated at [{{site.data.fhir.path}}http.html#transaction]({{site.data.fhir.path}}http.html#transaction).

The response will be a FHIR Bundle with the type set to either `batch-response` or `transaction-response` for the type `batch` or `transaction` of the request message respectively.  The entries in the Bundle will correspond to the entries in the request with the result of processing each entry.

See the CapabilityStatements for the Care Services Feed Consumer for additional details:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Consumer](CapabilityStatement-IHE.mCSD.CareServicesFeedConsumer.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Care Services Feed Consumer Location Distance Option](CapabilityStatement-IHE.mCSD.CareServicesFeedConsumer.LocationDistance.html)

##### 2:3.YY1.4.8.3 Expected Actions

The Care Services Feed Supplier has received the response and continues with its workflow.

### 2:3.YY1.5 Security Considerations

See [ITI TF-1: 46.5](volume-1.html#1465-mcsd-security-considerations) for security considerations for the mCSD Profile.

See [ITI TF-2: Appendix Z.8](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations) for common mobile security considerations.

#### 2:3.YY1.5.1 Security Audit Considerations

Note that the same audit message is recorded by both Care Services Feed Supplier and Care Services Feed Consumer. The
difference being the Audit Source element. Both sides record to show consistency
between the message sent by the Supplier and the action taken at the Consumer.

The actors involved shall record audit events according to the
[Audit Event for Request Care Services Updates by the Care Services Feed Supplier and Consumer](StructureDefinition-IHE.mCSD.Audit.CareServices.Feed.Create.html).

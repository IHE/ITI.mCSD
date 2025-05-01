
The Mobile Care Services Discovery (mCSD) Profile supports creating, updating, deleting and discovery of care services resources using a RESTful interface in interrelated, federated environments.

Use cases and solutions using mCSD are outlined in the [mCSD White Paper](https://profiles.ihe.net/ITI/papers/mCSD/index.html).

The profile supports querying for:

1.  **Organization** – Organizations are “umbrella” entities; these may be considered the administrative bodies under whose auspices care services are provided such as Healthcare Information Exchanges(HIEs), Integrated Delivery Networks (IDNs), Non-Government Organizations (NGOs), Faith-Based Organizations (FBOs) or even a one-physician family practice. An organization has a unique identifier and may have additional administrative attributes such as contact person, mailing address, etc. Departments of an institution, or other administrative units, may be represented as child Organizations of a parent Organization.

2.  **Facility** – Facilities are physical care delivery sites such as hospitals, clinics, health outposts, physician offices, labs, pharmacies, etc. A Facility has a unique identifier, geographic attributes (address, geocode), contact attributes, attributes regarding its hours of operation, etc. Each Facility is defined by a pairing of Location and Organization.

3.  **Location** – Locations are physical places where care can be delivered such as facilities, buildings, wards, rooms, or vehicles. Locations also include jurisdictions such as a village districts or regions. A Location has a unique identifier and may have geographic attributes (address, geocode), attributes regarding its hours of operation, etc. Each Location may be related to one Organization. A location may have a hierarchical relationship with other locations.

4.  **Jurisdiction** – Jurisdictions are political administrative units or other territories over which authority is exercised. A Jurisdiction has a unique identifier, geographic attributes, etc. Jurisdictions include political administrative units such as village districts or regions. Each Jurisdiction is defined by a pairing of Location and Organization.

5.  **Practitioner** – A Practitioner is a health worker such as defined by WHO (in Chapter 1 of the [World Health Report 2006](http://whqlibdoc.who.int/publications/2006/9241563176_eng.pdf)); a Practitioner might be a physician, nurse, pharmacist, community health worker, district health manager, etc. Practitioners have contact and demographic attributes. 

6. **PractitionerRole** – A PractitionerRole links a Practitioner with the role they perform.  Each PractitionerRole may be related to one or more Organizations, one or more Locations, and one or more Healthcare Services. Specific attributes may be associated with the PractitionerRole's relationship with these other entities.  

7. **Healthcare Service** – Each healthcare service has a unique identifier. Examples include surgical services, antenatal care services, or primary care services. The combination of a Healthcare Service offered at a Location may have specific attributes including contact person, hours of operation, etc.
    
8. **Endpoint** - An Organization may be reachable for electronic data exchange through electronic Endpoint(s). An Endpoint may be a FHIR server, an IHE web services actor, or some other mechanism. If an Organization does not have an Endpoint, it may still be reachable via an Endpoint at its parent Organization or an affiliated Organization.

9. **OrganizationAffiliation** - An Organization may have relationships with other organizations that are not hierarchical. These relationships may indicate an electronic routing path to other organizations that cannot be reached directly. OrganizationAffiliation can be used to specify relationships such as supply chains or administrative reporting structures.

The capabilities detailed in this profile support consumer-centric queries such as finding “where is the closest youth mental health services clinic” or “what are the hours of a physiotherapist near my workplace”. In addition, mCSD supports crucial health system management workflows. This can include reporting and analyses, such as “what are my health human resource capacities, by facility, by cadre,” “what are all the services offered at this facility,” or conversely, “where are all the facilities that offer this service.” The mCSD Profile may be employed to support, for example, the Provider Queries listed by the US Office of the National Coordinator as part of the [Standards and
Interoperability Framework](https://www.healthit.gov/topic/interoperability/standards-interoperability-si-framework). In addition, mCSD can enable connectivity by providing service endpoint lookup, such as "What is the FHIR server for this organization?".

The loosely coupled design and flexible querying capability of the mCSD Profile means it can be deployed within a variety of eHealth architectures and support a wide array of care workflows.

The profile provides optional support for RESTful transactions to create, update and delete care services resources.

## 1:46.1 mCSD Actors, Transactions, and Content Modules

This section defines the actors, transactions, and/or content modules in this profile. Further information about actor and transaction definitions can be found in the IHE Technical Frameworks General Introduction [Appendix A: Actors](https://profiles.ihe.net/GeneralIntro/ch-A.html) and [Appendix B: Transactions](https://profiles.ihe.net/GeneralIntro/ch-B.html).

Figure 1:46.1-1 shows the actors directly involved in the mCSD Profile and the relevant transactions between them. If needed for context, other actors that may be indirectly involved due to their participation in other related profiles are shown in dotted lines. Actors which have a mandatory grouping are shown in conjoined boxes.

{%include ActorsAndTransactions.svg%}
<div style="clear: left;"></div>
**Figure 1:46.1-1: mCSD Actor Diagram**

Table 1:46.1-1 lists the transactions for each actor directly involved in the mCSD Profile. To claim compliance with this profile, an actor shall support all required transactions (labeled “R”) and may support the optional transactions (labeled “O”).

**Table 1:46.1-1: mCSD Profile - Actors and Transactions**

| Actors                           | Transactions                             | Initiator or Responder | Optionality | Reference       |
| -------------------------------- | ---------------------------------------- | ---------------------- | ----------- | --------------- |
| Directory                        | Find Matching Care Services \[ITI-90\]   | Responder              | R           | [ITI TF-2: 3.90](ITI-90.html) |
|                                  | Request Care Services Updates \[ITI-91\] | Responder              | O           | [ITI TF-2: 3.91](ITI-91.html) |
|                                  | Care Services Feed \[ITI-130\]           | Responder              | O           | [ITI TF-2: 3.130](ITI-130.html) |
| Query Client                     | Find Matching Care Services \[ITI-90\]   | Initiator              | R           | [ITI TF-2: 3.90](ITI-90.html) |
| Update Client                    | Request Care Services Updates \[ITI-91\] | Initiator              | R           | [ITI TF-2: 3.91](ITI-91.html) |
| Data Source                      | Care Services Feed \[ITI-130\]           | Initiator              | R           | [ITI TF-2: 3.130](ITI-130.html) |
{: .grid .table-striped}

### 1:46.1.1 Actor Descriptions and Actor Profile Requirements

Most requirements are documented in ITI TF-2: Transactions. This section documents any additional requirements on mCSD actors.

mCSD supports querying for Organization, Facility, Location, Practitioner, PractitionerRole, Healthcare Service, OrganizationAffiliation, and Endpoint. However, Directories, Query Clients, Update Clients, or Data Sources are not required to contain data on all of these.

#### 1:46:1.1.1 Directory

The Directory processes received queries from Query Client and returns information about mCSD resources.

When the Directory supports the Update Option, it can provide updates about mCSD resources in response to a refresh request from an Update Client. The updates include new or modified information since a previous refresh.

When the Directory supports the Feed Option, it receives updates to information about mCSD resources from a Data Source.

The Directory SHALL publish an `instance` CapabilityStatement at the metadata endpoint following [ITI Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) using the [FHIR capabilities interaction]({{site.data.fhir.path}}http.html#capabilities). 
All supported interactions shall be specified. All supported search parameters and search methods (GET, POST) SHALL be specified. The [search parameters](ITI-90.html#2390412-message-semantics) and [message semantics](ITI-90.html#2390422-message-semantics) defined in \[ITI-90\] SHALL be supported.  When the Update Option is supported, the [search parameters](ITI-91.html#2391412-message-semantics) and [message semantics](ITI-91.html#2391422-message-semantics) defined in \[ITI-91\] shall be supported.  When the Feed Option is supported, the message semantics defined in \[ITI-130\] SHALL be supported for each message:  [create response](ITI-130.html#23130422-message-semantics), [update response](ITI-130.html#23130442-message-semantics), [delete response](ITI-130.html#23130462-message-semantics), and [process response](ITI-130.html#23130482-message-semantics).  Other parameters may be supported.

This capabilities response will typically include all of the capabilities inclusive of all grouped actors and additional functionality.  The following are some examples: 

- [IHE ITI Mobile Care Services Discovery (mCSD) - Directory](CapabilityStatement-IHE.mCSD.Directory.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Directory Location Distance Option](CapabilityStatement-IHE.mCSD.Directory.LocationDistance.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Directory Update Option](CapabilityStatement-IHE.mCSD.Directory.Update.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Directory Feed Option](CapabilityStatement-IHE.mCSD.Directory.Feed.html)

#### 1:46.1.1.2 Query Client

The Query Client queries the Directory for information about mCSD resources.

The following are two example capability statement resources that a Query Client could support:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Query Client](CapabilityStatement-IHE.mCSD.QueryClient.html)
- [IHE ITI Mobile Care Services Discovery (mCSD) - Query Client Location Distance Option](CapabilityStatement-IHE.mCSD.QueryClient.LocationDistance.html)

#### 1:46.1.1.3 Update Client

The Update Client can query for updates since a previous refresh, to information about mCSD resources from one 
or more Directories that support the Update Option.

The following are two example capability statement resources that a Update Client could support:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Update Client](CapabilityStatement-IHE.mCSD.UpdateClient.html)

#### 1:46.1.1.4 Data Source

The Data Source can provide updates about mCSD resources to a Directory. The updates include create, update, or delete requests to individual resources or a transaction request for a bundle of resources.

The following are two example capability statement resources that a Data Source could support:

- [IHE ITI Mobile Care Services Discovery (mCSD) - Data Source](CapabilityStatement-IHE.mCSD.DataSource.html)

## 1:46.2 mCSD Actor Options

Options that may be selected for each actor in this profile, if any, are listed in Table 1:46.2-1. Dependencies between options when applicable are specified in notes.

**Table 1:46.2-1: mCSD - Actors and Options**

| Actor                            | Option Name              | Reference      |
| -------------------------------- | ------------------------ | -------------- |
| Directory                        | Location Distance Option | [Section 1:46.2.1](#14621-location-distance-option) |
| Directory                        | Update Option            | [Section 1:46.2.2](#14622-update-option) |
| Directory                        | Feed Option              | [Section 1:46.2.3](#14623-feed-option) |
| Query Client                     | Location Distance Option | [Section 1:46.2.1](#14621-location-distance-option) |
| Update Client                    | No options defined       | -- |
| Data Source                      | No options defined       | -- |
{: .grid .table-striped}

### 1:46.2.1 Location Distance Option

The Location Distance Option enables querying Location resources based on relative distances.

A Query Client or Directory that supports the Location Distance Option SHALL implement the semantics for the Location Distance Option of the Find Matching Care Services \[ITI-90\] transaction. See [ITI TF-2: 2:3.90.4.1.2.2](ITI-90.html#23904122-organization-resource-message-semantics) and [ITI TF-2: 2:3.90.4.2.2.2](ITI-90.html#23904222-fhir-location-resource-constraints).

### 1:46.2.2 Update Option

The Update Option enables sending bulk updates to the Update Client from the Directory.

A Directory that supports the Update Option SHALL implement the [Request Care Services Updates [ITI-91]](ITI-91.html) transaction.

### 1:46.2.3 Feed Option

The Feed Option enables the Directory to receive feed updates from the Feed Client.

A Directory that supports the Feed Option SHALL implement the [Care Services Feed [ITI-130]](ITI-130.html) transaction.

## 1:46.3 mCSD Required Actor Groupings

An actor from this profile (Column 1) shall implement all of the required transactions and/or content modules in this profile ***in addition to*** ***<span class="underline">all</span>*** of the requirements for the grouped actor (Column 2).

[Section 1:46.5](#1465-mcsd-security-considerations) describes some optional groupings that may be of interest for security considerations and [Section 1:46.6](#1466-mcsd-cross-profile-considerations) describes some optional groupings in other related profiles.

**Table 1:46.3-1: mCSD - Required Actor Groupings**

| mCSD Actor                       | Actor to be grouped with | Reference | Content Bindings Reference |
| -------------------------------- | ------------------------ | --------- | -------------------------- |
| Directory                        | None                     | \--       | \--                        |
| Query Client                     | None                     | \--       | \--                        |
| Update Client                    | None                     | \--       | \--                        |
| Data Source                      | None                     | \--       | \--                        |
{: .grid .table-striped}

## 1:46.4 mCSD Overview

### 1:46.4.1 Concepts

The Mobile Care Services Discovery (mCSD) Profile supports queries for resources related to care services discovery. The relationship between these entities is illustrated in Figure 1:46.4.1-1.

![Top-level Relationships between Care Services Entities](mCSDRelationships.png)
<div style="clear: left;"></div>

**Figure 1:46.4.1-1: Top-level Relationships Between Care Services Entities**

### 1:46.4.2 Use Cases

#### 1:46.4.2.1 Use Case \#1: Practitioner Query

##### 1:46.4.2.1.1 Practitioner Query Use Case Description

The patient, Vera Brooks, consults with her physician who recommends surgery. The physician can assist the patient in finding a suitable surgeon, taking into consideration the location and specialty of the surgeon.

##### 1:46.4.2.1.2 Practitioner Query Process Flow

- Vera Brooks sees her family physician, Dr. West, regarding a recent knee injury.

- Dr. West diagnoses the problem as a torn ACL and decides to refer Vera to an orthopedic surgeon.

- Dr. West uses her EMR query tool, which implements a Query Client to search for orthopedic surgeons within 30km of Vera’s home.

- The EMR retrieves the information from a Healthcare Worker Registry (HWR) and displays it to Dr. West.

- Vera and Dr. West decide on an orthopedic surgeon; Dr. West prepares a referral.

The interactions between the various actors in this use case are shown in Figure 1:46.4.2.1.2-1.

<div>
{%include usecase1-processflow.svg%}
</div>
<div style="clear: left;"/>

**Figure 1:46.4.2.1.2-1: Provider Query Use Case**

#### 1:46.4.2.2 Use Case \#2: Provider Lookup During an Emergency Event

##### 1:46.4.2.2.1 Provider Lookup During an Emergency Event Use Case Description

During an emergency event, medical volunteers may report to assist. At an emergency site, the mCSD service can be queried to quickly identify and grant permission to credentialed providers to enter the scene.

During Hurricane Katrina, health care volunteers were turned away from disaster sites because there was no means available to verify their credentials. During the Ebola outbreak in West Africa, it was unclear which health workers were available and had been trained in clinical care techniques.

Resources from jurisdictional areas can be reported up to a central location so there is a single point of access. This would make it easier for responders on location to verify the credentials of a reporting health worker.

##### 1:46.4.2.2.2 Provider Lookup During an Emergency Event Process Flow

  - A jurisdictional (state/district) Directory will provide data to a central Update Client (National HIE).

  - The National HIE will be a Update Client grouped with a Directory.

  - An emergency responder (e.g., police on site controlling access) can use a Query Client to validate the credentials of a reporting health worker from the central Directory.

  - Based on the result, the emergency responder can allow or deny access to the reporting health worker.

The interactions between the various actors in this use case are shown in Figure 1:46.4.2.2.2-1.

<div>
{%include usecase2-processflow.svg%}
</div>
<div style="clear: left;"/>

**Figure 1:46.4.2.2.2-1: Federated Data Site Management Workflow**

#### 1:46.4.2.3 Use Case \#3: Cross-jurisdictional Site Management 

##### 1:46.4.2.3.1 Cross-jurisdictional Site Management Description

Projects like the U.S. President's Emergency Plan for AIDS Relief (PEPFAR)’s Data for Accountability, Transparency, and Impact (DATIM) need to have public health and service delivery indicators reported from a large number of sites (health facilities, communities, warehouses) within an Operating Unit (country/region). Within an Operating Unit, there are multiple, possibly overlapping, jurisdictions in operation which are managed by multiple organizations (e.g., ministries of health (MoH), faith-based organizations, international non-governmental organizations). The project needs to receive indicator submissions from pre-existing data systems hosted by these organizations. This data exchange requires a way to share site lists and implement identifier mapping between the sites in these lists. 


<div>
{%include usecase3-diagram.svg%}
</div>
<div style="clear: left;"/>

**Figure 1:46.4.2.3.1-1: Cross-Jurisdictional Data Exchange**

##### 1:46.4.2.3.2 Cross-jurisdictional Site Management Process Flow

An Operating Unit (OU) will run a Update Client and Directory for a specific geographic area (e.g., country). This Update Client will query other organizations (ministries of health, partners) operating in the geographic area to get updated site data for the sites managed by the OU.

  - An OU Update Client will query a sub-unit Directory (e.g., MoH) to get an updated list of sites under the sub-unit.

  - An OU Update Client will query a subunit Directory (e.g., partner) to get an updated list of sites under the subunit.

  - The OU Update Client will use entity matching to determine if there are duplicated sites in the combined data and flag them for review. (See
    [https://wiki.ohie.org/display/documents/OpenHIE+Entity+Matching+Service](https://wiki.ohie.org/display/documents/OpenHIE+Entity+Matching+Service).)

The interactions between the various actors in this use case are shown
in Figure 1:46.4.2.3.2-1.

<div>
{%include usecase3-processflow.svg%}
</div>
<div style="clear: left;"/>

**Figure 1:46.4.2.3.2-1: Cross-jurisdictional Site Management Workflow**

#### 1:46.4.2.4 Use Case \#4: Master Facility List 

##### 1:46.4.2.4.1 Master Facility List Description

A developing country has decided to implement a Master Facility List (MFL) based on recommendations from the WHO in the [MFL Resource Package](https://www.who.int/publications/i/item/9789241516495). This resource includes a minimum data set to uniquely identify, locate, and contact a specific facility. Since this will be a single source of information for the country, there may be differing hierarchies that need to be supported for the facilities. For example, one hierarchy would be the administrative hierarchy for the country (region, district, county). Another would be the supply chain hierarchy where hubs may be located separately from administrative regions. Yet another could be a reporting hierarchy used to send data to international organizations.

##### 1:46.4.2.4.2 Master Facility List Process Flow

A Master Facility List (MFL) will run a Directory for an entire country. A Human Resources Information System (HRIS) will run a Update Client to retrieve the list of facilities. A Logistics Management Information System (LMIS) will run a Update Client to retrieve the list of facilities.

- An HRIS will query the MFL for an updated list of facilities where Practitioners can provide care.

- An LMIS will query the MFL for an updated list of facilities for the supply chain to deliver health care supplies.

- The MFL will return updated facilities to each of these systems with multiple hierarchies.

The interactions between the various actors in this use case are shown in Figure 1:46.4.2.4.1-1.

<div>
{%include usecase4-processflow.svg%}
</div>
<div style="clear: left;"/>

**Figure 1:46.4.2.4.2-1: Master Facility List Workflow**

#### 1:46.4.2.5 Use Case \#5: Health Information Exchange (HIE) Membership Discovery

##### 1:46.4.2.5.1 Health Information Exchange (HIE) Membership Discovery Description

In this use case, a healthcare worker needs to identify the organizations active in the State/Province Health Information Exchange (HIE) that have been added since 2017, to make contact with new organizations and negotiate future clinical exchange.

Membership in an HIE is a more dynamic and transitory business relationship than the "parent-child" hierarchy represented by Organization.partOf. For these more flexible business relationships, the [OrganizationAffiliation]({{site.data.fhir.path}}organizationaffiliation.html) resource allows for organizations to relate to each other in non-hierarchical and more dynamic business relationships. Unlike partOf, the relationship is itself a resource, so it can be categorized with codes, status, etc. 

In the example below:
- Organization B has a parent Organization A.
- Organization B has been a part of its State/Province HIE since 2018 and is a member in good standing.

The `organization` defines a role for the relationship, e.g., "HIE/HIO" or "member", and the `participatingOrganization` fills the role.

<div>
{%include usecase5-diagram.svg%}
</div>
<div style="clear: left;"/>

**Figure 1:46.4.2.5.1-1: Organization.partOf vs. Affiliation**

##### 1:46.4.2.5.2 Health Information Exchange (HIE) Membership Discovery Process Flow

- A healthcare worker searches for organizations active in the State/Province HIE that have been added since 2017.
- The EMR searches for OrganizationAffiliations where the `organization` is the HIE, `active` is true, and `period.start` is 2017 or later.
- The EMR searches for details on the participating Organizations.
- The EMR presents the results to the healthcare worker.

The interactions between the various actors in this use case are shown in Figure 1:46.4.2.5.2-1.

<div>
{%include usecase5-processflow.svg%}
</div>
<div style="clear: left;"/>

**Figure 1:46.4.2.5.2-1: Health Information Exchange (HIE) Membership Discovery Workflow**

#### 1:46.4.2.6 Use Case \#6: Health Information Exchange (HIE) Endpoint Discovery 

##### 1:46.4.2.6.1 Health Information Exchange (HIE) Endpoint Discovery Description

Users in Health IT systems often need to be able to obtain clinical information electronically from outside systems, for example, in preparation for an encounter. This use case describes how a user in a system identifies the organizations a patient has received care from, as well as criteria for the kinds of clinical documents of interest, and then how their EMR queries the directory for a Health Information Exchange (HIE) to search for each organization and a compatible services endpoint the EMR can use.

An HIE publishes a directory that contains all of its member organizations and their electronic endpoints.

- Endpoints are not limited to RESTful FHIR servers; they may point to systems that implement other mechanisms. This IG provides two profiles:
  [a general endpoint](StructureDefinition-IHE.mCSD.Endpoint.html), and
  [an endpoint to an IHE Document Sharing actor](StructureDefinition-IHE.mCSD.Endpoint.DocShare.html).
- Organizations might support one or many communication channels, each of which might have one or more distinct endpoints. For example, a FHIR communication channel might require only a single endpoint (i.e., a single [Service Base URL](https://www.hl7.org/fhir/http.html#general)), while an IHE XCA communication channel might require separate endpoints for each transaction.

The diagram below shows an excerpt of the HIE directory, showing one participant in the HIE that implements IHE XCA with two Endpoints, and another that only uses one.

<div>
{%include usecase6-diagram.svg%}
</div>
<div style="clear: left;"/>

**Figure 1:46.4.2.6.1-1: Health Information Exchange**

##### 1:46.4.2.6.2 Health Information Exchange (HIE) Endpoint Discovery Process Flow

- In preparation for a patient visit, a healthcare worker knows and identifies the organizations that have provided care for this patient, and identifies document types of interest.
- The EMR will query the HIE directory for the relevant organizations and their endpoints.
- For each organization obtained, the EMR will check for endpoints that support the needed XCA transactions, and make requests against these endpoints to obtain clinical documents.
- The EMR presents the obtained documents to the healthcare worker, who reviews them.

The interactions between the various actors in this use case are shown in Figure 1:46.4.2.6.2-1.

<div>
{%include usecase6-processflow.svg%}
</div>
<div style="clear: left;"/>

**Figure 1:46.4.2.6.2-1: Health Information Exchange (HIE) Endpoint Discovery Workflow**

#### 1:46.4.2.7 Use Case \#7: Centralized Facilities Registry Allowing Updates for Health Workers and Services

##### 1:46.4.2.7.1 Managing Facilities Capabilities Description

A country or region may have a central facility registry and allow the facilities to directly manage its services and the relationship to its health workers:

- A facility adds, updates or deletes health care service it delivers in the centralized facility registry.
- A facility adds, updates or removes health care worker from its organization.
- A facility can manage it's own organization hierarchy.

##### 1:46.4.2.7.2 Managing Facilities Capabilities Process Flow

- A facility has an update to a health care service and needs to update the directory using [ITI-130 Care Services Feed](ITI-130.html).
- A facility has removed a health care worker and needs to update the directory using [ITI-130 Care Services Feed](ITI-130.html).

<div>
{%include usecase7-processflow.svg%}
</div>
<div style="clear: left;"/>

## 1:46.5 mCSD Security Considerations

Actors are expected to follow the recommendations and requirements found in [ITI TF-2: Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations). 

The resources exchanged in this profile may contain information which pose a privacy risk, or in some cases, a safety risk, to providers and other personnel, as well as patients. For example, practitioner phone numbers and home addresses may be conveyed. Implementers should determine what data will be exposed by the system and what level of public access there will be if any.

Access controls should be considered when allowing updates to the data in a directory to ensure only allowed users and/or systems are able to update data.  This may include resource or element level controls as well as Provenance for documenting the data source.  These access controls could be addressed by the client or the server as dictated by the implementation.  It is recommended to use [IUA](https://profiles.ihe.net/ITI/IUA/index.html) for authorization.

The Endpoint Resources exchanged in this profile will expose information about the particular APIs and web services running on the underlying host systems. This might attract malicious activity or provide hints to potential attackers on how to attack a particular host system. Implementers should consider this when determining the access policies for these Resources. System administrators for the underlying host systems must follow industry best practices for authentication, authorization, auditing, timely application of software patches, etc. 

There are many reasonable methods of security for interoperability transactions which can be implemented without modifying the characteristics of the transactions in the mCSD Profile. The use of TLS is encouraged.

User authentication on mobile devices and browsers is typically handled by more lightweight authentication schemes such as HTTP Authentication, OAuth 2.0, or OpenID Connect. IHE has a set of profiles for user authentication including Internet User Authentication (IUA) for REST-based authentication. The network communication security and user authentication are layered in the HTTP transport layer.

## 1:46.6 mCSD Cross Profile Considerations

### 1:46.6.1 Aggregate Data Exchange – ADX

The IHE QRPH Aggregate Data Exchange (ADX) Profile enables reporting of public health and service delivery indicators in various locations. A reporting system may play the role of a Update Client to ensure that it has an updated list of the resources for the reporting locations.

Additionally, a service that contains information on practitioners (and may be a Directory) can also be used to generate an ADX message to satisfy the use case of a district health manager running an aggregate report on staffing levels by facility and health worker type from the ITI Care Services Discovery (CSD) Profile.

### 1:46.6.2 Care Services Discovery – CSD

A Care Services Directory in the CSD Profile can be grouped with the Directory from mCSD. The CSD Care Services InfoManager could implement the mCSD Update Client and the Directory Actors. The CSD Service Finder could implement the mCSD Query Client. This enables the CSD actors to allow RESTful transactions without having to change the underlying data store.

### 1:46.6.3 Health Provider Directory – HPD

A Provider Information Source in HPD can also implement the Directory from mCSD. Note that in this case the Provider Information Source would be queried for updates instead of pushing the updates to the HPD Provider Information Consumer. The HPD Provider Information Directory could implement the mCSD Update Client and the Directory Actors. The HPD Provider Information Consumer could implement the mCSD Query Client. This enables the HPD actors to allow RESTful transactions without having to change the underlying data store.

### 1:46.6.4 Mobile Alert Communication Management – mACM

The mACM Profile defines the means to send an alert to practitioners. The mCSD Profile provides a way to query that list of practitioners. A mACM Alert Reporter can be grouped with a Update Client or a Query Client to ensure that it has an updated list of practitioners.

## 1:46.7 mCSD Deployment Considerations

### 1:46.7.1 Basic Deployment

A basic deployment may only have a single directory that will maintain data internally. In this case, you would only need the Directory to send search results back to one or more Query Clients (or Update Clients). The Update Client could be a system that caches bulk updates for local reference and doesn't do individual queries.  See Figure 1:46.7.1-1 below.

<div>
{%include basic-deployment.svg%}
</div>
<div style="clear: left;"/>
**Figure 1:46.7.1-1: Basic Deployment**


### 1:46.7.2 Simple Deployment

A more common deployment may have a single directory with one or more data sources that feed data into the directory. This would also have one or more query or update clients to query the data in the directory. The Update Client could be a system that caches bulk updates for local reference and doesn't do individual queries.  See Figure 1:46.7.2-1 below.

<div>
{%include simple-deployment.svg%}
</div>
<div style="clear: left;"/>

**Figure 1:46.7.2-1: Simple Deployment**

### 1:46.7.3 Federated and Cross-Jurisdictional Deployments

A Federated Deployment has multiple levels of the Directories linked to Update Clients. These Update Clients may also support being Directories so that higher level Update Clients can receive their updates.  See Figure 1:46.7.3-1 below.

Interrelated content is maintained by the Update Client. The Update Client routinely obtains new or updated content from Directories by polling them. These updates may refresh a data cache which the Update Client maintains. The Update Client's cache is refreshed at an appropriate interval specified by the implementing jurisdiction. The implementing jurisdiction will consider the implications of out of date information when setting the refresh interval between cache updates. The normal delays in updating listings will also be part of this consideration.

The various data sources would maintain definitive data regarding one or more Care Services Resources and implement the Directory. These Directories would respond to a Update Client’s request for new or updated content since a specified date and time. To support this capability, a Directory should support time stamped updates. Data elements that are deprecated should not simply be deleted, but rather are updated to an appropriate status indicating their deprecation.

This deployment may also have cross-jurisdictional considerations if any of the Directories have overlap in the data they manage. In this instance, the Update Client would need to resolve any conflicts before sharing this information as a Directory. The way in which these conflicts are resolved is defined by the implementing jurisdiction of the Update Client.

{%include FederatedDeployment.svg%}
<div style="clear: left;"></div>
**Figure 1:46.7.3-1: Federated and Cross Jurisdictional Deployment**

The Query Client is the actor that queries for information about interrelated care services. These queries are sent to the Directory who develops a response based on the content in its local data store. When a Directory is combined with a Update Client (Global and Country servers from Figure 1:46.7.3-1), it should maintain a cache of the aggregated information from all the configured Directories it is linked to.

In order for the Update Client's (Global and Country servers) cached content to be able to serve its role as an interlinked data source, the following conditions should be met by Directories who maintain content.

1. Implementing jurisdictions may mandate terminologies for Organization Type, Service Type, Location Type, Location Status, Practitioner Type, Practitioner Status, Contact Point Type, Credential Type, Specialization Code, and language code. Directories would be configurable to use these terminologies, where mandated. In the case of a cross jurisdictional deployment, mapping between the terminology used by the various jurisdictions may need to be maintained.

2. Implementing jurisdictions may mandate conventions regarding the types, components and formatting of Name, Address and Address Line elements. Directories would be configurable to use these formatting conventions, where mandated.

3. Implementing jurisdictions may mandate the source of truth regarding Organization ID, Healthcare Service ID, Location ID and Practitioner ID. Directories would ensure that all cross-referenced IDs match corresponding resources in the jurisdictionally mandated sources of truth.

For guidance on handling challenges regarding the representation of names across multiple languages and in different cultures, refer to the [ITI TF-2: 3.24.5.2.3.1](https://profiles.ihe.net/ITI/TF/Volume2/ITI-24.html#3.24.5.2.3.1). This section in the ITI Technical Framework describes the use of the language tag as documented in IETF RFC1766 and the HL7 XCN name data type.

#### 1:46.7.3.1 Terminology Services

All referenced terminologies from a Directory may be pre-coordinated or they may be resolvable from one or more terminology services. Though it is out of scope of the mCSD Profile to define the means of interacting with a terminology service, this could be provided, for example, through the
[Sharing Valuesets, Codes, and Maps (SVCM) Profile](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_SVCM.pdf).

## 1:46.8 mCSD as a Health Information Network Directory

mCSD can be used to represent the health information technology infrastructure that makes up a document sharing network by linking Endpoints—access points for data exchange—to Organizations and their Affiliations.
This structure enables clear modeling of network topology by associating Endpoint Resources with Organizations in the mCSD Directory. 
Endpoint Resources represent access points of connectivity to the entity to which they are linked. 
The hierarchy of the IT systems to which the Endpoints point can be represented as one of the (potentially) many hierarchies represented by Organization Affiliation links in the mCSD Directory. 
Codes from the [mCSD Organization Affiliation Types for Document Sharing Networks ValueSet](ValueSet-MCSDOrgDocSharingAffTypesVS.html) are used to indicate that an Organization Affiliation is part of a document sharing network hierarchy. 

Child Organization Resources might be present in an mCSD Directory for business reasons other than representing document sharing infrastructure.
Such child Organizations would not have their own Endpoints but could be accessible through their parent Organization's Endpoints. 
An mCSD Directory must specify a policy that describes which types of affiliations are to be represented in the directory and any implications of how the network topology is represented in the Directory. 

Readers who are interested in representing a document sharing network in a Directory are strongly encouraged to read the IHE [Document Sharing Across Network Topologies white paper](https://profiles.ihe.net/ITI/papers/Topologies/index.html) for additional guidance in representing the network structure.

Specific details of addressing to federated recipients in standards based transactions are specific to the message semantics and expected actions of the transaction actors and therefore are out of the scope of this IG.

##### 1:46.8.1 Endpoint to an Organization

mCSD allows for Endpoint Resources to be linked both to Organization Resources and OrganizationAffiliation Resources.
An Endpoint on an Organization Resource indicates that the Endpoint is broadly applicable to that Organization.
This is often the simplest model for the client. Because this Endpoint is Organization-specific, it does not matter to the client to whom the Organization is affiliated with.
The Organization might have affiliations, but those affiliations are not directly relevant for contacting the Organization. 

Note: The managingOrganization of an Endpoint is the contact point for support. This may differ from the organization that hosts the Endpoint. It may or may not be the same as the organization that hosts it. Since hosting might not be reflected in the directory, we are indicating it in the diagrams below by the URLs.

Organization A's endpoint is broadly applicable:

<div>

{%include dir-org-specific-endpoint-self.svg%}

</div>

<div style="clear: left;"/>

**Figure 1:46.8.1-1: Organization-specific Endpoint Hosted by the Organization**

Organization A is directly reachable by a broadly applicable endpoint hosted by its parent Organization B:

<div>

{%include dir-org-specific-endpoint-parent.svg%}

</div>

<div style="clear: left;"/>

**Figure 1:46.8.1-2: Organization-specific Endpoint Hosted by Parent**

Organization C is directly reachable by a broadly applicable endpoint hosted by its affiliated Organization D:

<div>

{%include dir-org-specific-endpoint-affil.svg%}

</div>

<div style="clear: left;"/>

**Figure 1:46.8.1-3: Organization-specific Endpoint Hosted by Affiliation**

Organization E is directly reachable by an endpoint hosted by a hidden (i.e., not in the directory) Intermediary F:

<div>

{%include dir-org-specific-endpoint-inter.svg%}

</div>

<div style="clear: left;"/>

**Figure 1:46.8.1-4: Organization-specific Endpoint Hosted by Hidden Intermediary**

In contrast, Endpoints that are placed on an OrganizationAffiliation Resource indicate that the Endpoint applies to the .participatingOrganization of the affiliation, but only in the context of the affiliation. 
This allows Organizations which are affiliated with multiple networks to have different Endpoints for each network, which might be necessary due to different needs (such as security) of each network.

The following diagram shows the same accessibility, but using OrganizationAffiliation.

<div>

{%include dir-endpoint-to-org-affiliates.svg%}

</div>

<div style="clear: left;"/>

**Figure 1:46.8.2-2: Endpoint to Organizational Affiliates**

##### 1:46.8.3 Endpoint Content

The Endpoint.connectionType and specificType extension indicate the type of connectivity enabled by the Endpoint.
As such, Organization and OrganizationAffiliation Resources MAY have many Endpoints for the various types of connectivity they support. 

The following example shows an Organization that has two Endpoints, one for IHE MHD and one for IHE XDR:

<div>

{%include dir-endpoint-xdr-mhd.svg%}

</div>

<div style="clear: left;"/>

**Figure 1:46.8.3-1: An Organization With Multiple Endpoints**

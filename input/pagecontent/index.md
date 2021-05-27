<table>
<tbody>
<tr class="odd">
<td><p>Whenever possible, IHE profiles are based on established and stable underlying standards. However, if an IHE domain determines that an emerging standard has high likelihood of industry adoption, and the standard offers significant benefits for the use cases it is attempting to address, the domain may develop IHE profiles based on such a standard. During Trial Implementation, the IHE domain will update and republish the IHE profile as the underlying standard evolves.</p>
<p>Product implementations and site deployments may need to be updated in order for them to remain interoperable and conformant with an updated IHE profile.</p>
<p>This mCSD Profile incorporates content from Release 4 of the emerging HL7<sup>®</sup>[1] FHIR<sup>®</sup>[2] specification. HL7 describes FHIR Change Management and Versioning at <a href="https://www.hl7.org/fhir/versions.html">https://www.hl7.org/fhir/versions.html</a>.</p>
<p>HL7 provides a rating of the maturity of FHIR content based on the FHIR Maturity Model (FMM): level 0 (draft) through N (Normative). See <a href="http://hl7.org/fhir/versions.html#maturity">http://hl7.org/fhir/versions.html#maturity</a>.</p>
<p>The FMM levels for FHIR content used in this profile are:</p>
<table>
<thead>
<tr class="header">
<th>FHIR Content</th>
<th>FMM Level</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Organization Resource</td>
<td>3</td>
</tr>
<tr class="even">
<td>Location Resource</td>
<td>3</td>
</tr>
<tr class="odd">
<td>Practitioner Resource</td>
<td>3</td>
</tr>
<tr class="even">
<td>PractitionerRole Resource</td>
<td>2</td>
</tr>
<tr class="odd">
<td>HealthcareService Resource</td>
<td>2</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

The Mobile Care Services Discovery (mCSD) Profile supports RESTful
queries across the following related care service resources:

1.  **Organization** – Organizations are “umbrella” entities; these may
    be considered the administrative bodies under whose auspices care
    services are provided such as Healthcare Information Exchanges
    (HIEs), Integrated Delivery Networks (IDNs), Non-Government
    Organizations (NGOs), Faith-Based Organizations (FBOs) or even a
    one-physician family practice. An organization has a unique
    identifier and may have additional administrative attributes such as
    contact person, mailing address, etc. Departments of an institution,
    or other administrative units, may be represented as child
    Organizations of a parent Organization.

2.  **Facility** – Facilities are physical care delivery sites such as
    hospitals, clinics, health outposts, physician offices, labs,
    pharmacies, etc. A Facility has a unique identifier, geographic
    attributes (address, geocode), contact attributes, attributes
    regarding its hours of operation, etc. Each Facility is defined by a
    pairing of Location and Organization.

3.  **Location** – Locations are physical places where care can be
    delivered such as facilities, buildings, wards, rooms, or vehicles.
    Locations also include political administrative units such as a
    village districts or regions. A Location has a unique identifier and
    may have geographic attributes (address, geocode), attributes
    regarding its hours of operation, etc. Each Location may be related
    to one Organization. A location may have a hierarchical relationship
    with other locations.

4.  **Practitioner** – A Practitioner is a health worker such as defined
    by WHO (<http://www.who.int/whr/2006/06_chap1_en.pdf>); a
    Practitioner might be a physician, nurse, pharmacist, community
    health worker, district health manager, etc. Practitioners have
    contact and demographic attributes. Each Practitioner may be related
    to one or more Organizations, one or more Locations and one or more
    Healthcare Services. Specific attributes may be associated with the
    Practitioner relationship with these other entities.

5.  **Healthcare Service** – Each healthcare service has a unique
    identifier. Examples include surgical services, antenatal care
    services, or primary care services. The combination of a Healthcare
    Service offered at a Location may have specific attributes including
    contact person, hours of operation, etc.

The mCSD Profile describes four actors and the transactions between
them. The Find Matching Care Services transaction allows a consumer to
search a supplier based on allowed parameters to get a bundle of
matching resources. The Request Care Services Updates transaction allows
a consumer to get a complete list of updated resources based on a
timestamp from the supplier.

1.  **Care Services Selective Consumer** – the Care Services Selective
    Consumer submits search queries to the Care Services Selective
    Supplier, which returns the requested resource(s).

2.  **Care Services Selective Supplier** – the Care Services Selective
    Supplier processes inbound queries from Care Services Selective
    Consumers and returns responses from local data.

3.  **Care Services Update Consumer** – the Care Services Update
    Consumer queries updates from one or more Care Services Update
    Suppliers.

4.  **Care Services Update Supplier** – the Care Services Update
    Supplier is responsible for returning a bundle of resources in
    response to a refresh request from a Care Services Update Consumer.
    The response bundle contains content which has been inserted or
    updated in the listing since the last refresh.

Because it maintains interlinked directory information, the mCSD Profile
is able to respond to queries such as:

- Which locations are associated with which organizations?

- What services are provided at specific locations or, conversely,
  where are the locations that provide a specified service?

- Who are the practitioners associated with a particular organization;
  what services do they provide; at which locations do they provide
  these services, and when?

The loosely coupled design and flexible querying capability of the mCSD
Profile means it can be deployed within a variety of eHealth
architectures and support a wide array of care workflows.

[Open and Closed Issues](a_issues.html)

### Organization of This Guide
This guide is organized into four main sections:

1. General Introduction:
   1. [Appendix A &mdash; Actor Summary Definitions](a_actor_summary_definitions.html)
   2. [Appendix B &mdash; Transaction Summary Definitions](b_transaction_summary_definitions.html)
2. Volume I: [Overview](146_introduction.html)
   1. [Actors and Transactions](1461_actors_and_transactions.html)
   2. [Actors Options](1462_actors_options.html)
   3. [Required Actor Groupings](1463_required_actor_groupings.html)
   4. [Overview](1464_overview.html)
   5. [Security Considerations](1465_security_considerations.html)
   6. [Cross Profile Considerations](1466_cross_profile_considerations.html)
   7. [Deployment Considerations](1467_deployment_considerations.html)

3. Volume II: Transaction Detail
   1. [Find Matching Care Services [ITI-90]](ITI-90.html)
   2. [Request Care Services Updates [ITI-91]](ITI-91.html)


Click on any of the links above, head on over the [table of contents](toc.html), or
if you are looking for a specific artifact, check out the [index](artifacts.html).

You can also download:

* [this entire guide](full-ig.zip),
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found at https://github.com/IHE/ITI.mCSD

# 1:46 Mobile Care Services Discovery (mCSD) Profile

The Mobile Care Services Discovery (mCSD) Profile supports discovery of
care services resources using a RESTful interface in interrelated,
federated environments.

The profile supports querying for:

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

5. **Healthcare Service** – Each healthcare service has a unique
    identifier. Examples include surgical services, antenatal care
    services, or primary care services. The combination of a Healthcare
    Service offered at a Location may have specific attributes including
    contact person, hours of operation, etc.

The capabilities detailed in this profile support consumer-centric
queries such as finding “where is the closest youth mental health
services clinic” or “what are the hours of a physiotherapist near my
workplace”. In addition, mCSD supports crucial health system management
workflows. This can include reporting and analyses, such as “what are my
health human resource capacities, by facility, by cadre,” “what are all
the services offered at this facility,” or conversely, “where are all
the facilities that offer this service.” The mCSD Profile may be
employed to support, for example, the Provider Queries listed by the US
Office of the National Coordinator as part of the Standards and
Interoperability Framework ([http://wiki.siframework.org/file/view/ESI
Query and
Response.pdf](http://wiki.siframework.org/file/view/ESI%20Query%20and%20Response.pdf)).

The loosely coupled design and flexible querying capability of the mCSD
Profile means it can be deployed within a variety of eHealth
architectures and support a wide array of care workflows.

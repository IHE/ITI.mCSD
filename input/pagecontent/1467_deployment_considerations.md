## 1:46.7 mCSD Deployment Considerations

### 1:46.7.1 Simple Deployment

A deployment may only have a single server that will maintain data
(Organization, Location, Facility, Practitioner, and/or Healthcare
Service). In this case, you would only need the Care Services Selective
Supplier (or Care Services Update Supplier) to send search results back
to one or more Care Services Selective Consumers (or Care Services
Update Consumer). See Figure 1:46.7.1-1.

Figure 1:46.7.1-1: Simple Deployment

### 1:46.7.2 Federated and Cross-Jurisdictional Deployments

A Federated Deployment has multiple levels of the Care Services Update
Suppliers linked to Care Services Update Consumers. These Update
Consumers may also support being Care Services Update Suppliers so that
higher level Update Consumers can receive their updates. They may also
support being a Care Services Selective Supplier so that Selective
Consumer clients can query that level of information. See Figure
1:46.7.2-1.

Interrelated content is maintained by the Care Services Update Consumer.
The Care Services Update Consumer routinely obtains new or updated
content from Care Services Update Suppliers by polling them. These
updates may refresh a data cache which the Update Consumer maintains.
The Update Consumer’s cache is refreshed at an appropriate interval
specified by the implementing jurisdiction. The implementing
jurisdiction will consider the implications of out of date information
when setting the refresh interval between cache updates. The normal
delays in updating listings will also be part of this consideration.

The various data sources would maintain definitive data regarding one or
more of: Organization, Location, Healthcare Service, or Practitioner and
implement the Care Services Update Supplier. These Care Services Update
Suppliers would respond to a Care Services Update Consumer’s request for
new or updated content since a specified date and time. To support this
capability, a Care Services Update Supplier should support time stamped
updates. Data elements that are deprecated should not simply be deleted,
but rather are updated to an appropriate status indicating their
deprecation.

This deployment may also have cross-jurisdictional considerations if any
of the Update Suppliers have overlap in the data they manage. In this
instance, the Care Services Update Consumer would need to resolve any
conflicts before sharing this information as either a Care Services
Update Supplier or a Care Services Selective Supplier. The way in which
these conflicts are resolved is defined by the implementing jurisdiction
of the Care Services Update Consumer.

Figure 1:46.7.2-1: Federated and Cross Jurisdictional Deployment

The Care Services Selective Consumer is the actor that queries for
information about interrelated care services. These queries are sent to
the Care Services Selective Supplier who develops a response based on
the content in its local data store. When a Care Services Selective
Supplier is combined with a Care Services Update Consumer (Global and
Country servers from Figure 1:46.7.2-1), it should maintain a cache of the
aggregated information from all the configured Care Services Update
Suppliers it is linked to.

In order for the Care Services Update Consumer’s (Global and Country
servers) cached content to be able to serve its role as an interlinked
data source, the following conditions should be met by Care Services
Update Suppliers who maintain content.

1.  Implementing jurisdictions may mandate terminologies for
    Organization Type, Service Type, Location Type, Location Status,
    Practitioner Type, Practitioner Status, Contact Point Type,
    Credential Type, Specialization Code, and language code. Care
    Services Update Suppliers would be configurable to use these
    terminologies, where mandated. In the case of a cross jurisdictional
    deployment, mapping between the terminology used by the various
    jurisdictions may need to be maintained.

2.  Implementing jurisdictions may mandate conventions regarding the
    types, components and formatting of Name, Address and Address Line
    elements. Care Services Update Suppliers would be configurable to
    use these formatting conventions, where mandated.

3.  Implementing jurisdictions may mandate the source of truth regarding
    Organization ID, Healthcare Service ID, Location ID and Practitioner
    ID. Care Services Update Suppliers would ensure that all
    cross-referenced IDs match corresponding resources in the
    jurisdictionally mandated sources of truth.

For guidance on handling challenges regarding the representation of
names across multiple languages and in different cultures, refer to the
ITI TF-2a: 3.24.5.2.3.1. This section in the ITI Technical Framework
describes the use of the language tag as documented in IETF RFC1766 and
the HL7 XCN name data type.

#### 1:46.7.2.1 Terminology Services

All referenced terminologies from a Care Services Selective Supplier or
Care Services Update Supplier may be pre-coordinated or they may be
resolvable from one or more terminology services. Though it is out of
scope of the mCSD Profile to define the means of interacting with a
terminology service, this could be provided, for example, through the
Sharing Value Sets (SVS) Profile or using appropriate FHIR resources
(e.g., ValueSet).

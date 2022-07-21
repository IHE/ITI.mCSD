<div markdown="1" class="stu-note">

## Significant changes from mCSD, Rev 3.5:
- Removed Additional Hierarchy extension due to addition of OrganizationAffiliation which can fulfil that use case.
- Changed Organization.type and Location.type for Facilities and Jurisdictions to use a defined CodeSystem instead of URNs.
  - Changed the cardinality and slicing of type to fix QA errors.  Additional slices can be made if needed by implementors.

## Issues

IHE welcomes [New Issues](https://github.com/IHE/ITI.mCSD/issues/new/choose)
from the GitHub community. For those without GitHub access, issues may be
submitted at [ITI Public Comments](https://www.ihe.net/ITI_Public_Comments/).

As issues are submitted they will be managed on the
[mCSD GitHub Issues](https://github.com/IHE/ITI.mCSD/issues), where discussion and
workarounds may be found. These issues, when critical, will be processed using the normal
[IHE Change Proposal](https://wiki.ihe.net/index.php/Category:CPs) management and balloting.
It is important to note that as soon as a Change Proposal is approved, it carries the same
weight as a published Implementation Guide (i.e., it is testable at an 
[IHE Connectathon](https://www.ihe.net/participate/connectathon/) from the time it is
approved, even if it will not be integrated until several months later).

### Open Issues and Questions
These issues were known as part of the publication, and IHE invites comments.

[mCSD\_7](https://github.com/IHE/ITI.mCSD/issues/94). Should there be additional required search parameters? Should
we also require any reverse chaining (\_has) options for the search?
Should we require any reverse includes (\_revinclude)? These would add
complexity to the server and most will have similar options through
include and normal chaining.

In ITI-90, we've added a number of required search parameters to support
queries for OrganizationAffiliation and Endpoint. Is it sustainable to require this many
search parameters? Should we move some to SHOULDs or MAYs? Note that the main use case
is locating an Organization based on its business, not network, attributes (already
covered elsewhere in mCSD), then checking its Endpoints. Further, recursively searching
parents and affiliations for Endpoints is likely an edge case, not one we need to try to do
in a single request.

[mCSD\_10](https://github.com/IHE/ITI.mCSD/issues/95). Section 1:46.8 mCSD Endpoint Usage Considerations, describes
how to populate and use an endpoint directory. Given that this IG is more
about how to deploy and use directories than what to put in them, would this
content be better as a white paper instead?  And could this content be
generalized to allow usage with mCSD as well as other directory IGs like
[https://hl7.org/fhir/uv/vhdir/](https://hl7.org/fhir/uv/vhdir/)?

[mCSD\_11](https://github.com/IHE/ITI.mCSD/issues/96). Should we assume federation of (i.e. connectivity to) child
organizations when related by .partOf? Currently the IG does
(see section 1:46.8.2), and we believe this is what is done in practice.
The downside is that there is no way to represent a hierarchical relationship that does not imply routing.

[mCSD\_12](https://github.com/IHE/ITI.mCSD/issues/97). Should we specify details of addressing to federated recipients, at least for some
profiles (see section 1:46.8.2)? For example, with MHD ITI-65 we could pass the Organization.identifier
in the intendedRecipient field. There is already an IG for passing a Direct address in an XDR ITI-41.

[mCSD\_14](https://github.com/IHE/ITI.mCSD/issues/98). Consider doing something similar to what
[HL7 UDAP Security](https://build.fhir.org/ig/HL7/fhir-udap-security-ig/branches/main/) did, and
describe mCSD within the larger family of directory IGs, making clear
where compatibility is assured as well as what each IGs focus is. For example,
[https://hl7.org/fhir/uv/vhdir/](https://hl7.org/fhir/uv/vhdir/) covers
maintenance and validation of the content of directories, while mCSD
covers how to represent and search complex structures.

[mCSD\_15](https://github.com/IHE/ITI.mCSD/issues/99). In [section 1:46.8](volume-1.html#1468-mcsd-endpoint-usage-considerations),
we mention the US TEFCA RCE maintaining a consolidated
directory spanning multiple networks. Can we identify an international example?

[mCSD\_16](https://github.com/IHE/ITI.mCSD/issues/100). In [section 1:46.8.2](volume-1.html#14682-endpoint-to-a-structure),
we say that a hierarchy formed by Organization.partOf implies federation of (i.e. connectivity to) child
organizations. Should we? We believe this is what is done in practice. The downside is that
there would be no way to represent a hierarchical relationship that does not imply routing.
An alternative proposed design would require OrganizationAffiliation with a code
of “DocShare-federate” to be explicitly related to any parent-child relationship to imply connectivity.
We did not choose this because its impact on existing directory structures would be substantial.

[mCSD\_18](https://github.com/IHE/ITI.mCSD/issues/101). Should we specify details of addressing federated recipients, at least for some
profiles (see [section 1:46.8.2](volume-1.html#14682-endpoint-to-a-structure))?
For example, with MHD ITI-65 we could pass the Organization.identifier
in the intendedRecipient field. There is already an IG for passing a Direct address in an XDR ITI-41.

[mCSD\_20](https://github.com/IHE/ITI.mCSD/issues/102). There is minimal usage guidance for REST endpoints.
Figure [1:46.8.3-1](volume-1.html#14683-grouping-actors) shows connectionType = hl7-fhir-rest and
extension:specificType = MHD-Recipient-ProvideReg. Is this necessary? Couldn't 
clients discover anything they need to know about REST from the CapabilityStatement?

[mCSD\_21](https://github.com/IHE/ITI.mCSD/issues/103). This profile says very little about home community ID, yet it is called out
in [mCSD issue #2](https://github.com/IHE/ITI.mCSD/issues/2).
[Section 1:46.8.2](volume-1.html#14682-endpoint-to-a-structure) talks about
"identifiers of type Home Community ID". The [profile on Endpoint for Document Sharing](StructureDefinition-IHE.mCSD.Endpoint.DocShare.html) says to put the HCID in the Endpoint.identifier. The
[Example of an mCSD XCA Query Endpoint](Endpoint-ex-endpointXCAquery.json.html) shows
an Endpoint.identifier.type with coding for a HCID. But this is not specified
normatively anywhere.

- Does HCID need to be specified to ensure interoperability?
- Should HCID be mandated on the Endpoint, the Organization, or both?
- Should federated communities behind an Endpoint be reflected in its identifier list?
- Should identifier of an Endpoint be empty?

We have seen directories add a custom code "HCID" that shows that an identifier is a HCID,
and have seen them use the system of "urn:ietf:rfc:3986" and a URN-encoded OID.
In committee discussions, we walked this through, and the general consensus was that
for identifying an organization to meet the MHD to a Federation use cases (i.e. to
determine connectivity), whether or not an identifier happened to be a HCID
was not significant. If we were to get into more detail about addressing federated recipients
(see issue 15 in this list), we might need to make decisions like whether HCID must be
a specific identifier type and whether it should be URN-encoded.

[mCSD\_23](https://github.com/IHE/ITI.mCSD/issues/104). In the [Resource Profile: mCSD Endpoint for Document Sharing](StructureDefinition-IHE.mCSD.Endpoint.DocShare.html), 
to indicate that the endpoint is not constrained, should payloadType and payloadMimeType be empty, or fully populated?

[mCSD\_24](https://github.com/IHE/ITI.mCSD/issues/105). In the [Resource Profile: mCSD Endpoint for Document Sharing](StructureDefinition-IHE.mCSD.Endpoint.DocShare.html), 
should payloadType and payloadMimeType be required to be the same for Endpoints that reflect grouped actors (i.e. XCA/XDS/MHD Query and XCA/XDS/MHD Retrieve), thus replicating the capability at both endpoints?

[mCSD\_25](https://github.com/IHE/ITI.mCSD/issues/106). In the [Resource Profile: mCSD Endpoint for Document Sharing](StructureDefinition-IHE.mCSD.Endpoint.DocShare.html),
should payloadType and payloadMimeType be specified for an XCA Query endpoint? It did not seem right that Query be indicated with a mimeType of ebRegistry as that is not helpful to the use-case.

[mCSD\_26](https://github.com/IHE/ITI.mCSD/issues/107). In the [Resource Profile: mCSD Endpoint for Document Sharing](StructureDefinition-IHE.mCSD.Endpoint.DocShare.html), would a Proxy service that is supporting OrgAff be a good example of NOT putting a homeCommunityId in the endpoint.identifier?

[mCSD\_27](https://github.com/IHE/ITI.mCSD/issues/108). Need to align and flesh out the examples better with the guidance in [section 1:46.8.2](volume-1.html#14682-endpoint-to-a-structure). For example, could we see an example for an organization accessible via two different exchanges?

[mCSD\_28](https://github.com/IHE/ITI.mCSD/issues/109). Grouping of actors is mentioned in [section 1:46.8.3](volume-1.html#14683-grouping-actors).
Does Karen's Cross apply here? If so, how? Should OrganizationAffiliation be required?

[Karen's Cross](https://wiki.directproject.org/w/images/3/3e/2011-03-09_PDF_-_XDR_and_XDM_for_Direct_Messaging_Specification_FINAL.pdf#page=6)
(see 3.0 Interaction Patterns. Also described [here](https://healthcaresecprivacy.blogspot.com/2012/08/karens-cross-or-just-minimal-metadata.html))
is a mapping table defined by the [Direct Project](https://wiki.directproject.org/Main_Page) (not by IHE),
that tells how to get to and from different flavors of IHE Document Sharing "Push" (XDR, XDM) and the Direct Protocol.
It was done at a "whiteboard" level of detail, and resulted in specific requirements for transforming
messages more or less isomorphically from one flavor to another. Later, [additional requirements](https://docs.google.com/document/d/1U0h_mB5AQGNgSwZKRHHqg8JVFPp1MW6ptIWxYR6Mtyg/edit#heading=h.o5yl9ti9jyak)
were added for encoding Direct addresses in XDR SubmissionSet.intendedRecipient. It should be noted
that the Cross is incomplete; neither Direct nor IHE has any analogous requirements for transforming,
say, an XCA Query and Retrieve response into an XDM file. XCDR and MHD Push and Pull are also missing. 
That said, IHE Document Sharing profiles (not counting Direct) are generally considered similar enough that
transformations should be obvious.

So, when would Karen's Cross (or an expanded version) apply? Potentially anywhere two systems
need to translate between different Doc Sharing actors, but it's really only needed if transformations
are not obvious. Maybe it needs to be documented by IHE (especially if it's between IHE actors).
We'll look into this in a second.

But first, OrganizationAffiliation shouldn't be required, because it's orthogonal
to whether translation is needed. For example: In the directory, Org A has two Endpoints:
an MHD Document Responder and an XDS Document
Registry/Repository. Behind the scenes, the MHD actor is an adapter over the XDS actors.
This is simply two APIs to the same organization. The HCID and any other
organization or author identifiers are simply copied; there is no translation needed.

Now let's consider the other cases where there's federation to other organizations/entities
not directly reachable. OrganizationAffiliation is just one case:
- An Org allows access to others related with partOf
- An Org allows access to others related with OrganizationAffiliation
- An Org allows access to Practitioners related via mCSD links

In these cases, there might be a translation layer behind the exposed Endpoint to get to those
other entities, or there might be some other proprietary mechanism: internal EHR messaging,
direct DB access, etc.

So would Karen's Cross (or an expanded version) potentially apply? Yes, but likely only in making
sure that addressing of federated organizations/entities is clear. We have that as issue mCSD\_18.

[mCSD\_29](https://github.com/IHE/ITI.mCSD/issues/110). Is OrganizationAffiliation sufficiently mature to base this profile on?
Is it appropriate to say the .organization is the "parent-like" org that rolls up content from
.participatingOrganization orgs? There is a .network field; should that be used
instead?

We believe we are using it appropriately, but there are a couple of issues we are tracking:
- [FHIR-25406: definition of organization and participatingOrganization in OrganizationAffiliation is not clear](https://jira.hl7.org/browse/FHIR-25406)
- [FHIR-36019: OrganizationAffiliation.network unclear](https://jira.hl7.org/browse/FHIR-36019)

[mCSD\_30](https://github.com/IHE/ITI.mCSD/issues/111). Currently there is one code in [mCSD Organization Affiliation Types](https://build.fhir.org/ig/IHE/ITI.mCSD/branches/main/CodeSystem-MCSDOrgAffTypes.html). Should there be at least two, one for transparent federation vs opaque federation?
The expectations would be different: with transparent federation, federated identifiers would be
preserved in responses and respected in requests. With opaque federation, identifiers would be
consolidated/overwritten with the identifiers of the "parent" organization.

Probably, but the implications of opaque federation are complex. Some aspects may be consolidated
(e.g. golden patient record) while others are not (separate documents). Perhaps we could limit scope
to whether federated communities (Organizations with an ID of type HCID) are addressable in
requests and responses. Seeking input from reviewers.

[mCSD\_31](https://github.com/IHE/ITI.mCSD/issues/112). Currently, only synchronous XDS/XCA/XDR and MHD Push are supported. This scope was limited
for the public-comment deadline. After public comment, we plan to add in asynchronous (WS-A and AS4)
and full MHD. One area that needs work is Digital Certificates to support async end-to-end security
(Not needed for sync that uses TLS).
- Currently, base FHIR doesn't include a publicKey, and recommends a local extension
[https://jira.hl7.org/browse/FHIR-10764](https://jira.hl7.org/browse/FHIR-10764). We will add an extension.
- Note VhDir has an extension http://hl7.org/fhir/uv/vhdir/StructureDefinition/digitalcertificate, 
but it is very complex. Not clear if this complexity is needed.

[mCSD\_32](https://github.com/IHE/ITI.mCSD/issues/113). In [mCSD Endpoint](StructureDefinition-IHE.mCSD.Endpoint.html), rather than managingOrganization 1..1, create an invariant so that
either managingOrganization or contact must be populated.

[mCSD\_33](https://github.com/IHE/ITI.mCSD/issues/114). FHIR R5 will allow Endpoint.connectionType to be greater than 1, so we can use the IHE-defined codes in addition to the HL7 ones. We won't need Endpoint.extension:specificType anymore. See [Issue 89](https://github.com/IHE/ITI.mCSD/issues/89).

[mCSD\_34](https://github.com/IHE/ITI.mCSD/issues/58). Should we add a subscription model for receiving updates instead of or in addition to ITI-91 for resource updates?

### Closed Issues
These issues have been decided and documented in the publication.

*mCSD\_1. Should we include the FreeBusy transaction and use cases or
just remove them?*

  - Take this out, and possibly add later if needed as an option.

*mCSD\_2. Should we include the aggregate reporting use case from Care
Services Discovery (CSD) or remove with a reference to Aggregate Data
Exchange (ADX) in cross profile considerations? This use case would
define options for the actors in this use case to return aggregate data.
*

  - At this time we do not believe these are key uses cases, but request
    feedback.

*mCSD\_3. How do we capture data about community health workers? In some
environments, there are community health workers that are associated
with a facility but don't actually work there. Such a worker might have
a set area of villages that they rotate through providing
community-based care. The villages are within the catchment area of a
Health facility, and the supervisor of the community health worker may
be based at that facility. *

*Not quite sure the best way to capture this when looking at:*

*[http://build.fhir.org/location.html\#bnr](http://build.fhir.org/location.html#bnr)*

*It is clear that we have a hierarchy of locations to capture the
geographic hierarchy (jurisdictions): *

  - *The health facility in question would be situated at a location
    above the village level, say at the county or district level - this
    we can capture in the parent-child relationship “partOf” in the
    location resource*

  - *The community health worker is providing services at several
    villages - this we can capture through the location data field of
    the role in the practitioner resource*

  - *The community health worker is associated to a health facility -
    again we can capture this through the location field but perhaps we
    would use a different role to indicate that they're community health
    worker associated to this facility but not directly providing
    services at the facility, only its catchment area*

  - *In case a community health worker is reporting to a supervisor -
    that's not captured anywhere that I can see in FHIR. I think this is
    a larger that exists beyond the community health worker context*

Perhaps the best way to model this is to define each village as a
location, and associate that worker with each location they rotate
through. Each village is a partOf the health district. The facility is
also a location that is partOf the district. The practitioner is related
to the village locations with a "delivers care to" role; and to the
facility with a "based out of" role.

*mCSD\_4. Do we need to include more geospatial data (such as polygons
or more complex geometry types) stored with Locations and how? This
would be so jurisdictions (such as districts or counties) could include
that data instead of just a position (latitude/longitude).
[CP\#13391](http://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=13391)
has been opened for this.*

As per the request, FHIR has added a standard extension to address this:
[https://www.hl7.org/fhir/extension-location-boundary-geojson.html](https://www.hl7.org/fhir/extension-location-boundary-geojson.html)

*mCSD\_5. With a federated deployment, data may come from multiple
sources and there can be an issue with resolving duplicate records and
maintaining the mapping. Patient has a link field and we have opened a
CP for Organization, Location, and Practitioner. CP
[GF\#13264](http://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=13264)
has been opened for this. There is also the Linkage resource, but it is
maturity level 0.*

FHIR has closed the issued with the recommendation to use the Linkage
resource to handle this.

*mCSD\_6. We need a way to deprecate identifiers. For now we can use
period and we have created a CP to add an entry to the use field:
[GF\#13265](http://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=13265).*

FHIR has added an additional Identifier.use code of “old” for this case.

*mCSD\_8. IHE has updated mCSD to add support for organizational
facilities. As part of this revision of mCSD, we have removed the
“Organization Option”, “Location Option”, “Practitioner Option”, and
“Healthcare Services Option”. These options existed to enable servers
to focus only on a small subset of the resources. The actual burden to
support all resources is small and set of options seems to add
unnecessary complexity. The result would be that servers shall support
all of the FHIR Resources, the clients can use the FHIR Resources in the
way defined. If there is concern with the removal of these options,
please submit a Public Comment.*

No comments received so changes are being kept, but any additional comments are welcome.

*mCSD\_9. We have added a requirement to include a meta.profile tag for
all compliant resources. This is so that in a mixed server that has
these resources as well as others, a Care Services Selective Consumer
can limit the results of Find Matching Care Service \[ITI-90\] to only
mCSD resources using the \_profile parameter. Since this type of
parameter isn’t allowed for the \_history transaction for Request Care
Services Updates \[ITI-91\] the Care Services Update Consumer may have
to filter results if required. Is this a common configuration and is
this step necessary?*

Removed the references to meta.profile.

*mCSD\_13. Section 1:46.8 mCSD Endpoint Usage Considerations, describes
how to populate and use an endpoint directory. Given that this IG is more
about how to deploy and use directories than what to put in them, would this
content be better as a white paper instead? And could this content be
generalized to allow usage with mCSD as well as other directory IGs like
[https://hl7.org/fhir/uv/vhdir/](https://hl7.org/fhir/uv/vhdir/)?*

Duplicate of mCSD\_10

*mCSD\_17. In [section 1:46.8.2](volume-1.html#14682-endpoint-to-a-structure),
we say that a hierarchy formed by the mCSD Additional Hierarchies extension
does not imply federation of (i.e. connectivity to) child organizations. Should it?*

Extension has been removed.

*mCSD\_19. In [section 1:46.8.2](volume-1.html#14682-endpoint-to-a-structure),
why do we use OrganizationAffiliation for
an organization's membership in an HIE, as opposed to the mCSD Additional Hierarchies extension?
Because we don't wish to constrain the use of resources that define organizational structure,
rather just reflect how best to use Endpoints in these structures. OrganizationAffiliation
is already used in other use cases, and in fact, shows HIE/HIO membership as one of
its examples.*

Extension has been removed.

*mCSD\_22. In ITI-90, we've added a number of required search parameters to support
queries for OrganizationAffiliation and Endpoint. Is it sustainable to require this many
search parameters? Should we move some to SHOULDs or MAYs? Note that the main use case
is locating an Organization based on its business, not network, attributes (already
covered elsewhere in mCSD), then checking its Endpoints. Further, recursively searching
parents and affiliations for Endpoints is likely an edge case, not one we need to try to do
in a single request.*

Combined into related open issue 7.

## Significant changes from mCSD, Rev 3.4:
- Added OrganizationAffiliation and Endpoint resources to [1:46](volume-1.html#1-46-mobile-care-services-discovery-mcsd) and [1:46.1.1](volume-1.html#14611-actor-descriptions-and-actor-profile-requirements)
- Added [Use Case #5: Organization Affiliation](volume-1.html#146425-use-case-5-health-information-exchange-hie-membership-discovery),
  describing how OrganizationAffiliations can represent non-hierarchical relationships between Organizations
- Added [Use Case #6: Health Information Exchange (HIE) Endpoint Discovery](volume-1.html#146426-use-case-6-health-information-exchange-hie-endpoint-discovery), showing an example of querying a directory with Endpoint resources
- Added new section [1:46.8 mCSD Endpoint Usage Considerations](volume-1.html#1468-mcsd-endpoint-usage-considerations),
  describing how to populate and use a directory with Endpoint resources to enable electronic communications
- ITI-90: added OrganizationAffiliation and Endpoint resources to [Description and Message Semantics](ITI-90.html#239041-find-matching-care-services-request-message)
- ITI-90: added expected search parameters for [Organization](ITI-90.html#23904122-organization-resource-message-semantics) to support OrganizationAffiliation and Endpoint resources
- ITI-90: added sections for expected search parameters for [Endpoint](ITI-90.html#23904128-endpoint-resource-message-semantics) and [OrganizationAffiliation](ITI-90.html#23904129-organizationaffiliation-resource-message-semantics)
- Added the following to deal with FHIR R4 Endpoint.connectionType being limited to one value from an HL7 valueSet
  (see [FHIR-12342](https://jira.hl7.org/browse/FHIR-12342): need more detail to connect to an IHE Document Sharing endpoint):
  - A code system [mCSD Endpoint Types](CodeSystem-MCSDEndpointTypes.html) to define IHE Endpoint types beyond those in the FHIR core, using the same abstract codes HL7 uses like "ihe-xca", but adds child codes like "XCA-RespGateway-Query"
  - A [core value set](ValueSet-MCSDEndpointTypesCoreDocShareVS.html) to cover the codes at the HL7 level of detail, suitable for use in connectionType
  - An [expanded value set](ValueSet-MCSDEndpointTypesDocShareVS.html) using the child codes, for use in the following extension
  - An [extension for Endpoint Specific Type](StructureDefinition-ihe-endpointspecifictype.html) to carry the more-specific IHE code
- Added a [code system](CodeSystem-MCSDOrgAffTypes.html) and [value set](ValueSet-MCSDOrgAffTypesVS.html) for types of OrganizationAffiliation
- Added structure definitions for resource profiles:
  - [mCSD Endpoint](StructureDefinition-IHE.mCSD.Endpoint.html): general Endpoint
  - [mCSD Endpoint for Document Sharing](StructureDefinition-IHE.mCSD.Endpoint.DocShare.html):
    Endpoint that supports IHE Document Sharing (e.g. XCA, MHD), using the [extension for Endpoint Specific Type](StructureDefinition-ihe-endpointspecifictype.html)
  - [mCSD Organization Affiliation](StructureDefinition-IHE.mCSD.OrganizationAffiliation.html): general OrganizationAffiliation.
  - [mCSD Organization Affiliation DocumentSharing](StructureDefinition-IHE.mCSD.OrganizationAffiliation.DocShare.html): OrganizationAffiliation that supports IHE Document Sharing, using a fixed code "DocShare-federate" that indicates that the affiliation implies electronic access to the participatingOrganization (see [1:46.8 mCSD Endpoint Usage Considerations](volume-1.html#1468-mcsd-endpoint-usage-considerations))
- Added [examples](artifacts.html#example-example-instances) for OrganizationAffiliation and Endpoint


## Significant changes from mCSD, Rev 3.3:
- FHIR Implementation Guide instead of [pdf - Rev. 3.3](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_mCSD.pdf)
- Removed inline UML text and moved it to images-source/
- Removed reference to setting meta.profile as it is redundant
- Added sections in actor requirements describing the requirement of providing a capability statement [Volume 1](volume-1.html#14611-actor-descriptions-and-actor-profile-requirements)
- Updated the canonical URL for the organization hierarchy extension to `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.OrganizationHierarchy`
- Added links to the structure definitions for resource profiles to [ITI-90](ITI-90.html) and [ITI-91](ITI-91.html)
- Changed structuredefinitions for Facility and Jurisdiction to use an invariant for the type requirement instead of slicing
- Added in text to show that searches can use GET or POST [ITI-90 Message Semantics](ITI-90.html#2390412-message-semantics)
- Added in retrieve (GET RESOURCE/ID) message section starting at [ITI-90](ITI-90.html#239043-retrieve-care-services-resource-message)
- Removed tables for StructureDefinitions for resources.

</div>

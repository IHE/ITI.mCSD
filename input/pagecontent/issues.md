<div markdown="1" class="stu-note">

### Significant changes from PDQm, Rev 3.3:
- FHIR Implementation Guide instead of [pdf - Rev. 3.3](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_mCSD.pdf)
- Removed inline UML text and moved it to images-source/
- Removed reference to setting meta.profile as it is redundant
- Added section in transactions describing the requirement of providing a capability statement [ITI-90](ITI-90.html#2390424-capabilitystatement-resource) and [ITI-91](ITI-91.html#2391424-capabilitystatement-resource).  Should this be in the response or request message section?
- Updated the canonical URL for the organization hierarchy extension to `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.OrganizationHierarchy`
- Added links to the structure definitions for resource profiles to [ITI-90](ITI-90.html) and [ITI-91](ITI-91.html)

### Open Issues and Questions

mCSD\_7. Should there be additional required search parameters? Should
we also require any reverse chaining (\_has) options for the search?
Should we require any reverse includes (\_revinclude)? These would add
complexity to the server and most will have similar options through
include and normal chaining.

mCSD\_8. IHE has updated mCSD to add support for organizational
facilities. As part of this revision of mCSD, we have removed the
“Organization Option”, “Location Option”, “Practitioner Option”, and
“Healthcare Services Option”. These options existed to enable servers
to focus only on a small subset of the resources. The actual burden to
support all resources is small and set of options seems to add
unnecessary complexity. The result would be that servers shall support
all of the FHIR Resources, the clients can use the FHIR Resources in the
way defined. If there is concern with the removal of these options,
please submit a Public Comment.



### Closed Issues

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

</div>
## 2:3.90 Find Matching Care Services \[ITI-90\]

### 2:3.90.1 Scope

The Find Matching Care Services transaction returns a list of matching
care services resources based on the query sent. A Care Services
Selective Consumer initiates a Find Matching Care Services transaction
against a Care Services Selective Supplier.

### 2:3.90.2 Actor Roles

| **Actor:** | Care Services Selective Consumer                                                                 |
| ---------- | ------------------------------------------------------------------------------------------------ |
| **Role:**  | Requests a list of resources from the Care Services Selective Supplier based on query parameters |
| **Actor:** | Care Services Selective Supplier                                                                 |
| **Role:**  | Accepts the query request and returns a list of matching resources.                              |

### 2:3.90.3 Referenced Standards

  - HL7 FHIR standard Release 4 <http://hl7.org/fhir/R4/index.html>

  - JSON – IETF RFC7159

  - XML

  - HTTP 1.1

### 2:3.90.4 Messages

Figure 2:3.90.4-1: Interaction Diagram

#### 2:3.90.4.1 Find Matching Care Services Request Message

The Find Matching Care Services message is a FHIR search operation on
the Organization, Location, Practitioner, PractitionerRole, and/or
HealthcareService Resources.

##### 2:3.90.4.1.1 Trigger Events

A Care Services Selective Consumer triggers a Find Matching Care
Services Request to a Care Services Selective Supplier according to the
business rules for the query. These business rules are outside the scope
of this transaction.

##### 2:3.90.4.1.2 Message Semantics

A Care Services Selective Consumer initiates a search request using HTTP
GET as defined at <http://hl7.org/fhir/R4/http.html#search> on the
Organization, Location, Practitioner, PractitionerRole, or
HealthcareService Resources. The query parameters are identified below.
A Care Services Selective Consumer may query any combination or subset
of the parameters.

A Care Services Selective Supplier shall support combinations of search
parameters as defined at <http://hl7.org/fhir/R4/search.html#combining>,
“Composite Search Parameters.”

A Care Services Selective Supplier shall support responding to a request
for both the JSON and the XML messaging formats as defined in FHIR. A
Care Services Selective Consumer shall accept either the JSON or the XML
messaging formats as defined in FHIR. See ITI TF-2x: Appendix Z.6 for
more details.

A Care Services Selective Supplier shall implement the parameters
described below. A Care Services Selective Supplier may choose to
support additional query parameters beyond the subset listed below. Any
additional query parameters supported shall be supported according to
the core FHIR specification.

See ITI TF-2x: Appendix W for informative implementation material for
this transaction.

###### 2:3.90.4.1.2.1 Common Parameters

The Care Services Selective Supplier shall support the :contains and
:exact modifiers in all of the string query parameters below.

The Care Services Selective Supplier shall support the following search
parameters as defined at <http://hl7.org/fhir/R4/search.html#all>.

\_id

\_lastUpdated

\_profile

The Care Services Selective Supplier shall also support the following
prefixes for the \_lastUpdated parameter: gt, lt, ge, le, sa, and eb.

###### 2:3.90.4.1.2.2 Organization Resource Message Semantics

The Care Services Selective Supplier shall support the following search
parameters on the Organization Resource as defined at
<http://hl7.org/fhir/R4/organization.html#search>. String parameter
modifiers are defined at <http://hl7.org/fhir/R4/search.html#string>.
The ihe-mcsd-hierarchy-\* search parameters query the hierarchy
extension identified by the following canonical URI
http://ihe.net/fhir/StructureDefinition/IHE\_mCSD\_hierarchy\_extension.

active

identifier

name

partof

partof:above

partof:below

type

partof.identifier

partof.name

\_revInclude=Location:organization

ihe-mcsd-hierarchy-type

ihe-mcsd-hierarchy-partof

ihe-mcsd-hierarchy-partof:above

ihe-mcsd-hierarchy-partof:below

###### 2:3.90.4.1.2.3 Location Resource Message Semantics

The Care Services Selective Supplier shall support the following search
parameters on the Location Resource as defined at
<http://hl7.org/fhir/R4/location.html#search>. String parameter
modifiers are defined at <http://hl7.org/fhir/R4/search.html#string>.

identifier

name

organization

partof

partof:above

partof:below

status

type

partof.identifier

partof.name

organization.active

organization.identifier

organization.name

\_include=Location:organization

###### 2:3.90.4.1.2.4 Practitioner Resource Message Semantics

The Care Services Selective Supplier shall support the following search
parameters on the Practitioner Resource as defined at
<http://hl7.org/fhir/R4/practitioner.html#search>. String parameter
modifiers are defined at <http://hl7.org/fhir/R4/search.html#string>.

active

identifier

name

given

family

###### 2:3.90.4.1.2.5 PractitionerRole Resource Message Semantics

The Care Services Selective Supplier shall support the following search
parameters on the PractitionerRole Resource as defined at
<http://hl7.org/fhir/R4/practitionerrole.html#search>.

active

location

organization

practitioner

role

service

specialty

practitioner.identifier

practitioner.name

practitioner.given

practitioner.family

\_include=PractitionerRole:practitioner

organization.active

organization.identifier

organization.name

location.status

location.identifier

location.name

service.active

service.indentifier

service.location

service.name

service.organization

###### 2:3.90.4.1.2.6 HealthcareService Resource Message Semantics

The Care Services Selective Supplier shall support the following search
parameters on the HealthcareService Resource as defined at
<http://hl7.org/fhir/R4/healthcareservice.html#search>. String parameter
modifiers are defined at <http://hl7.org/fhir/R4/search.html#string>.

active

identifier

location

name

organization

service-type

organization.active

organization.identifier

organization.name

location.status

location.identifier

location.name

###### 2:3.90.4.1.2.7 Location Distance Option Message Semantics

The Care Services Selective Supplier supporting the Location Distance
Option shall support the following search parameters on the Location
Resource as defined at <http://hl7.org/fhir/R4/location.html#search>.

near

##### 2:3.90.4.1.3 Expected Actions

The Care Services Selective Supplier shall process the query to discover
the resources that match the search parameters given, and return a
response as per Section 2:3.90.4.2 or an error as per
<http://hl7.org/fhir/R4/search.html#errors>.

#### 2:3.90.4.2 Find Matching Care Services Response Message

##### 2:3.90.4.2.1 Trigger Events

The Care Services Selective Supplier sends the Find Matching Care
Services Response to the Care Services Selective Consumer when results
to the query are ready.

##### 2:3.90.4.2.2 Message Semantics

The Care Services Selective Supplier shall support the search response
message as defined at <http://hl7.org/fhir/R4/http.html#search> on the
following Resources.

  - Organization, as defined at
    <http://hl7.org/fhir/R4/organization.html>

  - Location, as defined at <http://hl7.org/fhir/R4/location.html>

  - Practitioner, as defined at
    <http://hl7.org/fhir/R4/practitioner.html>

  - PractitionerRole, as defined at
    <http://hl7.org/fhir/R4/practitionerrole.html>

  - HealthcareService, as defined at
    <http://hl7.org/fhir/R4/healthcareservice.html>
    
    All References (reference.reference element) to Resources defined in
    this transaction shall be populated with an accessible URL (see
    <https://www.hl7.org/fhir/references-definitions.html#Reference.reference>),
    unless the referenced resource is not present on a server accessible
    to the client.

###### 2:3.90.4.2.2.1 FHIR Organization Resource Constraints

A Care Services Selective Consumer may query on Organization Resources.
A Care Services Selective Supplier shall return a Bundle of matching
Organization Resources. The Organization Resource shall be further
constrained as described in Table 2:3.90.4.2.2.1-1. The Element column in
Table 2:3.90.4.2.2.1-1 references the object model defined at
<http://hl7.org/fhir/R4/organization.html#resource>.

Table 2:3.90.4.2.2.1-1: Organization Resource Constraints

<table>
<thead>
<tr class="header">
<th><p>Element</p>
<p>&amp;</p>
<p>Cardinality</p></th>
<th>Data Type</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>meta.profile</p>
<p>[1..*]</p></td>
<td><p>There shall be at least one entry with the value:</p>
<p>http://ihe.net/fhir/StructureDefinition/IHE_mCSD_Organization</p></td>
</tr>
<tr class="even">
<td><p>type</p>
<p>[1..*]</p></td>
<td><p>A code that describes the type of Organization.</p>
<p>CodeableConcept</p></td>
</tr>
<tr class="odd">
<td><p>name</p>
<p>[1..1]</p></td>
<td>string</td>
</tr>
<tr class="even">
<td>partOf<br />
[0..1]</td>
<td><p>If the Organization belongs to a single hierarchy, the partOf element shall be used.</p>
<p>Reference (Organization)</p></td>
</tr>
<tr class="odd">
<td><p>extension</p>
<p>[0..*]</p></td>
<td><p>If there are additional hierarchies (such as funding source), include them in the extension with the following details:</p>
<p>Set the url to the canonical URI for this extension</p>
<p>url = “<a href="http://ihe.net/fhir/StructureDefinition/IHE_mCSD_hierarchy_extension">http://ihe.net/fhir/StructureDefinition/IHE_mCSD_hierarchy_extension</a>”</p>
<p>Set the sub-extension values</p>
<p>hierarchy-type = valueCodeableConcept</p>
<p>part-of = valueReference(Organization)</p></td>
</tr>
</tbody>
</table>

A Care Services Selective Consumer may query on Organization Resources
when working with Facilities. A Care Services Selective Supplier shall
return a Bundle of matching Organization Resources when working with
Facilities. In addition to the constraints in Table 2:3.90.4.2.2.1-1, the
FHIR Organization Resource shall be further constrained as described in
Table 2:3.90.4.2.2.1-2. The Element column in Table 2:3.90.4.2.2.1-2
references the object model defined at
<http://hl7.org/fhir/R4/organization.html#resource>.

Table 2:3.90.4.2.2.1-2: Additional Organization Resource Constraints for
Facilities

<table>
<thead>
<tr class="header">
<th><p>Element</p>
<p>&amp;</p>
<p>Cardinality</p></th>
<th>Data Type</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>meta.profile [2..*]</td>
<td><p>In addition, there shall be one entry with the value:</p>
<p>http://ihe.net/fhir/StructureDefinition/IHE_mCSD_FacilityOrganization</p></td>
</tr>
<tr class="even">
<td><p>type</p>
<p>[2..*]</p></td>
<td><p>In addition, there shall be one type with the following value:</p>
<p>system = "urn:ietf:rfc:3986"</p>
<p>code = "<a href="http://ihe.net/SYSTEM">urn:ihe:iti:mcsd:2019:facility</a>"</p></td>
</tr>
</tbody>
</table>

###### 2:3.90.4.2.2.2 FHIR Location Resource Constraints

A Care Services Selective Consumer may query on Location Resources. A
Care Services Selective Supplier shall return a Bundle of matching
Location Resources. The Location Resource shall be further constrained
as described in Table 2:3.90.4.2.2.2-1. The Element column in Table
2:3.90.4.2.2.2-1 references the object model defined at
<http://hl7.org/fhir/R4/location.html#resource>.

Table 2:3.90.4.2.2.2-1: Location Resource Constraints

<table>
<thead>
<tr class="header">
<th><p>Element</p>
<p>&amp;</p>
<p>Cardinality</p></th>
<th>Data Type</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>meta.profile</p>
<p>[1..*]</p></td>
<td><p>There shall be at least one entry with the value:</p>
<p>http://ihe.net/fhir/StructureDefinition/IHE_mCSD_Location</p></td>
</tr>
<tr class="even">
<td><p>type</p>
<p>[1..*]</p></td>
<td><p>A code that describes the type of Organization.</p>
<p>CodeableConcept</p></td>
</tr>
<tr class="odd">
<td><p>physicalType</p>
<p>[1..1]</p></td>
<td><p>A code that describes the physical type of Organization.</p>
<p>CodeableConcept</p></td>
</tr>
<tr class="even">
<td><p>name</p>
<p>[1..1]</p></td>
<td>string</td>
</tr>
<tr class="odd">
<td><p>status</p>
<p>[1..1]</p></td>
<td>code (active| suspended| inactive)</td>
</tr>
</tbody>
</table>

When the resource is a Facility, the Location Resource shall be paired
with an Organization Resource using the managingOrganization element in
Location. A Care Services Selective Consumer may query on Location
Resources when working with Facilities. A Care Services Selective
Supplier shall return a Bundle of matching Location Resources when
working with Facilities. In addition to the constraints in Table
2:3.90.4.2.2.2-1, the FHIR Location Resource shall be further constrained
as described in Table 2:3.90.4.2.2.2-2. The Element column in Table
2:3.90.4.2.2.2-2 references the object model defined at
<http://hl7.org/fhir/R4/location.html#resource>.

Table 2:3.90.4.2.2.2-2: Additional Location Resource Constraints for
Facilities

<table>
<thead>
<tr class="header">
<th><p>Element</p>
<p>&amp;</p>
<p>Cardinality</p></th>
<th>Data Type</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>meta.profile</p>
<p>[2..*]</p></td>
<td><p>In addition, there shall be one entry with the value:</p>
<p>http://ihe.net/fhir/StructureDefinition/IHE_mCSD_FacilityLocation</p></td>
</tr>
<tr class="even">
<td><p>type</p>
<p>[2..*]</p></td>
<td><p>In addition, there shall be one type with the following value:</p>
<p>system = "urn:ietf:rfc:3986"</p>
<p>code = "<a href="http://ihe.net/SYSTEM">urn:ihe:iti:mcsd:2019:facility</a>"</p></td>
</tr>
<tr class="odd">
<td><p>managingOrganization</p>
<p>[1..1]</p></td>
<td><p>The reference to the Organization resource for this facility.</p>
<p>Reference(Organization)</p></td>
</tr>
</tbody>
</table>

When supporting the Location Distance Option. The Location Resource
shall be further constrained as described in Table 2:3.90.4.2.2.2-3. The
Element column in Table 2:3.90.4.2.2.2-3 references the object model
defined at <http://hl7.org/fhir/R4/location.html#resource>.

Table 2:3.90.4.2.2.2-3: Location Resource Constraints with Location
Distance Option

<table>
<thead>
<tr class="header">
<th><p>Element</p>
<p>&amp;</p>
<p>Cardinality</p></th>
<th>Data Type</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>meta.profile</p>
<p>[2..*]</p></td>
<td><p>There shall be at least one entry with the value:</p>
<p>http://ihe.net/fhir/StructureDefinition/IHE_mCSD_LocationDistance</p></td>
</tr>
<tr class="even">
<td><p>position</p>
<p>[1..1]</p></td>
<td>BackboneElement</td>
</tr>
</tbody>
</table>

###### 2:3.90.4.2.2.3 FHIR Practitioner Resource Constraints

A Care Services Selective Consumer may query on Practitioner Resources.
A Care Services Selective Supplier shall return a Bundle of matching
Practitioner Resources. The Practitioner Resource shall be further
constrained as described in Table 2:3.90.4.2.2.3-1. The Element column in
Table 2:3.90.4.2.2.3-1 references the object model defined at
<http://hl7.org/fhir/R4/practitioner.html#resource>.

Table 2:3.90.4.2.2.3-1: Practitioner Resource Constraints

<table>
<thead>
<tr class="header">
<th><p>Element</p>
<p>&amp;</p>
<p>Cardinality</p></th>
<th>Data Type</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>meta.profile</p>
<p>[1..*]</p></td>
<td><p>There shall be at least one entry with the value:</p>
<p>http://ihe.net/fhir/StructureDefinition/IHE_mCSD_Practitioner</p></td>
</tr>
<tr class="even">
<td><p>name</p>
<p>[1..*]</p></td>
<td>HumanName</td>
</tr>
</tbody>
</table>

###### 2:3.90.4.2.2.4 FHIR PractitionerRole Resource Constraints

A Care Services Selective Consumer may query on PractitionerRole
Resources. A Care Services Selective Supplier shall return a Bundle of
matching PractitionerRole Resources. The PractitionerRole Resource shall
be further constrained as described in Table 2:3.90.4.2.2.4-1. The Element
column in Table 2:3.90.4.2.2.4-1 references the object model defined at
<http://hl7.org/fhir/R4/practitionerrole.html#resource>.

Table 2:3.90.4.2.2.4-1: PractitionerRole Resource Constraints

<table>
<thead>
<tr class="header">
<th><p>Element</p>
<p>&amp;</p>
<p>Cardinality</p></th>
<th>Data Type</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>meta.profile</p>
<p>[1..*]</p></td>
<td><p>There shall be at least one entry with the value:</p>
<p>http://ihe.net/fhir/StructureDefinition/IHE_mCSD_PractitionerRole</p></td>
</tr>
<tr class="even">
<td><p>code</p>
<p>[1..*]</p></td>
<td>CodeableConcept</td>
</tr>
</tbody>
</table>

###### 2:3.90.4.2.2.5 FHIR HealthcareService Resource Constraints

A Care Services Selective Consumer may query on HealthcareService
Resources. A Care Services Selective Supplier shall return a Bundle of
matching HealthcareService Resources. The HealthcareService Resource
shall be further constrained as described in Table 2:3.90.4.2.2.5-1. The
Element column in Table 2:3.90.4.2.2.5-1 references the object model
defined at <http://hl7.org/fhir/R4/healthcareservice.html#resource>.

Table 2:3.90.4.2.2.5-1: HealthcareService Resource Constraints

<table>
<thead>
<tr class="header">
<th><p>Element</p>
<p>&amp;</p>
<p>Cardinality</p></th>
<th>Data Type</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>meta.profile</p>
<p>[1..*]</p></td>
<td><p>There shall be at least one entry with the value:</p>
<p>http://ihe.net/fhir/StructureDefinition/IHE_mCSD_HealthcareService</p></td>
</tr>
<tr class="even">
<td><p>type</p>
<p>[1..*]</p></td>
<td>CodeableConcept</td>
</tr>
<tr class="odd">
<td><p>name</p>
<p>[1..1]</p></td>
<td>string</td>
</tr>
</tbody>
</table>

##### 2:3.90.4.2.3 Expected Actions

The Care Services Selective Consumer has received the response and
continues with its workflow.

### 2:3.90.5 Security Considerations

See ITI TF-1: 46.5 for security considerations for the mCSD Profile.

See ITI TF-2x: Appendix Z.8 for common mobile security considerations.

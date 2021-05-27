## 2:3.91 Request Care Services Updates \[ITI-91\]

### 2:3.91.1 Scope

The Request Care Services Updates transaction is used to return a list
of updated care services resources. A Care Services Update Consumer
initiates a Request Care Services Updates transaction against a Care
Services Update Supplier.

### 2:3.91.2 Actor Roles

| **Actor:** | Care Services Update Consumer                                                |
| ---------- | ---------------------------------------------------------------------------- |
| **Role:**  | Requests a list of updated resources from the Care Services Update Supplier. |
| **Actor:** | Care Services Update Supplier                                                |
| **Role:**  | Accepts the update request and returns a list of updated resources.          |

### 2:3.91.3 Referenced Standards

  - HL7 FHIR standard Release 4 <http://hl7.org/fhir/R4/index.html>

  - JSON – IETF RFC7159

  - XML

  - HTTP 1.1

### 2:3.91.4 Messages

Figure 2:3.91.4-1: Interaction Diagram

#### 2:3.91.4.1 Request Care Services Updates Request Message

A Request Care Services Updates message is a FHIR history operation,
optionally using the \_since parameter, on the Organization, Location,
Practitioner, PractitionerRole, or HealthcareService Resources.

##### 2:3.91.4.1.1 Trigger Events

A Care Services Update Consumer triggers a Request Care Services Updates
Request to a Care Services Update Supplier according to the business
rules for the query. These business rules are outside the scope of this
transaction.

##### 2:3.91.4.1.2 Message Semantics

A Care Services Update Consumer initiates a history request using HTTP
GET as defined at <http://hl7.org/fhir/R4/http.html#history> on the
Organization, Location, Practitioner, PractitionerRole, or
HealthcareService Resources.

A Care Services Update Supplier and Care Services Update Consumer shall
support the following parameters.

\_since

They shall also support the requirements in ITI TF-2x: Z.6, Populating
the Expected Response Format.

A Care Services Update Supplier shall support receiving a request for
both the JSON and the XML messaging formats as defined in FHIR. A Care
Services Update Consumer shall accept either the JSON or the XML
messaging formats as defined in FHIR.

See ITI TF-2x: Appendix W for informative implementation material for
this transaction.

##### 2:3.91.4.1.3 Expected Actions

The Care Services Update Supplier shall process the query to discover
the resources that match the search parameters given, and gives a
response as per Section 2:3.91.4.2 or an error as per
<http://hl7.org/fhir/R4/search.html#errors>.

#### 2:3.91.4.2 Request Care Services Updates Response Message

The Request Care Services Updates \[ITI-91\] transaction uses the
response semantics as defined at
<http://hl7.org/fhir/R4/http.html#history> as applicable for the
resources.

##### 2:3.91.4.2.1 Trigger Events

The Care Services Update Supplier sends the Request Care Services
Updates Response to the Care Services Update Consumer when results are
ready.

##### 2:3.91.4.2.2 Message Semantics

The Care Services Update Supplier shall support the history response
message as defined at <http://hl7.org.fhir/R4/http.html#history> on the
following Resources:

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
    <https://www.hl7.org/fhir/references-definitions.html#Reference.reference>
    ), unless the referenced resource is not present on a server
    accessible to the client.

###### 2:3.91.4.2.2.1 FHIR Organization Resource Constraints

A Care Services Update Consumer and a Care Services Update Supplier
shall query or return an Organization Resource. The Organization
Resource shall be further constrained as described in Table
3.90.4.2.2.1-1. The Element column in Table 3.90.4.2.2.1-1 references
the object model defined at
<http://hl7.org/fhir/R4/organization.html#resource>.

When the Organization represents a Facility and is paired with a
Location, the FHIR Organization Resource shall be further constrained as
described in Table 3.90.4.2.2.1-2. The Element column in Table
3.90.4.2.2.1-2 references the object model defined at
<http://hl7.org/fhir/R4/organization.html#resource>.

###### 2:3.91.4.2.2.2 FHIR Location Resource Constraints

A Care Services Update Consumer and a Care Services Update Supplier
shall query or return a Location Resource. The Location Resource shall
be further constrained as described in Table 3.90.4.2.2.2-1. The Element
column in Table 3.90.4.2.2.2-1 references the object model defined at
<http://hl7.org/fhir/R4/location.html#resource>.

When the Location represents a Facility and is paired with an
Organization, the FHIR Location Resource shall be further constrained as
described in Table 3.90.4.2.2.2-2. The Element column in Table
3.90.4.2.2.2-2 references the object model defined at
<http://hl7.org/fhir/R4/location.html#resource>.

When supporting the Location Distance Option, the FHIR Location Resource
shall be further constrained as described in Table 3.90.4.2.2.2-3. The
Element column in Table 3.90.4.2.2.2-3 references the object model
defined at <http://hl7.org/fhir/R4/location.html#resource>.

###### 2:3.91.4.2.2.3 FHIR Practitioner Resource Constraints

A Care Services Update Consumer and a Care Services Update Supplier
shall query or return a Practitioner Resource. The Practitioner Resource
shall be further constrained as described in Table 3.90.4.2.2.3-1. The
Element column in Table 3.90.4.2.2.3-1 references the object model
defined at <http://hl7.org/fhir/R4/practitioner.html#resource>.

###### 2:3.91.4.2.2.4 FHIR PractitionerRole Resource Constraints

A Care Services Update Consumer and a Care Services Update Supplier
shall query or return a PractitionerRole Resource. The PractitionerRole
Resource shall be further constrained as described in Table
3.90.4.2.2.4-1. The Element column in Table 3.90.4.2.2.4-1 references
the object model defined at
<http://hl7.org/fhir/R4/practitionerrole.html#resource>.

###### 2:3.91.4.2.2.5 FHIR HealthcareService Resource Constraints

A Care Services Update Consumer and a Care Services Update Supplier
shall query or return a HealthcareService Resource. The
HealthcareService Resource shall be further constrained as described in
Table 3.90.4.2.2.5-1. The Element column in Table 3.90.4.2.2.5-1
references the object model defined at
<http://hl7.org/fhir/R4/healthcareservice.html#resource>.

##### 2:3.91.4.2.3 Expected Actions

The Care Services Update Consumer has received the response and
continues with its workflow.

### 2:3.91.5 Security Considerations

See ITI TF-1: 46.5 for security considerations for the mCSD Profile.

See ITI TF-2x: Appendix Z.8 for common mobile security considerations.

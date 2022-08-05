Profile:      AuditMcsdCareServicesRead
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Read
Id:           IHE.mCSD.Audit.CareServices.Read
Title:        "Audit Event for Find Matching Care Services Transaction by the Care Services Selective Supplier and Care Services Selective Supplier for Read"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Find Matching Care Services Transaction happens
to read a Care Services resource, as recorded by the Care Services Selective Supplier or Care Services Selective Supplier.
"""
* subtype 2..*
* subtype contains iti90 1..1
* subtype[iti90] = urn:ihe:event-type-code#ITI-90 "Find Matching Care Services"
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what 1..1
  * what only Reference(MCSDEndpoint or MCSDHealthcareService or MCSDLocation or MCSDOrganizationAffiliation or MCSDOrganization or MCSDPractitioner or MCSDPractitionerRole)

Profile:      AuditMcsdCareServicesQuery
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Query
Id:           IHE.mCSD.Audit.CareServices.Query
Title:        "Audit Event for Find Matching Care Services Transaction by the Care Services Selective Consumer and Care Services Selective Supplier for Query"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Find Matching Care Services Transaction happens
to query a Care Services Resource, as recorded by the Care Services Selective Supplier or Care Services Selective Consumer.
"""
* subtype 2..*
* subtype contains iti90 1..1
* subtype[iti90] = urn:ihe:event-type-code#ITI-90 "Find Matching Care Services"

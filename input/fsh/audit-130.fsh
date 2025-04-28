Profile:      AuditMcsdCareServicesCreate
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Create
Id:           IHE.mCSD.Audit.CareServices.Create
Title:        "Audit Event for Care Services Feed Transaction by the Directory and Care Services Selective Feed for Create"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Care Services Feed Transaction happens
to create a Care Services resource, as recorded by the Directory or Data Source.
"""
* subtype 2..*
* subtype contains iti130 1..1
* subtype[iti130] = urn:ihe:event-type-code#ITI-130 "Care Services Feed"
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what 1..1
  * what only Reference(MCSDEndpoint or MCSDHealthcareService or MCSDLocation or MCSDOrganizationAffiliation or MCSDOrganization or MCSDPractitioner or MCSDPractitionerRole)

Profile:      AuditMcsdCareServicesUpdate
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Update
Id:           IHE.mCSD.Audit.CareServices.Update
Title:        "Audit Event for Care Services Feed Transaction by the Directory and Care Services Selective Feed for Update"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Care Services Feed Transaction happens
to update a Care Services resource, as recorded by the Directory or Data Source.
"""
* subtype 2..*
* subtype contains iti130 1..1
* subtype[iti130] = urn:ihe:event-type-code#ITI-130 "Care Services Feed"
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what 1..1
  * what only Reference(MCSDEndpoint or MCSDHealthcareService or MCSDLocation or MCSDOrganizationAffiliation or MCSDOrganization or MCSDPractitioner or MCSDPractitionerRole)

Profile:      AuditMcsdCareServicesDelete
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Delete
Id:           IHE.mCSD.Audit.CareServices.Delete
Title:        "Audit Event for Care Services Feed Transaction by the Directory and Care Services Selective Feed for Delete"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Care Services Feed Transaction happens
to delete a Care Services resource, as recorded by the Directory or Data Source.
"""
* subtype 2..*
* subtype contains iti130 1..1
* subtype[iti130] = urn:ihe:event-type-code#ITI-130 "Care Services Feed"
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what 1..1
  * what only Reference(MCSDEndpoint or MCSDHealthcareService or MCSDLocation or MCSDOrganizationAffiliation or MCSDOrganization or MCSDPractitioner or MCSDPractitionerRole)

Profile:      AuditMcsdCareServicesProcess
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Update
Id:           IHE.mCSD.Audit.CareServices.Process
Title:        "Audit Event for Care Services Feed Transaction by the Directory and Care Services Selective Feed for Transaction"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Care Services Feed Transaction happens
to do transaction updates to Care Services resources, as recorded by the Directory or Data Source.
"""
* subtype 2..*
* subtype contains iti130 1..1
* subtype[iti130] = urn:ihe:event-type-code#ITI-130 "Care Services Feed"
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what 1..1
  * what only Reference(Bundle)
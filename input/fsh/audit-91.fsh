Profile:      AuditMcsdCareServicesUpdates
Parent:       AuditEvent
Id:           IHE.mCSD.Audit.CareServices.Updates
Title:        "Audit Event for Request Care Services Updates Transaction by the Care Services Update Consumer and Care Services Update Supplier"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Request Care Services Updates Transaction happens
for a Care Services Resource updates, as recorded by the Care Services Update Supplier or Care Services Update Consumer.
"""
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"

* subtype ^slicing.discriminator.type = #value
* subtype ^slicing.discriminator.path = "$this"
* subtype ^slicing.rules = #open // allow other codes
* subtype 2..
* subtype contains anyHistoryT 1..1 and iti91 1..1
* subtype[anyHistoryT] =  http://hl7.org/fhir/restful-interaction#history-type "history-type" 
* subtype[iti91] = urn:ihe:event-type-code#ITI-91 "Request Care Services Updates"
* action = #E
* recorded 1..1
// failures are recorded differently
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent ^slicing.discriminator.type = #value
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent 2..
* agent contains 
    client 1..1 and 
    server 1..1 and 
    user 0..1
* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110153 "Source Role ID"
* agent[client].who 1..1 // client identifier, May be an Device Resource, but more likely an identifier given the App identified in the OAuth token 
* agent[client].network 1..1 // as known by TCP connection information
* agent[client].media 0..0 
* agent[server].type = http://dicom.nema.org/resources/ontology/DCM#110152 "Destination Role ID"
* agent[server].who 1..1 // server identifier. May be a Device Resource, but likely just an identifier of the domain name
* agent[server].network 1..1 // as known by TCP connection information
* agent[server].media 0..0 
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who 1..1 // May be a Resource, but likely just an identifier from the OAuth token
* agent[user].requestor = true
* agent[user].role MS // if the OAuth token includes any roles, they are recorded here
* agent[user].name MS // might also be in .who.text but here is searchable
* agent[user].media 0..0 // media is physical storage media identification
* agent[user].network 0..0 // users are not network devices
* agent[user].purposeOfUse MS // if the OAuth token includes a PurposeOfUse it is recorded here
* source MS // what agent recorded the event. Likely the client or server but might be an intermediary
* entity ^slicing.discriminator.type = #value
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #open
* entity 1..
* entity contains 
	transaction 0..1 and
    query 1..1
* entity[transaction].type = $BasicAuditEntityType#XrequestId
* entity[transaction].what.identifier.value 1..1
* entity[transaction].what.identifier.value ^short = "the value of X-Request-Id"
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].what 0..0
* entity[query].lifecycle 0..0 
* entity[query].securityLabel ^short = "may contain the security labels on the Bundle search set returned"
* entity[query].description 0..1 // allow the query string to exist in description in non base64Binary format
* entity[query].query 1..1
* entity[query].detail 0..0

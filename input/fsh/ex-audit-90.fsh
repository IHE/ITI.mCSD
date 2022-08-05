Instance:     ex-AuditMcsdCareServicesRead
InstanceOf:   AuditMcsdCareServicesRead
Title:        "Audit example for ITI-90 for Care Services Selective Consumer for read."
Description:  "Audit example for a Care Services Selective Consumer requesting a read on a Care Services resource for ITI-90."
Usage:        #example

* subtype[anyRead] = http://hl7.org/fhir/restful-interaction#read "read"
* subtype[iti90] = urn:ihe:event-type-code#ITI-90 "Find Matching Care Services"
* recorded = 2022-04-13T19:33:45Z
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110153 "Source Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110152 "Destination Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* entity[data]
  * what = Reference(MCSDPractitioner-Example)

Instance:     ex-AuditMcsdCareServicesQuery
InstanceOf:   AuditMcsdCareServicesQuery
Title:        "Audit example for ITI-90 for Care Services Selective Consumer for query."
Description:  "Audit example for a Care Services Selective Consumer requesting a query on a Care Services Resource for ITI-90."
Usage:        #example
* subtype[anySearch] = http://hl7.org/fhir/restful-interaction#search "search"
* subtype[iti90] = urn:ihe:event-type-code#ITI-90 "Find Matching Care Services"
* recorded = 2022-04-13T19:33:45Z
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who = Reference(Device/ex-device)
* agent[client].network.address = "http://server.example.com/fhir"
* agent[client].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who.display = "myMachine.example.org"
* agent[server].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[server].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].query = "UHJhY3RpdGlvbmVyP2xvY2F0aW9uPUxvY2F0aW9uLzEyMw=="

Instance:     ex-device
InstanceOf:   Device
Title:        "Device Example for SVCM"
Description:  """
Device Example for SVCM.
"""
Usage:        #example

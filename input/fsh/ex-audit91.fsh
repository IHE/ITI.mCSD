
Instance:     ex-AuditMcsdCareServicesUpdates
InstanceOf:   AuditMcsdCareServicesUpdates
Title:        "Audit example for ITI-91 for Care Services Update Supplier."
Description:  "Audit example for a Care Services Update Supplier sending updates on a Care Services Resource for ITI-91."
Usage:        #example
* subtype[anyHistoryT] = http://hl7.org/fhir/restful-interaction#history-type "history-type"
* subtype[iti91] = urn:ihe:event-type-code#ITI-91 "Request Care Services Updates"
* recorded = 2022-04-13T19:33:45Z
* source.site = "registry.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who = Reference(Device/ex-device)
* agent[client].network.address = "http://registry.example.com/fhir"
* agent[client].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who.display = "central.example.org"
* agent[server].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[server].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].query = "UHJhY3RpdGlvbmVyL19oaXN0b3J5P19zaW5jZT0yMDIyLTAxLTAx"
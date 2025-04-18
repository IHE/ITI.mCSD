Instance:     ex-AuditMcsdCareServicesCreate
InstanceOf:   AuditMcsdCareServicesCreate
Title:        "Audit example for ITI-130 for Data Source for create."
Description:  "Audit example for a Data Source submitting a create on a Care Services resource for ITI-130."
Usage:        #example

* subtype[anyCreate] = http://hl7.org/fhir/restful-interaction#create "create"
* subtype[iti130] = urn:ihe:event-type-code#ITI-130 "Care Services Feed"
* recorded = 2022-04-13T19:33:45Z
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* entity[data]
  * what = Reference(MCSDPractitioner-Example)

Instance:     ex-AuditMcsdCareServicesUpdate
InstanceOf:   AuditMcsdCareServicesUpdate
Title:        "Audit example for ITI-130 for Data Source for update."
Description:  "Audit example for a Data Source submitting an update on a Care Services resource for ITI-130."
Usage:        #example

* subtype[anyUpdate] = http://hl7.org/fhir/restful-interaction#update "update"
* subtype[iti130] = urn:ihe:event-type-code#ITI-130 "Care Services Feed"
* recorded = 2022-04-13T19:33:45Z
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* entity[data]
  * what = Reference(MCSDPractitioner-Example)

Instance:     ex-AuditMcsdCareServicesDelete
InstanceOf:   AuditMcsdCareServicesDelete
Title:        "Audit example for ITI-130 for Data Source for delete."
Description:  "Audit example for a Data Source submitting a delete on a Care Services resource for ITI-130."
Usage:        #example

* subtype[anyDelete] = http://hl7.org/fhir/restful-interaction#delete "delete"
* subtype[iti130] = urn:ihe:event-type-code#ITI-130 "Care Services Feed"
* recorded = 2022-04-13T19:33:45Z
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#custodian  "Custodian"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110150 "Application"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* entity[data]
  * what = Reference(MCSDPractitioner-Example)

Instance:     ex-AuditMcsdCareServicesProcess
InstanceOf:   AuditMcsdCareServicesProcess
Title:        "Audit example for ITI-130 for Data Source for transaction updates."
Description:  "Audit example for a Data Source submitting a transaction on Care Services resources for ITI-130."
Usage:        #example

* subtype[anyUpdate] = http://hl7.org/fhir/restful-interaction#update "update"
* subtype[iti130] = urn:ihe:event-type-code#ITI-130 "Care Services Feed"
* recorded = 2022-04-13T19:33:45Z
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* entity[data]
  * what = Reference(Example-MCSD)
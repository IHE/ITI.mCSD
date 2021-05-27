## 1:46.1 mCSD Actors, Transactions, and Content Modules

This section defines the actors, transactions, and/or content modules in
this profile. General definitions of actors are given in the Technical
Frameworks General Introduction Appendix A at
<https://www.ihe.net/resources/technical_frameworks/#GenIntro>.

Figure 1:46.1-1 shows the actors directly involved in the mCSD Profile and
the relevant transactions between them. If needed for context, other
actors that may be indirectly involved due to their participation in
other related profiles are shown in dotted lines. Actors which have a
mandatory grouping are shown in conjoined boxes.

Figure 1:46.1-1: mCSD Actor Diagram

Table 1:46.1-1 lists the transactions for each actor directly involved in
the mCSD Profile. To claim compliance with this profile, an actor shall
support all required transactions (labeled “R”) and may support the
optional transactions (labeled “O”).

Table 1:46.1-1: mCSD Profile - Actors and Transactions

|                                  |                                          |                        |             |                 |
| -------------------------------- | ---------------------------------------- | ---------------------- | ----------- | --------------- |
| Actors                           | Transactions                             | Initiator or Responder | Optionality | Reference       |
| Care Services Selective Consumer | Find Matching Care Services \[ITI-90\]   | Initiator              | R           | ITI TF-2c: 3.90 |
| Care Services Selective Supplier | Find Matching Care Services \[ITI-90\]   | Responder              | R           | ITI TF-2c: 3.90 |
| Care Services Update Consumer    | Request Care Services Updates \[ITI-91\] | Initiator              | R           | ITI TF-2c: 3.91 |
| Care Services Update Supplier    | Request Care Services Updates \[ITI-91\] | Responder              | R           | ITI TF-2c: 3.91 |

### 1:46.1.1 Actor Descriptions and Actor Profile Requirements

Most requirements are documented in ITI TF-2: Transactions. This section
documents any additional requirements on mCSD actors.

mCSD supports querying for Organization, Facility, Location,
Practitioner, and Healthcare Service. However, a Care Services Selective
Supplier or Care Service Update Supplier is not required to contain data
on all of these.


## 1:46.5 mCSD Security Considerations

The resources exchanged in this profile may contain information which
pose a privacy risk, or in some cases, a safety risk, to providers and
other personnel, as well as patients. For example, practitioner phone
numbers and home addresses may be conveyed. Implementers should
determine what data will be exposed by the system and what level of
public access there will be if any.

There are many reasonable methods of security for interoperability
transactions which can be implemented without modifying the
characteristics of the transactions in the mCSD Profile. The use of TLS
is encouraged, specifically the use of the ATNA Profile (see ITI TF-1:
9).

User authentication on mobile devices and browsers is typically handled
by more lightweight authentication schemes such as HTTP Authentication,
OAuth 2.0, or OpenID Connect. IHE has a set of profiles for user
authentication including Internet User Authentication (IUA) for
REST-based authentication. The network communication security and user
authentication are layered in the HTTP transport layer.



The Mobile Care Services Discovery (mCSD) Profile supports RESTful
queries across related care services resources.

The loosely coupled design and flexible querying capability of the mCSD
Profile means it can be deployed within a variety of eHealth
architectures and support a wide array of care workflows.

<div markdown="1" class="stu-note">

| [Significant Changes, Open and Closed Issues](issues.html) |
{: .grid}

**[Search This IG](https://www.google.com/search?q=site%3Ahttps%3A%2F%2Fprofiles.ihe.net%2FITI%2FmCSD)**

</div>

### Organization of This Guide

This guide is organized into the following main sections:

1. Volume 1: Profiles
    1. [Introduction](volume-1.html)
    2. [Actors, Transactions, and Content Modules](volume-1.html#1461-mcsd-actors-transactions-and-content-modules)
    3. [Actor Options](volume-1.html#1462-mcsd-actor-options)
    4. [Required Groupings](volume-1.html#1463-mcsd-required-actor-groupings)
    5. [Overview](volume-1.html#1464-mcsd-overview)
    6. [Security Considerations](volume-1.html#1465-mcsd-security-considerations)
    7. [Cross-Profile Considerations](volume-1.html#1466-mcsd-cross-profile-considerations)
    8. [Deployment Considerations](volume-1.html#1467-mcsd-deployment-considerations)
    9. [Endpoint Usage Considerations](volume-1.html#1468-mcsd-endpoint-usage-considerations)
2. Volume 2: Transaction Detail
    1. [Find Matching Care Services \[ITI-90\]](ITI-90.html)
    2. [Request Care Services Updates \[ITI-91\]](ITI-91.html)
    3. [Care Services Feed \[ITI-130\]](ITI-130.html)
3. Other
   1. [Changes to Other IHE Specifications](other.html)
   2. [Download and Analysis](download.html)
   3. [Test Plan](testplan.html)

Click on any of the links above, navigate the contents using the [table of contents](toc.html), or
if you are looking for a specific artifact, check out the [index](artifacts.html).

### Conformance Expectations

IHE uses the normative words: “REQUIRED”, “REQUIRED NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and “OPTIONAL” according to [standards conventions](https://profiles.ihe.net/GeneralIntro/ch-E.html).

#### Required Support

The use of ```RequiredSupport``` in StructureDefinition profiles is equivalent to the IHE use of **R2** as defined in [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir).

RequiredSupport of true - only has a meaning on items that are minimal cardinality of zero (0), and applies only to the source actor populating the data. The source actor SHALL populate the elements marked with RequiredSupport, if the concept is supported by the actor, a value exists, and security and consent rules permit. 
The consuming actors SHOULD handle these elements being populated or being absent/empty. 
Note that sometimes RequiredSupport will appear on elements with a minimal cardinality greater than zero (0), this is due to inheritance from a less constrained profile.

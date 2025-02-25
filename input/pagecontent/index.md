
The Mobile Care Services Discovery (mCSD) Profile supports RESTful
queries across related care services resources.

The loosely coupled design and flexible querying capability of the mCSD
Profile means it can be deployed within a variety of eHealth
architectures and support a wide array of care workflows.

<div markdown="1" class="stu-note">

| [Significant Changes, Open, and Closed Issues](issues.html) |
{: .grid}

**[Search this IG](https://www.google.com/search?q=site%3Ahttps%3A%2F%2Fprofiles.ihe.net%2FITI%2FmCSD)**

</div>

### Organization of This Guide

This guide is organized into the following four main sections:

1. Volume 1: Profiles
    1. [mCSD Introduction](volume-1.html)
    2. [mCSD Actors, Transactions, and Content Modules](volume-1.html#1461-mcsd-actors-transactions-and-content-modules)
    3. [mCSD Actor Options](volume-1.html#1462-mcsd-actor-options)
    4. [mCSD Required Groupings](volume-1.html#1463-mcsd-required-actor-groupings)
    5. [mCSD Overview](volume-1.html#1464-mcsd-overview)
    6. [mCSD Security Considerations](volume-1.html#1465-mcsd-security-considerations)
    7. [mCSD Cross-Profile Considerations](volume-1.html#1466-mcsd-cross-profile-considerations)
    8. [mCSD Deployment Considerations](volume-1.html#1467-mcsd-deployment-considerations)
    9. [mCSD Endpoint Usage Considerations](volume-1.html#1468-mcsd-endpoint-usage-considerations)
2. Volume 2: Transaction Detail
    1. [Find Matching Care Services \[ITI-90\]](ITI-90.html)
    2. [Request Care Services Updates \[ITI-91\]](ITI-91.html)
    3. [Care Services Feed \[ITI-130\]](ITI-130.html)
3. Other
   1. [Test Plan](testplan.html)
   2. [Changes to Other IHE Specifications](other.html)
   3. [Download and Analysis](download.html)

Click on any of the links above, navigate the contents using the [table of contents](toc.html), or
if you are looking for a specific artifact, check out the [index](artifacts.html).

### Conformance Expectations

IHE uses the normative words: Shall, Should, and May according to [standards conventions](https://profiles.ihe.net/GeneralIntro/ch-E.html).

mCSD uses ```Must Support``` in StructureDefinition profiles. This is equivalent to the IHE use of **R2** as defined in [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir).

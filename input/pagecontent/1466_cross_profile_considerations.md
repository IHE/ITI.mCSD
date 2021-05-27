## 1:46.6 mCSD Cross Profile Considerations

### 1:46.6.1 Aggregate Data Exchange – ADX

The IHE QRPH Aggregate Data Exchange (ADX) Profile enables reporting of
public health and service delivery indicators in various locations. A
reporting system may play the role of a Care Services Update Consumer to
ensure that it has an updated list of the resources for the reporting
locations.

Additionally, a service that contains information on practitioners (and
may be a Care Services Selective Supplier or Care Services Update
Supplier) can also be used to generate an ADX message to satisfy the use
case of a district health manager running an aggregate report on
staffing levels by facility and health worker type from the ITI Care
Services Discovery (CSD) Profile.

### 1:46.6.2 Care Services Discovery – CSD

A Care Services Directory in the CSD Profile can be grouped with the
Care Services Update Supplier from mCSD. The CSD Care Services
InfoManager could implement the mCSD Care Services Update Consumer and
the Care Services Selective Supplier Actors. The CSD Service Finder
could implement the mCSD Care Services Selective Consumer. This enables
the CSD actors to allow RESTful transactions without having to change
the underlying data store.

### 1:46.6.3 Health Provider Directory – HPD

A Provider Information Source in HPD can also implement the Care
Services Update Supplier from mCSD. Note that in this case the Provider
Information Source would be queried for updates instead of pushing the
updates to the Consumer. The HPD Provider Information Directory could
implement the mCSD Care Services Update Consumer and the Care Services
Selective Supplier Actors. The HPD Provider Information Consumer could
implement the mCSD Care Services Selective Consumer. This enables the
HPD actors to allow RESTful transactions without having to change the
underlying data store.

### 1:46.6.4 Mobile Alert Communication Management – mACM

The mACM Profile defines the means to send an alert to practitioners.
The mCSD Profile provides a way to query that list of practitioners. A
mACM Alert Reporter can be grouped with a Care Services Update Consumer
or a Care Services Selective Consumer to ensure that it has an updated
list of practitioners.


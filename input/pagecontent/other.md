<div markdown="1" class="stu-note">
This section contains modifications to other IHE publications and profiles, and is not a part of the mCSD profile. The content here will be incorporated into the target narrative at a future time, usually when mCSD goes final-text.
</div>

## IHE Technical Frameworks General Introduction Appendix A – Actor Summary Definitions

|------------------------------------------------|
| Editor, Add the following new or modified actors to the [IHE Technical Frameworks General Introduction Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html): |
{:.grid .bg-info}


| Actor                            | Definition                                                                                                                                                                                                                                                                                |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Care Services Selective Consumer | The Care Services Selective Consumer queries the Care Services Selective Supplier for information about healthcare practitioners, organizations, locations, and services.                                                                                                                 |
| Care Services Selective Supplier | The Care Services Selective Supplier processes received queries from Care Services Selective Consumers and returns information about healthcare practitioners, organizations, locations, and services.                                                                                    |
| Care Services Update Consumer    | The Care Services Update Consumer can query for updates since a previous refresh, to information about healthcare practitioners, organizations, locations, and services from one or more Care Services Update Suppliers.                                                                  |
| Care Services Update Supplier    | The Care Services Update Supplier can provide updates about healthcare practitioners, organizations, locations, and services information in response to a refresh request from a Care Services Update Consumer. The updates include new or modified information since a previous refresh. |
{:.grid .table-striped}


## IHE Technical Frameworks General Introduction Appendix B – Transaction Summary Definitions

|------------------------------------------------|
| Editor, Add the following new or modified transactions to the [IHE Technical Frameworks General Introduction Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html): |
{:.grid .bg-info}


| Transaction                              | Definition                                                                                                                                                                                                                                                                                                                           |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Find Matching Care Services \[ITI-90\]   | The Find Matching Care Services transaction is used to query for practitioners, locations, organizations, and healthcare services resources as well as links between these resources. The Find Matching Care Services transaction is initiated by the Care Services Selective Consumer against the Care Services Selective Supplier. |
| Request Care Services Updates \[ITI-91\] | The Request Care Services Updates is used to obtain practitioners, locations, organizations, and healthcare services resources that have been inserted or updated since the specified timestamp. The Request Care Services Updates is initiated by the Care Services Update Consumer against the Care Services Update Supplier.      |
{:.grid .table-striped}

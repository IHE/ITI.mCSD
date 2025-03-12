<div markdown="1" class="stu-note">
This section contains modifications to other IHE publications and profiles and is not a part of the mCSD Profile. The content here will be incorporated into the target narrative at a future time, usually when mCSD goes final text.
</div>

## IHE Technical Frameworks General Introduction Appendix A: Actors

|------------------------------------------------|
| Editor, add the following new or modified actors to the [IHE Technical Frameworks General Introduction Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html): |
{:.grid .bg-info}


| Actor                            | Definition                                                                                                                                                                                                                                                                                |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Query Client                     | Consumes information about care services resources.                                                                              |
| Directory                        | Supplies information about care services resources.                                                                              |
| Update Client                    | Consumes the history of care services information.                                                                                |
| Data Source                      | Supplies the individual updates of care services resources.                                                                                |
{:.grid .table-striped}


## IHE Technical Frameworks General Introduction Appendix B: Transactions

|------------------------------------------------|
| Editor, add the following new or modified transactions to the [IHE Technical Frameworks General Introduction Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html): |
{:.grid .bg-info}


| Transaction                              | Definition                                                                                                                                                                                                                                                                                                                           |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Find Matching Care Services \[ITI-90\]   | The Find Matching Care Services transaction is used to query for practitioners, locations, organizations, and healthcare services resources as well as links between these resources. The Find Matching Care Services transaction is initiated by the Query Client against the Directory. |
| Request Care Services Updates \[ITI-91\] | The Request Care Services Updates is used to obtain practitioners, locations, organizations, and healthcare services resources that have been inserted or updated since the specified timestamp. The Request Care Services Updates is initiated by the Update Client against the Directory.      |
| Care Services Feed \[ITI-130\] | The Care Services Feed is used to update care services resources by create, update, delete, or a batch or transaction of these. The Care Services Feed is initiated by the Data Source against the Directory.      |
{:.grid .table-striped}

# ITI.mCSD

Advanced work on converting mCSD to an IG build. This is NOT normative or approved work and is still a work in progress.

Currently conformance resources have been created, but no text has been migrated.

Mobile Care Services Discovery
* https://profiles.ihe.net/ITI/mCSD
* historic https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_mCSD.pdf

* continuous build https://build.fhir.org/ig/IHE/ITI.mCSD/branches/main/


## Notes for changes as part of migration
* Add Facilities and Jurisdictions to Concepts - Done as part of CP 1236
* Clarify that facilities and jurisdictions are a combination of 
Organization and Location under the Organization constraint tables with 
link to Concepts. - Done as part of CP 1236
* Remove meta.profile constraints in tables as this is duplicative. - Done and added to Changes
* Remove references to TF-2a/b/c/x - done 
* Make sure canonical URLs are set correctly (specifically update extension definition and reference in ITI-90) - done

### Pending Questions
* Should Table references in text be links to the table if it is close?

### Add Feed Notes
* Adding single transaction with messages for:
  * create
  * update (and create with ID)
  * delete
  * batch/transaction (Message name: \[Process/Bundle/Bulk\] Care Services Resources?)
* Alternatively, could have a single batch/transaction message that allows for create/update/delete in the Bundle.

#### Add Feed Questions
* Should there be a batch/transaction message to support multiple updates in one request?
  * Should this instead be the only message?
* What should the new version be?
* Should this require or support conditional create/update?
* What should the optionality be on the new transaction?  Currently a new option is being added to support it.
* Should this use new actors or reuse the update actors?

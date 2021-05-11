# ITI.mCSD

Advanced work on converting mCSD to an IG build. This is NOT normative or approved work and is still a work in progress.

Currently conformance resources have been created, but no text has been migrated.

Mobile Care Services Discovery
* https://profiles.ihe.net/ITI/
* https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_mCSD.pdf

* continuous build http://ihe.github.io/ITI.mCSD/


## Notes for changes as part of migration
* Add Facilities and Jurisdictions to Concepts
* Clarify that facilities and jurisdictions are a combination of 
Organization and Location under the Organization constraint tables with 
link to Concepts.
* Remove meta.profile constraints in tables as this is duplicative.



# Azure Repos to GitHub with out PRs - simple way

* Get Azure repo credentials​.

* Create new Repo in GitHub​:
  * Choose "Import repository":​

* Provide the link from Azure​:

* Copy the link from Azure to GitHub.

* Choose Org and name your repository​.

* Provide the credentials that were generate in Azure.

* Start the import.

* If there were brances with differences in history GitHub shows them and offers to create pull requests.

* What will be moved ?
  - Commit History 
  - Tags
  - Branches
* What will not be moved ?
  - Pull Requests
  - Branch polices
  - Users mapping between AD and your GitHub handle
  - Comments



# What about other ways: 
* Scripting 
  - For authentication use PAT
* Using an existing scripted tool.



* We have built a tool that is able to migrate: 
  - Pull request 
  - User mappings 
  - Comments 
  -  Pull request reviwers

* Using similar capabilities the "GitHub Importer". ​

* GitHub has an excellent API documentation.​

### Github migration API documentation:
* https://developer.github.com/v3/migrations/
*  https://developer.github.com/v3/migrations/source_imports/#start-an-import
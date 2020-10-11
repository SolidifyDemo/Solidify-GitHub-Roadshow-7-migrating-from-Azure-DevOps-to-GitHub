# Notes

## Team Foundation version control (TFVC) to GtHub
Many companies and teams still youse legacy version control today.
I am going to show you ways to migrate from each and what to think about and what tools there is

With all alternatives below consider taking just the main/master branch with you

* Tip migration = get latest only
  * Easy and fast but no history
  * Add a .gitignore to get rid of binaries and other unwanted files: https://gitignore.io/
  * Push to GitHub
* Import when creating a new repo in GitHub
  * Easy and fast with history
  * Code is not cleaned up
* Migrate with history
  * Demo project in TFVC with packages folder: https://dev.azure.com/solidifydemo/Azure%20DevOps-GitHub%20Demo
  * Create repo in GitHub
  * Use TFS to Git tool https://github.com/git-tfs/git-tfs
  * git tfs clone https://dev.azure.com/solidifydemo "$/Azure DevOps-GitHub Demo/Main"
  * Add Gitignore: https://gitignore.io/
  * git add * 
  * git commit -m "Added gitignore"
  * Use Git filter repo to se whats there and clean up code: https://github.com/newren/git-filter-repo
  * git filter-repo –-analyze
  * Check .git\filter-repo\analysis folder path-all-sizes.txt
  * git filter-repo --path "packages" --invert-paths
  * git filter-repo –-analyze
  * Push to Git
  * git remote add origin https://github.com/SolidifyDemo/Demo-TFVC-Import.git
  * Git push --all origin

##  Source Safe to GitHub 
* Tip migration = get latest only
  * Easy and fast but now history
  * Add a .gitignore to get rid of binaries and other unwanted files: https://gitignore.io/
  * Push to GitHub
* Microsoft VSS to TFVC tool
  * VSS to TFS ugrade tool https://marketplace.visualstudio.com/items?itemName=EdH-MSFT.VisualSourceSafeUpgradeToolforTeamFoundationServer
  * When in TFVC as above
* VSS to Git tool
  * VSS to Git: https://github.com/trevorr/vss2git
  * Add a .gitignore: https://gitignore.io/
  * Use Git filter repo to se whats there and clean up code: https://github.com/newren/git-filter-repo

## Moving Azure Pipelines YAML to GitHub YAML
Have a DotNet build in Azure Pipelines, create the same thing manually in GitHub, comare the YAML

* YAML is similar but not exactly the same
* No migration tool
* Moving is manual


## Azure Artifacts to GitHub packages
* Azure Artifacts and GitHub packages have similar feature parity
  * No Universal packages in GitHub so far
  * If you use GitHub for code and build you should store packages in GitHub
* Migration
  * Start from scratch
  * Migrate with API


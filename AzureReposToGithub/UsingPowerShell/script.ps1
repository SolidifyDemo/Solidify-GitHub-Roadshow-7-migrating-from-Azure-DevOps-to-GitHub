Param(
    [Parameter( Mandatory = $true)]
    $ConfigPath 
    )



$config = (Get-Content $ConfigPath | Out-String | ConvertFrom-Json)

write-host 'Cloning Source Repo...'

if ( -not (Test-Path -LiteralPath '/migration' -PathType Container) )
{
    Set-Location /

    mkdir migration
}

Set-Location migration


foreach ($migrateRepo in $($config.ReposToMigrate))
{

    write-host "Start Migration"

    $migrationFolder = "$($migrateRepo.AzDoRepo)-Migration"
    
    #write-host $migrationFolder

    mkdir $migrationFolder

    Set-Location $migrationFolder

    $cloneUrl = "https://$($config.AzDoPAT)@dev.azure.com/$($migrateRepo.AzDoOrg)/$($migrateRepo.AzDoPrj)/_git/$($migrateRepo.AzDoRepo)"

    Write-Host 'Clone from $cloneUrl'

    git clone --mirror $cloneUrl .

    # STEP 2: Add a "new repo" as a new remote origin:

    Write-Host 'Create new repo'
    
    gh repo create $($migrateRepo.GHRepo)

    write-host 'Adding Target Repo as Origin'

    $GHoriginUrl = "https://github.com/$($migrateRepo.GHUser)/$($migrateRepo.GHRepo).git"
    
    Write-Host 'Origin url $GHoriginUrl'

    git remote add GHorigin $GHoriginUrl

    # STEP 3: Push everything to the new repo.

    Write-host 'Pushing all code, branches, tags, and history to Target Repo...'

    $GHpushUrl = "https://$($config.GHPAT)@github.com/$($migrateRepo.GHUser)/$($migrateRepo.GHRepo).git"
     
    Write-Host 'Push url $GHpushUrl'

    git push --mirror $GHpushUrl

    # STEP 4. Clean up. Remove "old repo" origin and its dependencies, and rename new origin

    Write-Host 'Cleaning up...'

    git remote -v

    git remote rm origin

    git remote rename GHorigin origin

    Set-Location ../

    write-host "Repository migrated!"
}

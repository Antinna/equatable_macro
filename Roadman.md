i have two branches for my one single dart package which i wish to publish at pub.dev for that i have created a github repository having two branches in total one have a name "main" and other is with name "stable"  . here i have "main" branch where i wish to publish or say want to upload my prerelease version of dart package having version like "version: 0.0.1-main.1" , and for stable release i have version "version: 0.0.1" and both have their different branch names as mentioned 

<!-- Stable-release Version: -->
<!-- README-stable.md -->
<!-- and -->
<!-- Pre-release Version: -->
<!-- README-main.md -->

## logic

<!-- do not modify the version number of any of package in branch , while publishing cd.yml will bump it and then publish, warn all those who want to submit pull request -->

- every commit to => changelog with ci with cliff.toml file with action orhun/git-cliff-action@main
- template for clii.toml file
- template for commit message => like chore ...
- in main branch ci cd yaml file add a logic so that we can get the actor of pull request or say commit and can get the branch where the pull request is recieved
- i have my default repo vranch as master , and whenever i wish to publish a new release of stable or main (preview) package i will run workflow accordingly and that will change the respected readme file name to README.md and 
- after renaming bump the version number as per branch if branch is stable then bump the last digit like 0.0.1 => 0.0.2 and if main then do the same but 0.0.1-main.1 => 0.0.2-main.1


## Done
- each commit to latest version of CHANGELOG md file



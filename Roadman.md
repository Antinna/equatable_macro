i have two branches for my one single dart package which i wish to publish at pub.dev for that i have created a github repository having two branches in total one have a name "main" and other is with name "stable"  . here i have "main" branch where i wish to publish or say want to upload my prerelease version of dart package having version like "version: 0.0.1-main.1" , and for stable release i have version "version: 0.0.1" and both have their different branch names as mentioned 

## logic

<!-- do not modify the version number of any of package in branch , while ppublishing cd.yml will bump it and then publish, warn all those who want to submit pull request -->

- every commit to => changelog with ci wirh cliff.toml file with action orhun/git-cliff-action@main
- template for clii.toml file
- template for commit message => like chore ...
- in main branch ci cd yaml file add a logic so that we can get the actor of pull request or say commit and can get the branch where the pull request is recieved





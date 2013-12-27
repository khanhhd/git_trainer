#How to start with Git ?
## Be a part of project.
You must clone project repository(repo) into your repo by click "Fork" button in project repo.<br/>
Using Terminal to clone (download) project to local

```sh
$ git clone https://github.com/<your-github-account>/git_trainer.git
```
Fetch and pull code from develop branch

```sh
$ cd git_trainer
$ git remote add framgia https://github.com/khanhhd/git_trainer.git
$ git fetch framgia
$ git checkout framgia/develop
$ git checkout -b develop
```
now, `$ git remote -v`, you will see 2 remote like this:

```sh
framgia https://github.com/khanhhd/git_trainer.git (fetch)
framgia https://github.com/khanhhd/git_trainer.git (push)
origin  https://github.com/<your-github-account>/git_trainer.git (fetch)
origin  https://github.com/<your-github-account>/git_trainer.git (push)
```


You will have 2 remote. 1(origin) is to pull/push from/to your repo, 2 is to pull from project(framgia)
repo (to get newest code).
Using command `$ git remote -v` to see current remote. There is only origin remote(origin is often 
use for naming your repo, you can set another name).


## Pull request
When you are assigned a task from redmine or something, you do it and you send pull request to reviewer to merge your code.
There are somethings you must do.<br/>
 Get newest code from develop branch of project repo.

```sh
$ git checkout develop
$ git pull framgia develop
```
 Checkout and switch new branch from develop branch

```sh
$ git checkout -b taskID
```
 When you've done coding, requirement matched correctly, you will push to your taskID branch

```sh
$ git add .
$ git commit -m "refs #TaskID Name of task"
$ git push origin taskID
```
 Go to your github's project repo. And send pull request to framgia/develop<br/>
 And you send the URL of pull-request to reviewers to review it.

## Reviewing a pull-request
When reviewers review a pull-request, there are 3 cases will be happened
### 1. Merge in "first touch"
It means your code is acceptable and it will be merged to develop(branch) of project.
### 2. Have comments
When your code must be modify somewhere, follow by reviews' comments.<br/>
Go to your editor, and modify code as all comments of reviewrs. <br/>
After that, you will commit again, but meld to previous commit.

```sh
$ git add .
$ git commit --amend                  (save and close new opend file to edit.)
$ git push origin taskID -f           (force new code to existed branch)
```
And you should notice reviews to review again. If OK -> will merge. If has any comments -> Do this part again.
### 3. Conflicts
Your pushed code has conflict with develop branch of project, so it can not be merged automatically.<br/>
In this case, you should do..<br/>
1. Get newest code from framgia/develop to your develop branch

```sh
$ git checkout develop
$ git pull framgia develop
```
2. Checkout to current task and rebase with develop branch

```sh
$ git checkout taskID
$ git rebase develop
```
Because of conflicts, so you should contact to member who modified conflict files. And then remove conflicts. <br/>
After resolving all conflicts.

```sh
$ git add . 
$ git rebase --continue
$ git push origin taskID -f
```

And you notice for reviewers to check your pull-request is can be merged or not.<br/>
When your pull-request has been merged. Go to redmine and change status of task to Resolved.<br/>
This is called a cycle of pull-request.

## Faster commit
There are 2 ways to avoid enter username/password when pull/push to github.
### 1. Generate SSH key
Please read [*generating ssh key*](https://help.github.com/articles/generating-ssh-keys) tutorials
### 2. Generate .netrc
This file provide username/password to github server.<br/>
Step 1: Create a file `.netrc`<br/>
Step 2: Filling file with your username/password and machine

```sh
machine github.com
  login username
  password password
```



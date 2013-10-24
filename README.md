#How to start with Git ?
## Be a part of project.
You must clone project repository(repo) into your repo by click "Fork" button in project repo.<br/>
Using Terminal to clone (download) project to local

```sh
$ git clone https://github.com/khanhhd/git_trainer.git
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
origin  https://github.com/kienbt01359/git_trainer.git (fetch)
origin  https://github.com/kienbt01359/git_trainer.git (push)
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
 If your code is OK, reviewers will merge, if not, they will adding some comments, and you must fix it again.
And then you will push it again.

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



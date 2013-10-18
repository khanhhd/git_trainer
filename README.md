#How to start with Git ?
## Be a part of project.
1. You must clone project repository(repo) into your repo by click "Fork" button
in project repo.
2. Using Terminal to clone (download) project to local

```sh
$ git clone https://github.com/khanhhd/git_trainer.git
```
3. Fetch and pull code from develop branch

```sh
$ cd git_trainer
$ git fetch
$ git pull origin
$ git checkout -b develop framgia/develop
```
## Controlling remote.
1. You must have 2 remote, 1 is to pull/push from/to your repo, 2 is to pull from project
repo (to get newest code).
Using command `$ git remote -v` to see current remote. There is only origin remote(origin is often 
use for naming your repo, you can set another name).
2. Adding remote for project repo (to get newest code)

```sh
$ git remote add framgia https://github.com/khanhhd/git_trainer.git
```

now, `$ git remote -v`, you will see 2 remote like this:

```sh
framgia https://github.com/khanhhd/git_trainer.git (fetch)
framgia https://github.com/khanhhd/git_trainer.git (push)
origin  https://github.com/kienbt01359/git_trainer.git (fetch)
origin  https://github.com/kienbt01359/git_trainer.git (push)
```

## Pull request
When you are assigned a task from redmine or something, you do it and you send pull request to reviewer to merge your code.
There are somethings you must do.
### 1. Get newest code from develop branch of project repo.

```sh
$ git checkout develop
$ git pull framgia develop
```
### 2. Checkout and switch new branch from develop branch

```sh
$ git checkout -b taskID
```
### 3. When you've done coding, requirement matched correctly, you will push to your taskID branch

```sh
$ git add .
$ git commit -m "Name of task"
$ git push origin taskID
```
### 4. Go to your github's project repo. And send pull request to framgia/develop
### 5. If your code is OK, reviewers will merge, if not, they will adding some comments, and you must fix it again.
And then you will push it again.

This is called a cycle of pull-request.


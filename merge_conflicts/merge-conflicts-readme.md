# Merge conflicts

1. Setup a graphical tool so we don't have to go nuts
2. Actually practice resolving them

## Setup a tool to make our lives easier

Merge conflicts aren't fun. Here is how to setup a graphical tool so they become much easier to resolve.

### OSX
Follow the instructions [here](http://twobitlabs.com/2011/08/install-diffmerge-git-mac-os-x/)

### Linux

1. install "meld" (sudo apt-get meld, most likely) 2. Type this: `git config --global merge.tool meld`

### Everyone
The key documentation git-wise is for "mergetool":
http://git-scm.com/docs/git-mergetool.html

## When?
When you see a merge conflict, just type "git mergetool".

## Caveats:
Our class repo workflow is a little more involved, so call us for help if you run into an issue.

---

# The merge conflict work

Here are four sample merge conflicts.

Download the `merge_conflicts.tgz` file and move it somewhere sane (for instance, `~/src/workbench`). Everything in that archive is a git repository, so DO NOT PUT THIS IN THE CLASS REPO.
It extracts stuff into a subdirectory (which means that if you moved the file to `~/src/workbench/merge_conflicts.tgz`, it will create a directory `~/src/workbench/merge_conflicts`). Once that's done, type the following:

**NOTE that the $ at the beginning of the line means "run this as a normal user" instead of "run as root". If the line started with #, that would mean "run as root".**

```
$ cd ~/src/workbench
$ tar -xzf merge_conflicts.tgz
$ cd merge_conflicts
$ for i in `ls` ; do tar -xzf $i ; done
```

(why yes, BASH has for loops)

## What happened

There are two branches:
* the `master` branch
* the `bugfix` branch

Someone created the `bugfix` branch to fix a bug. While that happened, someone else wrote more code on `master`. Another way of saying it is that the master branch has moved forward while the bug got fixed.

## What to do

Assume `master` is right. This means the code on `master` is the correct code, and the `bugfix` code is just there to fix a bug. When in doubt, you should defer to the code that exists on the `master` branch.

Once again - where code differs significantly, `master` has the correct features.

Try to merge in the bug fix without destroying the changes that master made. It may mean maintain the code from master AND make sure the bug is fixed.

The good thing is, if you screw up, you can just delete the directory and untar it again (tar -x is tar --extract, aka untar).

## How to do it

For each of them:

1. cd into the directory
2. make sure you're on the master branch
3. git merge bugfix
4. Fix merge conflicts

Hints:

1. git log is your friend.
2. No really, git log is your friend. Or whatever alias you have set up, like if you've stolen my "git lg".


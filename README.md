# Description
A Skeleton tvOS App which can be used as a great skeleton for new Xcode tvOS
projects. Features include Changelogs, `swiftlint` and `swiftformat`.

`swiftlint` will automatically lint your xcode project as builds occur.

`swiftformat` will take take place automatically on commit of staged  swift
files but may also be run on all files via the script `./swiftformat-all.sh`.

# Requirements
- Xcode 14.0.
- Swift 5.7
- Python 2.7 / 3

# Use
1. After cloning the repo the script `./on-repo-init.sh` should be run at least
   one time so that tools like `swiftformat` can be installed and proper
   auto-running of `swiftformat` can occur on committing of staged files.

2. `./project-rename.sh` should be run to facilitate in the renaming of this
   Skeleton project to a name of your choosing. Just note that spaces are not
   allowed in project names as of the moment.

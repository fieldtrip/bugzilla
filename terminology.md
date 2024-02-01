---
title: Terminology
---

Back to [main page](/).

This page describes the various fields that you see on a bug.

The documentation here corresponds to version 4.4.1 which was the last version we used. You can find the complete documentation on the [bugzilla website](https://www.bugzilla.org/docs/).

## Status

The Status field indicates the current state of a bug. Only certain status transitions are allowed.

### UNCONFIRMED

This bug has recently been added to the database. Nobody has confirmed that this bug is valid. Users who have the "canconfirm" permission set may confirm this bug, changing its state to CONFIRMED. Or, it may be directly resolved and marked RESOLVED.

### CONFIRMED

This bug is valid and has recently been filed. Bugs in this state become IN_PROGRESS when somebody is working on them, or become resolved and marked RESOLVED.

### IN_PROGRESS

This bug is not yet resolved, but is assigned to the proper person who is working on the bug. From here, bugs can be given to another person and become CONFIRMED, or resolved and become RESOLVED.

### RESOLVED

A resolution has been performed, and it is awaiting verification by QA. From here bugs are either reopened and given some open status, or are verified by QA and marked VERIFIED.

### VERIFIED

QA has looked at the bug and the resolution and agrees that the appropriate resolution has been taken. This is the final status for bugs.

## Resolution

The Resolution field indicates what happened to this bug.

Bugs that have the status UNCONFIRMED, CONFIRMED or IN_PROGRESS do not have a resolution yet.

Bugs that have the status RESOLVED or VERIFIED have one of the following resolutions.

### FIXED

A fix for this bug is checked into the tree and tested.

### INVALID

The problem described is not a bug.

### WONTFIX

The problem described is a bug which will never be fixed.

### DUPLICATE

The problem is a duplicate of an existing bug. When a bug is marked as a DUPLICATE, you will see which bug it is a duplicate of, next to the resolution.

### WORKSFORME

All attempts at reproducing this bug were futile, and reading the code produces no clues as to why the described behavior would occur. If more information appears later, the bug can be reopened.

## Other Fields

### %Complete

How close to 100% done this bug is, by comparing its Hours Worked to its Orig. Est..

### Alias

A short, unique name assigned to a bug in order to assist with looking it up and referring to it in other places in Bugzilla.

### Assignee

The person in charge of resolving the bug.

### Blocks

This bug must be resolved before the bugs listed in this field can be resolved.

### Bug ID

The numeric id of a bug, unique within this entire installation of Bugzilla.

### CC

Users who may not have a direct role to play on this bug, but who are interested in its progress.

### Changed

When this bug was last updated.

### Classification

Bugs are categorised into Classifications, Products and Components. classifications is the top-level categorisation.

### Comment

Bugs have comments added to them by Bugzilla users. You can search for some text in those comments.

### Component

Components are second-level categories; each belongs to a particular Product. Select a Product to narrow down this list.

### Content

This is a field available in searches that does a Google-like 'full-text' search on the Summary and Comment fields.

### Creation date

When the bug was filed.

### Deadline

The date that this bug must be resolved by, entered in YYYY-MM-DD format.

### Depends on

The bugs listed here must be resolved before this bug can be resolved.

### Hardware

The hardware platform the bug was observed on. Note: When searching, selecting the option "All" only finds bugs whose value for this field is literally the word "All".

### Hours Left

The number of hours of work left on this bug, calculated by subtracting the Hours Worked from the Orig. Est..

### Hours Worked

The total amount of time spent on this bug so far.

### Importance

The importance of a bug is described as the combination of its Priority and Severity.

### Keywords

You can add keywords from a defined list to bugs, in order to easily identify and group them.

### Orig. Est.

The amount of time that has been estimated it will take to resolve this bug.

### OS

The operating system the bug was observed on. Note: When searching, selecting the option "All" only finds bugs whose value for this field is literally the word "All".

### Priority

Engineers prioritize their bugs using this field.

### Product

Bugs are categorised into Products and Components.

### QA Contact

The person responsible for confirming this bug if it is unconfirmed, and for verifying the fix once the bug has been resolved.

### Reporter

The person who filed this bug.

### See Also

This allows you to refer to bugs in other installations. You can enter a URL to a bug in the 'Add Bug URLs' field to note that that bug is related to this one. You can enter multiple URLs at once by separating them with a comma.
You should normally use this field to refer to bugs in other installations. For bugs in this installation, it is better to use the Depends on and Blocks fields.

### Severity

How severe the bug is, or whether it's an enhancement.

### Summary

The bug summary is a short sentence which succinctly describes what the bug is about.

### Tags

Unlike Keywords which are global and visible by all users, Tags are personal and can only be viewed and edited by their author. Editing them won't send any notification to other users. Use them to tag and keep track of bugs.

### URL

Bugs can have a URL associated with them - for example, a pointer to a web site where the problem is seen.

### Version

The version field defines the version of the software the bug was found in.

### Votes

Some bugs can be voted for, and you can limit your search to bugs with more than a certain number of votes.

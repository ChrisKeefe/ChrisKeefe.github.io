---
title: "Checking Git tag SHAs"
categories:
  - dev
  - TIL
tags:
  - Git
  - tricks-or-tweaks
  - CI/CD
  - Github Actions
---

Recently, while troubleshooting a CI workflow build with Github Actions,
I've been learning about Git tags.
At their simplest, [tags](https://git-scm.com/book/en/v2/Git-Basics-Tagging)
are references to specific points in your development history.
Today, I'll talk about how to check tag SHAs,
allowing you to confirm your tags really are what they say they are under the hood.

This [workflow](https://github.com/ChrisKeefe/q2-diversity-lib/blob/6357399c95a2fdd0dd9d9d95ba88f3b366fe8082/.github/workflows/lint-build-test.yml#L38)
grabs the most recent version tag and uses it to specify which plugin version we want for the build.
Then, it lints, builds, and tests [QIIME2](https://qiime2.org/) appropriately.

### The issue

PRs against the canonical repo built properly,
but a PR against a fork branch failed to build,
because it was grabbing plugins with an old/mismatched version tag.
The tags on both forks *looked* identical by name,
but I figured it was worth digging deeper.

### TIL

You can get tag SHAs on your local machine with

`git show-ref --tags`

![tag SHAs on my local computer]({{ site.image-dir }}/{{ page.slug }}/shas_1.png)

You can get tag SHAs on a remote with

`git ls-remote --tags`

![identically-named tags on my remote with different SHAs]({{ site.image-dir }}/{{ page.slug }}/shas_2.png)

**Notice: despite identical names, the SHAs on these two tags are not the same.**
**Something is different under the hood.**

You can delete a git tag on a remote with

`git push --delete <remote-name> <tag-name>`

I did that, and then pushed up the clean local tag with 

`git push <remote-name> <tag-name>:<the-same-tag-name>`

As expected, the tag on the remote was malformed in some way.
Comparing the SHAs allowed me to spot the difference,
fetch the working tag from the canonical repo,
and replace the bad tag with the one I knew was working.


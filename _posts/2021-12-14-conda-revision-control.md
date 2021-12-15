---
title: "Conda revision control tools"
categories:
  - dev
  - TIL
tags:
  - conda
  - environment management
  - version control
---

Today I learned that conda keeps track of its own revision history,
and allows you to "install" to a specific point in that history.

`conda list --revisions` will get you the history.

`conda install --revision <rev #>` will return your env to that state.
This "return" is similar to Git's `revert` or `reflog`,
in that it is an additive change to the env history,
and no information is lost.

As [Robin Wilson writes](https://blog.rtwilson.com/conda-revisions-letting-you-rollback-to-a-previous-version-of-your-environment/),
the history is stored as a plaintext file,
and includes the command history that created the current state.
(For environments built with the `--clone` flag,
cloned-environment revision history is not tracked.
The command record begins with the `create --clone`,
so doing anything programmatic with this could be pretty fragile.)

Adding this to your `.bash_aliases` gives you quick reporting on your active environment's history.
It will fail if no conda environment is active.

`alias conhist="cat \${CONDA_PREFIX}/conda-meta/history | grep '# cmd' | cut -d' ' -f3-"`

Note: Only conda commands apear to be tracked, so exercise discretion if your install process relies on pip.

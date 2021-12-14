---
title: "Conda-installed packages not importable under test"
categories:
  - dev
  - TIL
tags:
  - eww
  - conda
  - environment management
  - pytest
---

Friday, I discovered I was no longer able to test my provenance parsing code.
This wasn't entirely unexpected - 
in an effort to get my head around the `rpy2` package for a side project,
I'd been mucking around pretty agressively with conda environments.
As a result,
all of the packages I needed to install and test `provenance_lib` were shown in `conda list`,
but `networkx` and `yaml` were unavailable when I ran `pytest`.

By checking which version of Python was available to different conda environments\*,
I figured out that the python in the traceback lined up with the python version
used by my base environment, not my subject environment.
I must have accidentally installed `pytest` in my base env somewhere along the line.
Because of this, it wasn't installed in the subject environments (`requirement already satisfied`).
Acting as the the test runner, I suspect it grabbed *its local python version*,
which didn't know anything about the site packages in my subject env.
Removing `pytest` from `base` and reinstalling per subject env solved the problem,
and left things feeling much cleaner.

\* You can check on this with `which python`, or by starting a `python` session,
importing `sys`, and checking [`sys.executable`](https://docs.python.org/3/library/sys.html#sys.executable).
This latter approach can be useful for troubleshooting,
because it's possible to get different `sys.executable` values from different programs.
If it's installed in `base`, for example,
IPython may be running a different Python than the "raw" `python` in your current conda environment.
I suspect it's possible to get different results from different systems as well.
Homebrew, [for example](https://stackoverflow.com/a/53190037/9872253),
used to mishandle things like this.
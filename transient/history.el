((magit-blame
  ("-w"))
 (magit-branch nil)
 (magit-cherry-pick
  ("--ff"))
 (magit-commit nil)
 (magit-diff
  ("--no-ext-diff" "--stat")
  (("--" "main/src/public.c"))
  (\.\.\.)
  ("--no-ext-diff"))
 (magit-dispatch nil)
 (magit-fetch nil)
 (magit-file-dispatch nil)
 (magit-log
  ("-n256" "--graph" "--decorate")
  (("--" "main/inc/public.h"))
  (("--" "main/src/public.c"))
  (\.\.\.))
 (magit-merge nil)
 (magit-patch nil)
 (magit-patch-apply nil)
 (magit-patch-create nil)
 (magit-pull nil)
 (magit-push nil)
 (magit-stash nil)
 (magit-status-jump nil)
 (magit-submodule
  ("--force")
  nil)
 (magit-svn nil)
 (magit-tag nil))

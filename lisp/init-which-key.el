(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode)

  (which-key-setup-side-window-bottom)
  (which-key-setup-minibuffer)

  ;; Set the prefix string that will be inserted in front of prefix commands
  ;; (i.e., commands that represent a sub-map).
  (setq which-key-prefix-prefix "+" )

  (which-key-add-key-based-replacements
    "SPC b" "buffers")

  (which-key-add-key-based-replacements
    "SPC c" "compile")

  (which-key-add-key-based-replacements
    "SPC f" "files")

  (which-key-add-key-based-replacements
    "SPC g" "git")

  (which-key-add-key-based-replacements
    "SPC p" "project")

  (which-key-add-key-based-replacements
    "SPC w" "window")

  (which-key-add-key-based-replacements
    "SPC x" "delete")

  (which-key-add-key-based-replacements
    ", e" "errors/eval")

  (which-key-add-key-based-replacements
    ", f" "function")

  (which-key-add-key-based-replacements
    ", g" "goto")

  (which-key-add-key-based-replacements
    ", h" "help")

  (which-key-add-key-based-replacements
    ", j" "jump")

  (which-key-add-key-based-replacements
    ", s" "search/shell/sudo")

  )

(provide 'init-which-key)

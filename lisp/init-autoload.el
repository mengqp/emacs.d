;;; init-autoload.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(autoload 'org-capture "org-capture" "" t)
(autoload 'org-agenda "org-agenda" "" t)
(autoload 'org-journal-new-entry "org-journal" "" t)
(autoload 'org-promote "org" "" t)
(autoload 'cfw:open-org-calendar "calfw" "" t)
(autoload 'org-mobile-push "org-mobile" "" t)
(autoload 'org-mobile-pull "org-mobile" "" t)
(autoload 'find-function "find-func" "" t)
(autoload 'find-variable "find-func" "" t)
(autoload 'counsel-M-x "counsel" "" t)
(autoload 'swiper "swiper" "" t)
(autoload 'counsel-grep-or-swiper "counsel" "" t)
(autoload 'awesome-fast-switch/body "init-ui" "" t)
(autoload 'imenu "imenu" "" t)
(autoload 'goto-last-change "goto-chg" "" t)
(autoload 'mc/mark-next-like-this "mc-mark-more" "" t)
(autoload 'mc/mark-previous-like-this "mc-mark-more" "" t)
(autoload 'mc/mark-all-like-this "mc-mark-more" "" t)
(autoload 'er/expand-region "expand-region" "" t)
(autoload 'format-all-buffer "format-all" "" t)
(autoload 'lazy-search "lazy-search" "" t)
(autoload 'symbol-overlay-put "symbol-overlay" "" t)
(autoload 'symbol-overlay-remove-all "symbol-overlay" "" t)
(autoload 'undo-fu-only-undo "undo-fu" "" t)
(autoload 'undo-fu-only-redo "undo-fu" "" t)
(autoload 'separedit "separedit" "" t)
(autoload 'color-rg-search-project-with-type "color-rg" "" t)
(autoload 'color-rg-search-symbol-with-type "color-rg" "" t)
(autoload 'color-rg-search-project "color-rg" "" t)
(autoload 'color-rg-search-input "color-rg" "" t)
(autoload 'color-rg-search-symbol "color-rg" "" t)
(autoload 'xref-find-definitions "xref" "" t)
(autoload 'pyim-convert-string-at-point "pyim" "" t)
(autoload 'pyim-restart-1 "pyim" "" t)
(autoload 'sis-switch "sis" "" t)
(autoload 'company-complete "company" "" t)
(autoload 'switch-window "switch-window" "" t)
(autoload 'switch-window-then-maximize "switch-window" "" t)
(autoload 'switch-window-then-split-below "switch-window" "" t)
(autoload 'switch-window-then-split-right "switch-window" "" t)
(autoload 'switch-window-then-delete "switch-window" "" t)
(autoload 'ivy-yasnippet "ivy-yasnippet" "" t)
(autoload 'avy-goto-char "avy" "" t)
(autoload 'avy-goto-char-2 "avy" "" t)
(autoload 'avy-goto-word-1 "avy" "" t)
(autoload 'avy-goto-word-0 "avy" "" t)
(autoload 'avy-goto-line "avy" "" t)
(autoload 'avy-zap-to-char-dwim "avy-zap" "" t)
(autoload 'avy-zap-up-to-char-dwim "avy-zap" "" t)
(autoload 'magit-status "magit-status" "" t)
(autoload 'magit-dispatch-popup "magit" "" t)
(autoload 'magit-file-dispatch "magit" "" t)
(autoload 'git-timemachine "git-timemachine" "" t)
(autoload 'vc-msg-show "vc-msg" "" t)
(autoload 'magit-gitflow-popup "magit-gitflow" "" t)
(autoload 'snails "snails" "" t)
(autoload 'yasnippet-snippets--fixed-indent "yasnippet-snippets" "" t)
(autoload 'mengqp/open-init-file "init-func" "" t)
(autoload 'mengqp/open-init-package-file "init-func" "" t)
(autoload 'mengqp/open-init-package-file "init-func" "" t)
(autoload 'mengqp/switch-scratch-buf "init-func" "" t)
(autoload 'man "man" "" t)
(autoload 'woman "woman" "" t)
(autoload 'compile "compile" "" t)
(autoload 'restart-emacs "restart-emacs" "" t)
(autoload 'previous-buffer "window" "" t)
(autoload 'counsel-projectile-find-file "counsel-projectile" "" t)
(autoload 'ivy-switch-buffer "ivy" "" t)
(autoload 'counsel-find-file "counsel" "" t)
(autoload 'counsel-projectile-rg "counsel"  "" t)
(autoload 'counsel-bookmark "counsel" "" t)
(autoload 'counsel-recentf "counsel" "" t)
(autoload 'bookmark-delete "bookmark" "" t)
(autoload 'bookmark-set "bookmark" "" t)
(autoload 'eyebrowse-switch-to-window-config-1 "eyebrowse" "" t)
(autoload 'eyebrowse-switch-to-window-config-2 "eyebrowse" "" t)
(autoload 'eyebrowse-switch-to-window-config-3 "eyebrowse" "" t)
(autoload 'eyebrowse-switch-to-window-config-4 "eyebrowse" "" t)
(autoload 'eyebrowse-switch-to-window-config-5 "eyebrowse" "" t)
(autoload 'eyebrowse-switch-to-window-config-6 "eyebrowse" "" t)
(autoload 'eyebrowse-switch-to-window-config-7 "eyebrowse" "" t)
(autoload 'eyebrowse-switch-to-window-config-8 "eyebrowse" "" t)
(autoload 'eyebrowse-switch-to-window-config-9 "eyebrowse" "" t)
(autoload 'eyebrowse-prev-window-config "eyebrowse" "" t)
(autoload 'eyebrowse-next-window-config "eyebrowse" "" t)
(autoload 'projectile-switch-project "projectile" "" t)
(autoload 'split-window-vertically "window" "" t)
(autoload 'split-window-horizontally "window" "" t)
(autoload 'delete-window "window" "" t)
(autoload 'delete-other-window "window" "" t)
(autoload 'quit-window "window" "" t)
(autoload 'langtool-check "langtool" "" t)
(autoload 'langtool-check-done "langtool" "" t)
(autoload 'langtool-correct-buffer "langtool" "" t)
(autoload 'counsel-imenu "counsel" "" t)
(autoload 'org-roam-find-file "org-roam" "" t)
(autoload 'org-roam-graph "org-roam" "" t)
(autoload 'org-roam-insert "org-roam" "" t)
(autoload 'org-roam-buffer-toggle-display "org-roam" "" t)
(autoload 'org-roam-insert-immediate "org-roam" "" t)
(autoload 'org-roam "org-roam" "" t)
(autoload 'evilnc-comment-or-uncomment-lines "evil-nerd-commenter" "" t)
(autoload 'evilnc-quick-comment-or-uncomment-to-the-line "evil-nerd-commenter" "" t)
(autoload 'evilnc-copy-and-comment-lines "evil-nerd-commenter" "" t)
(autoload 'evilnc-comment-or-uncomment-paragraphs "evil-nerd-commenter" "" t)
(autoload 'iedit-mode "iedit" "" t)
(autoload 'iedit-rectangle-mode "iedit-rect" "" t)
(autoload 'evilmi-select-items "evil-matchit" "" t)
(autoload 'recentf-track-opened-file "recentf" "" t)
(autoload 'awesome-pair-wrap-bracke               "awesome-pair" "" t)
(autoload 'awesome-pair-wrap-curly                "awesome-pair" "" t)
(autoload 'awesome-pair-wrap-round                "awesome-pair" "" t)
(autoload 'awesome-pair-unwrap                    "awesome-pair" "" t)
(autoload 'awesome-pair-jump-left                 "awesome-pair" "" t)
(autoload 'awesome-pair-jump-right                "awesome-pair" "" t)
(autoload 'awesome-pair-jump-out-pair-and-newline "awesome-pair" "" t)
(autoload 'sp-rewrap-sexp                   "smartparens" "" t)
(autoload 'sp-wrap-square                   "smartparens" "" t)
(autoload 'sp-wrap-curly                    "smartparens" "" t)
(autoload 'sp-wrap-round                    "smartparens" "" t)
(autoload 'sp-unwrap-sexp                   "smartparens" "" t)
(autoload 'sp-forward-barf-sexp             "smartparens" "" t)
(autoload 'sp-forward-slurp-sexp            "smartparens" "" t)
(autoload 'sp-kill-sexp                     "smartparens" "" t)
(autoload 'company-backends                     "company" "" t)
(autoload 'eaf-open                          "eaf" "" t)
(autoload 'eaf-open-terminal                          "eaf" "" t)
(autoload 'eaf-open-browser                          "eaf" "" t)
(autoload 'eaf-open-browser-with-history                          "eaf" "" t)
(autoload 'eaf-open-git                          "eaf" "" t)
(autoload 'evil-set-initial-state                          "evil-core" "" t)
(autoload 'lsp-ivy-workspace-symbol                          "lsp-ivy" "" t)
(autoload 'lsp-ivy-global-workspace-symbol                          "lsp-ivy" "" t)
(autoload 'lsp-format-buffer                          "lsp-mode" "" t)
(autoload 'lsp-rename                          "lsp-mode" "" t)
(autoload 'display-line-numbers-mode          "display-line-numbers" "" t)
(autoload 'easy-mmode-defmap           "easy-mmode" "" t)


(provide 'init-autoload)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-autoload.el ends here

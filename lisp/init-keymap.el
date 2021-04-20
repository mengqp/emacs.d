;;; init-keymap.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
;; 输入法切换时不出现问题
;; (global-set-key (kbd "C-SPC") nil)
;; (global-unset-key (kbd "C-SPC"))
;; (global-set-key (kbd "S-SPC") 'set-mark-command)

;; (global-unset-key (kbd "M-h"))


(use-package which-key
  :hook (after-init . which-key-mode)
  :diminish which-key-mode
  :init
  ;; Set the prefix string that will be inserted in front of prefix commands
  ;; (i.e., commands that represent a sub-map).
  (setq which-key-prefix-prefix "+" )
  (setq which-key-use-C-h-commands nil)
  :config
  (which-key-setup-side-window-bottom)
  (which-key-setup-minibuffer)
  )

(use-package general
  :hook (after-init . general-override-mode)
  ;; :commands (init-keymap nvmap)
  ;; :after evil
  ;; :config
  :init
  (general-define-key
   :keymaps 'override
   ;; iedit
   "C-;" 'iedit-mode
   ;; goto-chg
   "C-," 'goto-last-change
   ;; expand-region
   "C-=" 'er/expand-region
   "C--" 'er/contract-region
   ;; shift-number
   "M-_" 'shift-number-down
   "M-+" 'shift-number-up
   ;; undo-fu
   "C-/" 'undo-fu-only-undo
   "C-?" 'undo-fu-only-redo

   ;; pyim
   ;; "M-i" 'pyim-convert-string-at-point ;与 pyim-probe-dynamic-english 配合
   "M-i" 'rime-toggle-or-inline-ascii   ;

   "M-j" 'snails                        ;

   ;; counsel
   "M-x"  'counsel-M-x
   "C-s"  'swiper

   ;; avy-zap
   "M-z"  'avy-zap-to-char-dwim
   "M-Z"  'avy-zap-up-to-char-dwim

   ;; awesome-pair-mode
   "C-d"  'awesome-pair-forward-delete
   "C-k"  'awesome-pair-kill
   "M-\""  'awesome-pair-wrap-double-quote
   "M-["  'awesome-pair-wrap-bracket
   "M-{"  'awesome-pair-wrap-curly
   "M-("  'awesome-pair-wrap-round
   "M-)"  'awesome-pair-unwrap
   "M-p"  'awesome-pair-jump-left
   "M-n"  'awesome-pair-jump-right
   "M-:"  'awesome-pair-jump-out-pair-and-newline ;跳出括号并换行
   )

  (general-define-key
   :keymaps 'override
   :prefix "C-x"
   ;; switch-window
   "o"  'switch-window
   "1"  'switch-window-then-maximize
   "2"  'switch-window-then-split-below
   "3"  'switch-window-then-split-right
   "0"  'switch-window-then-delete

   ;; magit
   "g"  'magit-status
   "M-g"  'magit-dispatch-popup
   )

  (general-define-key
   :keymaps 'override
   :prefix "C-c"
   ;; ivy-yasnippet
   "C-y"  'ivy-yasnippet
   ;; magit
   "g" 'magit-file-dispatch

   )


  ;; (general-evil-setup t)
  (general-create-definer moon--default-leader
    :states '(normal visual )
    :keymaps 'override
    :prefix "SPC")

  (general-create-definer moon-global-leader
    :prefix "M-m"
    :keymaps 'override)

  (general-create-definer moon--default-local-leader
    :states '(normal visual )
    :keymaps 'override
    :prefix ",")

  (general-create-definer moon-local-leader
    :prefix "M-,"
    :keymaps 'override)

  (defmacro moon-default-leader (&rest args)
    "Define for both default leader and global leader."
    (declare (indent defun))
    `(progn
       (moon--default-leader
	 ,@args)
       (moon-global-leader
	 ,@args)))

  (defmacro moon-default-local-leader (&rest args)
    "Define for both default leader and global leader."
    (declare (indent defun))
    `(progn
       (moon--default-local-leader
	 ,@args)
       (moon-local-leader
	 ,@args)))


  (moon-default-leader
    ;; general-define-key
    ;; :keymaps '(normal visual emacs)
    ;; :prefix "SPC"
    ;; :global-prefix "M-m"
    ;; :non-normal-prefix "M-m"

    "SPC" 'switch-window
    "TAB" 'previous-buffer
    "." 'counsel-projectile-find-file

    "1" 'eyebrowse-switch-to-window-config-1
    "2" 'eyebrowse-switch-to-window-config-2
    "3" 'eyebrowse-switch-to-window-config-3
    "4" 'eyebrowse-switch-to-window-config-4
    "5" 'eyebrowse-switch-to-window-config-5
    "6" 'eyebrowse-switch-to-window-config-6
    "7" 'eyebrowse-switch-to-window-config-7
    "8" 'eyebrowse-switch-to-window-config-8
    "9" 'eyebrowse-prev-window-config
    "0" 'eyebrowse-next-window-config

    ;; "a" '(:ignore t :wk ("a" . "app"))
    ;; "ac" 'calc
    ;; "aa" 'eaf-open

    ;; "b" '(:ignore t :wk ("b" . "buffers"))
    "bb" 'ivy-switch-buffer

    ;; "c" '(:ignore t :wk ("c" . "compile"))
    "cc" 'compile
    ;; "ck" 'kill-compilation
    ;; "cr" 'recompile
    ;; "cd" 'mengqp/close-compilation-window

    ;; "d" '(:ignore t :wk ("d" . "delete"))
    ;; "dd" 'avy-zap-to-char-dwim

    ;; "e" '(:ignore t :wk ("e" . "shell"))
    "ee" 'eaf-open
    "et" 'eaf-open-terminal
    "eb" 'eaf-open-browser
    "eh" 'eaf-open-browser-with-history
    "eg" 'eaf-open-git
    "eo" 'eaf-open-office
    ;; "ee" 'ansi-term
    ;; "ea" 'shell

    ;; "f" '(:ignore t :wk ("f" . "files"))
    "ff" 'counsel-find-file  ;;
    ;; "f." 'find-file-at-point
    "fr" 'counsel-recentf  ;;
    "fdi" 'mengqp/open-init-file
    "fdp" 'mengqp/open-init-package-file
    "fdk" 'mengqp/open-init-keymap-file
    "fds" 'mengqp/switch-scratch-buf

    ;; "g" '(:ignore t :wk ("g" . "git"))
    "gs" 'magit-status
    "gt" 'git-timemachine
    "gm" 'vc-msg-show
    "gf" 'magit-gitflow-popup
    ;; "gbl" 'magit-blame
    ;; "gbb" 'magit-branch-checkout
    ;; "gcc" 'magit-file-checkout
    ;; "gbd" 'magit-branch-delete
    ;; "gf" 'magit-gitflow-popup
    ;; "glb" 'magit-log-buffer-file
    ;; "gll" 'magit-log-all
    ;; "gm" 'magit-merge-plain
    ;; "gp" 'git-push-coding-request

    ;; "h" '(:ignore t :wk ("h" . "help"))
    "hf" 'find-function
    "hv" 'find-variable

    ;; "jj" 'snails

    "ll" 'lsp-ivy-workspace-symbol
    "lf" 'lsp-format-buffer
    "lr" 'lsp-rename
    "lg" 'lsp-ivy-global-workspace-symbol

    ;; "m" '(:ignore t :wk ("m" . "bookmark"))
    ;; ;; "mx" 'counsel-M-x
    "md" 'bookmark-delete
    "mm" 'counsel-bookmark

    ;; "o" '(:ignore t :wk ("o" . "org"))
    "oo" 'org-capture
    "oa" 'org-agenda
    ;; ;; "od" 'deft
    "oj" 'org-journal-new-entry

    ;; "p" '(:ignore t :wk ("p" . "project"))
    ;; "pd" 'counsel-projectile-find-dir
    ;; "pb" 'counsel-projectile-switch-to-buffer
    "pp" 'projectile-switch-project
    ;; "pa" 'counsel-projectile-ag
    ;; "pr" 'counsel-projectile-rg
    ;; "pfi" 'mengqp/org-projectile-find-issue
    ;; "pft" 'mengqp/org-projectile-find-todo

    ;; "q" '(:ignore t :wk ("q" . "quit"))
    ;; ;; "qq" 'save-buffers-kill-emacs
    "qr" 'restart-emacs

    ;; "sp" 'color-rg-search-project-with-type
    ;; "st" 'color-rg-search-symbol-with-type
    ;; "ss" 'color-rg-search-project
    ;; "sdi" 'color-rg-search-input
    ;; "sds" 'color-rg-search-symbol

    ;; "w" '(:ignore t :wk ("w" . "window"))
    "ws" 'split-window-vertically
    "wv" 'split-window-horizontally
    "w3" 'split-window-vertically
    "w2" 'split-window-horizontally
    "wd" 'delete-window
    "wo" 'delete-other-windows
    "wq" 'quit-window



    ;; "/" 'color-rg-search-project
    "/" 'counsel-projectile-rg
    ;; "/" 'counsel-projectile-ag

    )


  ;; {{ Use `SPC` as leader key
  ;; all keywords arguments are still supported
  ;; 本文件 侧重基本功能
  (moon-default-local-leader
    ;; "," 'ace-jump-char-mode
    ;; "," 'avy-goto-word-1
    "," 'avy-goto-char
    "." 'avy-goto-char-2

    "aa" 'prelude-copy-file-name-to-clipboard
    "al" 'avy-copy-line
    "ar" 'avy-copy-region

    ;; "b" '(:ignore t :wk ("b" . "buffer"))
    ;; "bw" '(:ignore t :wk ("w" . "buffer whitespace"))
    ;; ;; "bs" 'save-buffer
    ;; "bwt" 'delete-trailing-whitespace
    ;; "bwc" 'whitespace-cleanup
    ;; "bwv" 'whitespace-mode

    ;; "c" '(:ignore t :wk ("c" . "coding"))
    ;; "c2" '(:ignore t :wk ("2" . "convert"))
    ;; "cd" 'describe-current-coding-system
    ;; "cc" 'langtool-check
    ;; "cd" 'langtool-check-done
    ;; "cf" 'langtool-correct-buffer
    ;; "cr" 'revert-buffer-with-coding-system
    ;; "c2d" 'unix2dos
    ;; "c2u" 'dos2unix
    ;; "cf" 'clang-format-buffer
    "ci" 'evilnc-comment-or-uncomment-lines
    "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
    "cc" 'evilnc-copy-and-comment-lines
    "cp" 'evilnc-comment-or-uncomment-paragraphs


    "dd" 'avy-zap-to-char-dwim
    ;; "dD" 'avy-zap-up-to-char-dwim

    ;; "e" '(:ignore t :wk ("e" . "edit"))
    ;; "es" 'init-sp-menu/body
    ;; "et" 'init-te-menu/body

    ;; "f" '(:ignore t :wk ("f" . "file&func"))
    ;; ;; "fb" 'beginning-of-defun
    ;; ;; "fe" 'end-of-defun
    ;; "fr" 'recover-this-file
    "ff" 'format-all-buffer

    ;; "h" '(:ignore t :wk ("h" . "help"))
    "h." 'highlight-symbol-at-point
    "hu" 'unhighlight-regexp
    "hh" 'symbol-overlay-put
    "hd" 'symbol-overlay-remove-all
    "hm" 'man
    "hw" 'woman

    ;; "i" '(:ignore t :wk ("i" . "insert"))
    ;; "it" '(:ignore t :wk ("t" . "table"))
    ;; "itt" 'table-insert
    ;; "itr" 'table-insert-row
    ;; "itc" 'table-insert-column

    ;; "j" '(:ignore t :wk ("j" . "jump"))
    "jj" 'counsel-imenu
    ;; "jj" 'avy-goto-line
    ;; "jc" 'Ace-jump-char-mode
    "jw" 'avy-goto-char-2
    "jl" 'avy-goto-line

    ;; "l" '(:ignore t :wk ("l" . "line"))
    "ll" 'display-line-numbers-mode
    ;; "l RET" 'toggle-truncate-lines
    ;; "ln" 'whitespace-newline-mode

    "mm" 'bookmark-set

    ;; "s" '(:ignore t :wk ("s" . "search&shell&sudo"))
    ;; "sp" 'init-sp-menu/body
    ;; "sc" 'shell-command
    "sd" 'sudo-edit
    ;; "sj" 'counsel-imenu
    ;; "ss" 'swiper
    ;; "sS" 'ivy-resume
    ;; "sr" 'vr/replace

    ;; "t" '(:ignore t :wk ("t" . "toggle"))
    ;; "tt" 'mengqp/insert-time
    ;; "td" 'mengqp/insert-date
    ;; "te" 'toggle-company-english-helper

    ;; awewomepiar
    ;; "p\"" 'awesome-pair-wrap-double-quote
    ;; "p[" 'awesome-pair-wrap-bracke
    ;; "p{" 'awesome-pair-wrap-curly
    ;; "p(" 'awesome-pair-wrap-round
    ;; "pp" 'awesome-pair-unwrap
    ;; "pl" 'awesome-pair-jump-left
    ;; "pr" 'awesome-pair-jump-right
    ;; "po" 'awesome-pair-jump-out-pair-and-newline
    ;; "pk" 'awesome-pair-kill
    ;; "pp" 'init-sp-menu/body
    ;; "pr" 'sp-rewrap-sexp
    ;; "p[" 'sp-wrap-square
    ;; "p{" 'sp-wrap-curly
    ;; "p(" 'sp-wrap-round
    ;; "pp" 'sp-unwrap-sexp
    ;; "pl" 'sp-forward-barf-sexp
    ;; "ph" 'sp-forward-slurp-sexp
    ;; "pk" 'sp-kill-sexp

    ;; "w" '(:ignore t :wk ("w" . "evilw"))
    ;; "ww" 'save-buffer
    ;; "wq" 'evil-save-and-close
    "zz" 'avy-zap-to-char-dwim
    "zu" 'avy-zap-up-to-char-dwim
    )

  (general-define-key
   :keymaps '(normal visual emacs)
   :prefix ";"
   ";"  'evilnc-comment-or-uncomment-lines
   "w"  'avy-goto-word-1
   )

  (general-define-key
   :states '(normal motion)
   :keymaps '(c++-mode-map c-mode-map)
   :prefix ";"
   "a" 'projectile-find-other-file
   )

  ;; lsp
  (general-define-key
   :keymaps 'lsp-mode-map
   [remap xref-find-definitions]  'lsp-find-definition
   [remap xref-find-references]  'lsp-find-references)


  ;; anzu
  (general-define-key
   [remap query-replace]  'anzu-query-replace
   [remap query-replace-regexp]  'anzu-query-replace-regexp
   )

  ;; company
  (general-define-key
   :keymaps 'company-mode-map
   "M-y"  'company-yasnippet
   )

  ;; counsel
  (general-define-key
   :keymaps 'counsel-mode-map
   [remap swiper]  'counsel-grep-or-swiper
   )

  ;; company
  (general-define-key
   :keymaps 'company-active-map
   "C-p"  'company-select-previous
   "C-n"  'company-select-next
   "<tab>"  'company-complete-common-or-cycle
   "M-y"  'my-company-yasnippet
   )

  ;; snails
  (general-define-key
   :keymaps 'snails-mod-map
   "M-n" 'snails-select-next-backend
   "M-p" 'snails-select-prev-backend
   )

  ;; {{ Use `SPC` as leader key
  ;; all keywords arguments are still supported
  ;; 本文件 侧重一些模块功能

  ;; {{ Use `SPC` as leader key
  ;; all keywords arguments are still supported
  ;; 本文件 侧重一些模块功能
  ;; (general-define-key
  ;;  :keymaps '(normal visual)
  ;;  :prefix "]"
  ;;  ;; "p"  'sp-down-sexp
  ;;  "b" 'switch-to-next-buffer
  ;;  )

  ;; (general-define-key
  ;;  :keymaps '(normal visual)
  ;;  :prefix "["
  ;;  ;; "p"  'sp-up-sexp
  ;;  "b" 'switch-to-prev-buffer
  ;;  )
  )



(provide 'init-keymap)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-keymap.el ends here

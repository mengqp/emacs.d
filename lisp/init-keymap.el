
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
    "SPC [" "previous")

  (which-key-add-key-based-replacements
    "SPC [" "next")

  (which-key-add-key-based-replacements
    "SPC a" "app")

  (which-key-add-key-based-replacements
    "SPC b" "buffers")

  (which-key-add-key-based-replacements
    "SPC c" "compile")

  (which-key-add-key-based-replacements
    "SPC e" "shell")

  (which-key-add-key-based-replacements
    "SPC f" "files")

  (which-key-add-key-based-replacements
    "SPC g" "git")

  (which-key-add-key-based-replacements
    "SPC h" "help")

  (which-key-add-key-based-replacements
    "SPC m" "bookmark")

  (which-key-add-key-based-replacements
    "SPC o" "org")

  (which-key-add-key-based-replacements
    "SPC p" "project")

  (which-key-add-key-based-replacements
    "SPC q" "quit")

  (which-key-add-key-based-replacements
    "SPC w" "window")

  ;; (which-key-add-key-based-replacements
  ;;   "SPC x" "delete")

  ;; (which-key-add-key-based-replacements
  ;;   ", e" "errors/eval")

  (which-key-add-key-based-replacements
    ", f" "function")

  ;; (which-key-add-key-based-replacements
  ;;   ", g" "goto")

  (which-key-add-key-based-replacements
    ", h" "help")

  (which-key-add-key-based-replacements
    ", j" "jump")

  (which-key-add-key-based-replacements
    ", s" "search/shell/sudo")

  )



(use-package general
  :ensure t
  :init
  :config

  (general-evil-setup t)
  ;; 全局
  (nvmap :prefix "SPC"
	 "SPC" 'switch-window
	 ;; "TAB" 'previous-buffer
	 "." 'counsel-projectile-find-file
	 ":" 'counsel-M-x

	 "[b" 'switch-to-prev-buffer
	 "]b" 'switch-to-next-buffer

	 "ac" 'calc

	 "bb" 'ivy-switch-buffer
	 "bd" 'kill-buffer
	 ;; "bs" 'mengqp/switch-scratch-buf

	 "eh" 'eshell-here
	 "ee" 'ansi-term
	 "ea" 'shell

	 "cc" 'compile
	 "ck" 'kill-compilation
	 "cr" 'recompile
	 "cd" 'mengqp/close-compilation-window

	 "ff" 'counsel-find-file  ;;
	 "fr" 'counsel-recentf  ;;
	 "fdi" 'mengqp/open-init-file
	 "fdp" 'mengqp/open-init-package-file
	 "fdk" 'mengqp/open-init-keymap-file

	 "gs" 'magit-status
	 "gb" 'magit-blame
	 "gf" 'magit-gitflow-popup
	 "gt" 'git-timemachine

	 "hf" 'find-function
	 "hv" 'find-variable
	 "hm" 'helm-man-woman

	 ;; "mx" 'counsel-M-x
	 "mk" 'bookmark-set
	 "md" 'bookmark-delete
	 "mm" 'counsel-bookmark


	 "oc" 'org-capture
	 "oa" 'org-agenda
	 "op" 'org-pomodoro
	 "omp" 'org-mobile-push
	 "omg" 'org-mobile-pull

	 "pf" 'counsel-projectile-find-file
	 "pd" 'counsel-projectile-find-dir
	 "pb" 'counsel-projectile-switch-to-buffer
	 "pp" 'projectile-switch-project

	 "qq" 'save-buffers-kill-emacs

	 "ws" 'split-window-vertically
	 "wv" 'split-window-horizontally
	 "ww" 'switch-window
	 "wd" 'delete-window
	 "wo" 'delete-other-windows
	 "wo" 'quit-window


	 "/" 'counsel-projectile-ag
	 )

  ;; {{ Use `SPC` as leader key
  ;; all keywords arguments are still supported
  ;; 本文件 侧重基本功能
  (nvmap :prefix ","
	 "bc" 'set-buffer-file-coding-system
	 "bs" 'save-buffer

	 "ch" 'highlight-symbol-at-point
	 "cu" 'unhighlight-regexp

	 "fb" 'beginning-of-defun
	 "fe" 'end-of-defun
	 "fr" 'recover-this-file

	 "jj" 'ace-jump-char-mode
	 "jc" 'ace-jump-char-mode
	 "jw" 'ace-jump-word-mode
	 "jl" 'ace-jump-line-mode

	 "ls" 'linum-mode
	 "l RET" 'toggle-truncate-lines


	 "sc" 'shell-command
	 "sd" 'sudo-edit
	 "sj" 'counsel-imenu
	 "ss" 'swiper
	 "sS" 'ivy-resume


	 "ww" 'save-buffer
	 "wq" 'evil-save-and-close

	 "yy" 'helm-yas-complete

	 ;;"zz" 'paste-from-x-clipboard ; used frequently
	 )

  ;; {{ Use `SPC` as leader key
  ;; all keywords arguments are still supported
  ;; 本文件 侧重一些模块功能
  (nvmap :prefix ";"
	 ";"  'evilnc-comment-or-uncomment-lines
	 )
  )
;; (require 'general)
;; (general-evil-setup t)
;; {{ Use `SPC` as leader key
;; all keywords arguments are still supported


(provide 'init-keymap)

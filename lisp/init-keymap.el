(require 'general)
(general-evil-setup t)
;; {{ Use `SPC` as leader key
;; all keywords arguments are still supported
;; 全局
(nvmap :prefix "SPC"
       ;; "SPC" 'helm-M-x
       "SPC" 'counsel-M-x
        "1" 'select-window-1
        "2" 'select-window-2
        "3" 'select-window-3
        "4" 'select-window-4
        "5" 'select-window-5
        "6" 'select-window-6
        "7" 'select-window-7
        "8" 'select-window-8
        "9" 'select-window-9

	"ac" 'helm-calcul-expression

        ;; "bb" 'helm-buffers-list
	;; "bb" 'helm-mini
	"bb" 'ivy-switch-buffer
        "bd" 'kill-buffer
	"TAB" 'previous-buffer

        ;; "cc" 'helm-make-projectile
        "cC" 'compile
        ;; "cm" 'helm-make
        "ck" 'kill-compilation
        "cr" 'recompile
        "cd" 'mengqp/close-compilation-window

        ;; "ff" 'helm-find-files  ;;
        "ff" 'counsel-find-file  ;;
	;; "f/" 'helm-find
	;; "f/" 'counsel-find
        ;; "fr" 'helm-recentf  ;;
        "fr" 'counsel-recentf  ;;
        "fdi" 'mengqp/open-init-file
        "fdp" 'mengqp/open-init-package-file
        "fdk" 'mengqp/open-init-keymap-file

        "gs" 'magit-status


        "pf" 'counsel-projectile-find-file
        "pd" 'counsel-projectile-find-dir
	"po" 'org-projectile:project-todo-completing-read
	"pb" 'counsel-projectile-switch-to-buffer

        "ws" 'split-window-vertically
        "wv" 'split-window-horizontally
	"ww" 'switch-window

        "x0" 'delete-window
        "x1" 'delete-other-windows

        ;; "/" 'helm-do-ag-project-root
        ;; "/" 'counsel-git-find-my-file
        "/" 'counsel-projectile-ag
       )

;; {{ Use `SPC` as leader key
;; all keywords arguments are still supported
;; 本文件
(nvmap :prefix ","
       ;; ","  'evilnc-comment-or-uncomment-lines
       ;; "+" 'evil-numbers/inc-at-pt
       ;; "-" 'evil-numbers/dec-at-pt

       ;;"aa" 'copy-to-x-clipboard ; used frequently

       "bc" 'set-buffer-file-coding-system
       "bs" 'save-buffer

       "eb" 'eval-buffer
       "ee" 'eval-expression
       "el" 'mengqp/toggle-flycheck-error-list
       "en" 'flycheck-next-error
       "ep" 'flycheck-previous-error


       "fb" 'beginning-of-defun
       "fe" 'end-of-defun
       "fr" 'recover-this-file

       "gg" 'ycmd-goto
       "gs" 'helm-cscope-find-this-symbol
       "gd" 'helm-cscope-find-global-definition
       "gc" 'helm-cscope-find-called-function
       "gC" 'helm-cscope-find-calling-this-function
       "gi" 'cscope-index-files
       "ga" 'projectile-find-other-file
       "gA" 'projectile-find-other-file-other-window

       "hf" 'find-function
       "hv" 'find-variable
       "hm" 'helm-man-woman

       "jj" 'ace-jump-char-mode
       "jc" 'ace-jump-char-mode
       "jw" 'ace-jump-word-mode
       "jl" 'ace-jump-line-mode

       "ls" 'linum-mode
       "l RET" 'toggle-truncate-lines

       "mk" 'bookmark-set
       "mm" 'counsel-bookmark-goto


       "sc" 'shell-command
       "sd" 'sudo-edit
       ;; "sj" 'mengqp/helm-jump-in-buffer
       "sj" 'counsel-imenu
       ;; "ss" 'mengqp/helm-file-smart-do-search
       "ss" 'swiper
       "sS" 'ivy-resume

       "yy" 'helm-yas-complete

       ;;"zz" 'paste-from-x-clipboard ; used frequently
       )

;; {{ Use `SPC` as leader key
;; all keywords arguments are still supported
;; 本文件
(nvmap :prefix ";"
       ";"  'evilnc-comment-or-uncomment-lines
       )


(provide 'init-keymap)

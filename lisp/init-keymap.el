;;; init-keymap.el --- xxx -*- coding: utf-8-unix -*-

;;; Copyright © 2018 - 2018 mengqp.

;; Author: mengqp
;; URL:
;; Version:0.0.1
;; Keywords:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:
;; 输入法切换时不出现问题
;; (global-set-key (kbd "C-SPC") nil)
;; (global-unset-key (kbd "C-SPC"))
;; (global-set-key (kbd "S-SPC") 'set-mark-command)

(use-package which-key
  :ensure t
  :defer 2
  ;; :after general-override-mode
  :diminish which-key-mode
  :config


  (which-key-mode)

  (which-key-setup-side-window-bottom)
  (which-key-setup-minibuffer)
  (setq which-key-use-C-h-commands nil)

  ;; Set the prefix string that will be inserted in front of prefix commands
  ;; (i.e., commands that represent a sub-map).
  (setq which-key-prefix-prefix "+" )

  )

(use-package general
  :ensure t
  :defer t
  ;; :commands (init-keymap nvmap)
  ;; :after evil
  :config

  (use-package which-key-posframe
    :disabled t
    :ensure t
    :config
    (which-key-posframe-mode)
    ;; (setq which-key-posframe-poshandler 'posframe-poshandler-window-bottom-left-corner)
    )
  ;; (general-evil-setup t)
  (general-create-definer moon--default-leader
    :states '(normal visual )
    :keymaps 'override
    :prefix "SPC")

  (general-create-definer moon-global-leader
    :prefix "M-SPC"
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


    ;; "SPC" 'switch-window
    ;; "TAB" 'previous-buffer
    "." 'counsel-projectile-find-file
    ;; ":" 'counsel-M-x

    "a" '(:ignore t :wk ("a" . "app"))
    "ac" 'calc

    "b" '(:ignore t :wk ("b" . "buffers"))
    ;; "bb" 'ivy-switch-buffer
    ;; "bd" 'kill-buffer
    ;; "bs" 'mengqp/switch-scratch-buf

    "c" '(:ignore t :wk ("c" . "compile"))
    "cc" 'compile
    "ck" 'kill-compilation
    "cr" 'recompile
    "cd" 'mengqp/close-compilation-window

    "e" '(:ignore t :wk ("e" . "shell"))
    "ee" 'aweshell-new
    ;; "eh" 'eshell-here
    ;; "ee" 'ansi-term
    ;; "ea" 'shell

    "f" '(:ignore t :wk ("f" . "files"))
    ;; "ff" 'counsel-find-file  ;;
    ;; "f." 'find-file-at-point
    ;; "fr" 'counsel-recentf  ;;
    "fdi" 'mengqp/open-init-file
    "fdp" 'mengqp/open-init-package-file
    "fdk" 'mengqp/open-init-keymap-file

    "g" '(:ignore t :wk ("g" . "git"))
    ;; "gst" 'magit-status
    ;; "gbl" 'magit-blame
    ;; "gbb" 'magit-branch-checkout
    ;; "gcc" 'magit-file-checkout
    ;; "gbd" 'magit-branch-delete
    ;; "gf" 'magit-gitflow-popup
    ;; "glb" 'magit-log-buffer-file
    ;; "gll" 'magit-log-all
    ;; "gm" 'magit-merge-plain
    ;; "gp" 'git-push-coding-request
    "gt" 'git-timemachine

    "h" '(:ignore t :wk ("h" . "help"))
    "hf" 'find-function
    "hv" 'find-variable
    "hm" 'man
    "hw" 'woman

    "l" '(:ignore t :wk ("l" . "layout"))
    "l0" 'eyebrowse-switch-to-window-config-0
    "l1" 'eyebrowse-switch-to-window-config-1
    "l2" 'eyebrowse-switch-to-window-config-2
    "l3" 'eyebrowse-switch-to-window-config-3
    "l4" 'eyebrowse-switch-to-window-config-4
    "l5" 'eyebrowse-switch-to-window-config-5
    "l6" 'eyebrowse-switch-to-window-config-6
    "l7" 'eyebrowse-switch-to-window-config-7
    "l8" 'eyebrowse-switch-to-window-config-8
    "l9" 'eyebrowse-switch-to-window-config-9
    "l[" 'eyebrowse-prev-window-config
    "l]" 'eyebrowse-next-window-config
    "lc" 'eyebrowse-close-window-config

    "m" '(:ignore t :wk ("m" . "bookmark"))
    ;; "mx" 'counsel-M-x
    "mk" 'bookmark-set
    "md" 'bookmark-delete
    "mm" 'counsel-bookmark

    "o" '(:ignore t :wk ("o" . "org"))
    "oo" 'org-capture
    "oa" 'org-agenda
    "od" 'deft
    "ojj" 'org-journal-new-entry
    ;; "op" 'org-pomodoro
    ;; "omp" 'org-mobile-push
    ;; "omg" 'org-mobile-pull
    "oc" 'cfw:open-org-calendar

    "p" '(:ignore t :wk ("p" . "project"))
    ;; "pd" 'counsel-projectile-find-dir
    ;; "pb" 'counsel-projectile-switch-to-buffer
    ;; "pp" 'projectile-switch-project
    "pa" 'counsel-projectile-ag
    "pr" 'counsel-projectile-rg
    ;; "pfi" 'mengqp/org-projectile-find-issue
    ;; "pft" 'mengqp/org-projectile-find-todo

    "q" '(:ignore t :wk ("q" . "quit"))
    ;; "qq" 'save-buffers-kill-emacs
    "qr" 'restart-emacs

    "sp" 'color-rg-search-project-with-type
    "st" 'color-rg-search-symbol-with-type
    "ss" 'color-rg-search-project
    "sdi" 'color-rg-search-input
    "sds" 'color-rg-search-symbol

    "tj" 'awesome-tab-backward-tab
    "tk" 'awesome-tab-forward-tab
    "th" 'awesome-tab-forward-group
    "tl" 'awesome-tab-backward-group
    "t0" 'my-select-window
    "t1" 'my-select-window
    "t2" 'my-select-window
    "t3" 'my-select-window
    "t4" 'my-select-window
    "t5" 'my-select-window
    "t6" 'my-select-window
    "t7" 'my-select-window
    "t8" 'my-select-window
    "t9" 'my-select-window
    "ta" 'awesome-tab-select-beg-tab
    "te" 'awesome-tab-select-end-tab
    "tt" 'awesome-tab-ace-jump
    "tmj" 'awesome-tab-move-current-tab-to-left
    "tmk" 'awesome-tab-move-current-tab-to-right
    "tg" 'awesome-tab-counsel-switch-group
    "tbk" 'kill-current-buffer

    "w" '(:ignore t :wk ("w" . "window"))
    ;; "ws" 'split-window-vertically
    ;; "wv" 'split-window-horizontally
    ;; "ww" 'switch-window
    ;; "wd" 'delete-window
    ;; "wo" 'delete-other-windows
    ;; "wq" 'quit-window


    ;; "/" 'color-rg-search-project
    "/" 'counsel-projectile-rg
    ;; "/" 'counsel-projectile-ag

    )


  ;; {{ Use `SPC` as leader key
  ;; all keywords arguments are still supported
  ;; 本文件 侧重基本功能
  (moon-default-local-leader
    ;; general-define-key
    ;; :global-prefix "C-M-m"
    ;; :keymaps '(normal visual emacs)
    ;; :prefix ","
    ;; :global-prefix "C-m"
    ;; :non-normal-prefix "C-m"
    ;; "," 'ace-jump-char-mode
    "," 'avy-goto-word-1
    ;; "," 'avy-goto-char-2

    "b" '(:ignore t :wk ("b" . "buffer"))
    "bw" '(:ignore t :wk ("w" . "buffer whitespace"))
    ;; "bs" 'save-buffer
    "bwt" 'delete-trailing-whitespace
    "bwc" 'whitespace-cleanup
    "bwv" 'whitespace-mode

    "c" '(:ignore t :wk ("c" . "coding"))
    "c2" '(:ignore t :wk ("2" . "convert"))
    ;; "cd" 'describe-current-coding-system
    ;; "cc" 'set-buffer-file-coding-system
    ;; "cr" 'revert-buffer-with-coding-system
    "c2d" 'unix2dos
    "c2u" 'dos2unix
    ;; "cf" 'clang-format-buffer
    "cf" 'format-all-buffer

    "dd" 'avy-zap-to-char-dwim
    "dD" 'avy-zap-up-to-char-dwim

    ;; "e" '(:ignore t :wk ("e" . "edit"))
    ;; "es" 'init-sp-menu/body
    ;; "et" 'init-te-menu/body

    "f" '(:ignore t :wk ("f" . "file&func"))
    ;; "fb" 'beginning-of-defun
    ;; "fe" 'end-of-defun
    "fr" 'recover-this-file

    "h" '(:ignore t :wk ("h" . "help"))
    ;; "h." 'highlight-symbol-at-point
    ;; "hu" 'unhighlight-regexp
    "h." 'symbol-overlay-put
    "hu" 'symbol-overlay-remove-all

    "i" '(:ignore t :wk ("i" . "insert"))
    "it" '(:ignore t :wk ("t" . "table"))
    "itt" 'table-insert
    "itr" 'table-insert-row
    "itc" 'table-insert-column

    "j" '(:ignore t :wk ("j" . "jump"))
    "jj" 'avy-goto-line
    ;; "jc" 'ace-jump-char-mode
    "jw" 'avy-goto-char-2
    ;; "jl" 'avy-goto-line

    "l" '(:ignore t :wk ("l" . "line"))
    "ll" 'display-line-numbers-mode
    "l RET" 'toggle-truncate-lines
    "ln" 'whitespace-newline-mode


    "s" '(:ignore t :wk ("s" . "search&shell&sudo"))
    "sp" 'init-sp-menu/body
    "sc" 'shell-command
    "sd" 'sudo-edit
    "sj" 'counsel-imenu
    ;; "ss" 'swiper
    "sS" 'ivy-resume
    "sr" 'vr/replace

    "t" '(:ignore t :wk ("t" . "toggle"))
    "tt" 'mengqp/insert-time
    "td" 'mengqp/insert-date
    "te" 'toggle-company-english-helper

    "w" '(:ignore t :wk ("w" . "evilw"))
    ;; "ww" 'save-buffer
    ;; "wq" 'evil-save-and-close

    "y" '(:ignore t :wk ("y" . "yasnippet"))
    "yy" 'ivy-yasnippet
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

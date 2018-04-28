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
(global-set-key (kbd "C-SPC") nil)

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
    "SPC ]" "next")

  (which-key-add-key-based-replacements
    "SPC a" "app")

  (which-key-add-key-based-replacements
    "SPC b" "buffers")

  (which-key-add-key-based-replacements
    "SPC c" "code")

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
  (which-key-add-key-based-replacements
    ", b" "buffer")

  (which-key-add-key-based-replacements
    ", bw" "buffer whitespace")

  (which-key-add-key-based-replacements
    ", i" "insert")
  (which-key-add-key-based-replacements
    ", it" "table")

  (which-key-add-key-based-replacements
    ", id" "date")

  ;; (which-key-add-key-based-replacements
  ;;   ", e" "errors/eval")
  (which-key-add-key-based-replacements
    ", c" "coding")

  (which-key-add-key-based-replacements
    ", c2" "unixdosconvert")

  (which-key-add-key-based-replacements
    ", f" "function")

  ;; (which-key-add-key-based-replacements
  ;;   ", g" "goto")

  (which-key-add-key-based-replacements
    ", h" "help")

  (which-key-add-key-based-replacements
    ", it" "table")

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
	 "gc" 'magit-file-checkout
	 "gp" 'git-push-coding-request

	 "hf" 'find-function
	 "hv" 'find-variable
	 "hm" 'helm-man-woman

	 ;; "mx" 'counsel-M-x
	 "mk" 'bookmark-set
	 "md" 'bookmark-delete
	 "mm" 'counsel-bookmark


	 "oo" 'org-capture
	 "oa" 'org-agenda
	 "op" 'org-pomodoro
	 "omp" 'org-mobile-push
	 "omg" 'org-mobile-pull
	 "oc" 'cfw:open-org-calendar

	 "pf" 'counsel-projectile-find-file
	 "pd" 'counsel-projectile-find-dir
	 "pb" 'counsel-projectile-switch-to-buffer
	 "pp" 'projectile-switch-project

	 "qq" 'save-buffers-kill-emacs
	 "qr" 'restart-emacs

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
    ;; "," 'ace-jump-char-mode
    "," 'avy-goto-char

    "bs" 'save-buffer
    "bwt" 'delete-trailing-whitespace
    "bwc" 'whitespace-cleanup
    "bwv" 'whitespace-mode

    "cd" 'describe-current-coding-system
    "cc" 'set-buffer-file-coding-system
    "c2d" 'unix2dos
    "c2u" 'dos2unix


    "fb" 'beginning-of-defun
    "fe" 'end-of-defun
    "fr" 'recover-this-file

    "h." 'highlight-symbol-at-point
    "hu" 'unhighlight-regexp

    "itt" 'table-insert
    "itr" 'table-insert-row
    "itc" 'table-insert-column

    ;; "jj" 'ace-jump-char-mode
    ;; "jc" 'ace-jump-char-mode
    "jw" 'avy-goto-char-2
    "jl" 'avy-goto-line

    "ll" 'linum-mode
    "l RET" 'toggle-truncate-lines
    "ln" 'whitespace-newline-mode


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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-keymap.el ends here

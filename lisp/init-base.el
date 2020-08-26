;;; init-base.el --- base -*- coding: utf-8-unix -*-

;;; Copyright © 2018 - 2018 mengqp.

;; Author: mengqp
;; URL:
;; Version:0.0.1
;; Keywords:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  这就一个进行基本配置的文件
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
(progn
  (setq make-backup-files nil)
  (setq auto-save-default -1)
  ;; backup in one place. flat, no tree structure
  (setq default-major-mode 'text-mode)    ;设置默认地主模式为TEXT模式
  (setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))
  (setq initial-major-mode 'text-mode)
  ;; (setq initial-scratch-message nil )
  (setq inhibit-compacting-font-caches t) ;使用字体缓存，避免卡顿

  ;; ;; 不显示 *scratch*
  ;; (defun remove-scratch-buffer ()
  ;;   (if (get-buffer "*scratch*")
  ;; 	(kill-buffer "*scratch*")))
  ;; (add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)
  (setq split-width-threshold nil)        ;分屏的时候使用上下分屏
  )

(progn
  ;; 末尾加空行
  (setq require-final-newline t)
  ;; remember cursor position, for emacs 25.1 or later
  (save-place-mode 1)
  ;; 以 y/n 代表 yes/no
  (fset 'yes-or-no-p 'y-or-n-p)
  )

(require-package 'use-package)
;; (use-package general
;;   :ensure t)
(use-package diminish
  :ensure t)

;; (use-package use-package-chords
;;   :ensure t
;;   :config (key-chord-mode 1))
(use-package dash-functional
  :ensure t
  :defer t
  )
(use-package ht
  :ensure t
  :defer t
  )
(use-package spinner
  :ensure t
  :defer t
  )


;; 空格
(use-package pangu-spacing
  :ensure t
  :defer t
  :diminish global-pangu-spacing-mode
  :diminish pangu-spacing-mode
  :hook
  (prog-mode-hook . pangu-spacing-mode)
  :config
  (setq pangu-spacing-real-insert-separtor nil)
  )

;;文件在改变时自动加载
(use-package autorevert
  :diminish auto-revert-mode
  :defer t
  :hook
  (after-init . auto-revert-mode)
  :config
  (global-auto-revert-mode t)
  )

;; 自动保存
(use-package auto-save
  :defer 3
  :config
  (setq auto-save-delete-trailing-whitespace t)
  (auto-save-enable)              ;; 开启自动保存功能
  (setq auto-save-silent t)       ;; 自动保存的时候静悄悄的， 不要打扰我
  (setq auto-save-idle 10)
  )

(use-package recentf
  ;; :ensure nil
  :defer t
  :hook (find-file . (lambda () (unless recentf-mode
				  (recentf-mode)
				  (recentf-track-opened-file))))
  :init
  (setq recentf-max-saved-items 200)
  (setq recentf-auto-cleanup 'never)
  (setq recentf-max-menu-items 15)

  :config
  (add-to-list 'recentf-exclude (expand-file-name package-user-dir))
  (add-to-list 'recentf-exclude "COMMIT_EDITMSG\\'")
  (add-to-list 'recentf-exclude "bookmarks")

  )

(use-package savehist
  ;; :ensure nil
  ;; :disabled t
  :defer t
  :hook (before-save . savehist-mode)
  :init
  (setq savehist-file (expand-file-name "savehist" user-emacs-directory))
  (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
	history-length 1000
	savehist-additional-variables '(mark-ring
					global-mark-ring
					search-ring
					regexp-search-ring
					extended-command-history)
	savehist-autosave-interval 60)
  )

(use-package session
  :disabled t
  :ensure t
  :hook(after-init . session-initialize)
  :defer t
  :init
  (setq session-save-file (expand-file-name (concat "~/.emacs.d/" ".session")))
  (setq session-globals-max-size 2048)
  ;; can store 8Mb string
  (setq session-globals-max-string (* 8 1024 1024))
  (setq session-globals-include '(kill-ring
                                  (session-file-alist 100 t)
                                  my-dired-commands-history
                                  file-name-history
                                  search-ring
                                  regexp-search-ring))
  )

;;在 minibuffer 里启用自动补全函数和变量
;; (icomplete-mode 1)
;;允许 minibuffer 自由变化其宽度大小
;; (setq resize-mini-windows t)

;; (use-package undo-tree
;;   :ensure t
;;   :defer t
;;   :diminish undo-tree-mode
;;   :config
;;   (setq x-wait-for-event-timeout nil)
;;   (undo-tree-mode 1)
;;   )



;; (use-package eldoc
;;   :diminish eldoc-mode
;;   )

(use-package restart-emacs
  :ensure t
  :defer t
  )

(use-package smart-tabs-mode
  :ensure t
  :defer t
  :hook (after-prog . smart-tabs-mode)
  :init
  (add-hook 'plantuml-mode-hook
	    (lambda ()
	      (setq indent-tabs-mode nil)
	      (setq tab-width 2 )))
  )

(use-package exec-path-from-shell
  :ensure t
  :defer t;
  ;; :disabled t
  :config
  (setq exec-path-from-shell-check-startup-files nil)
  (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
    (add-to-list 'exec-path-from-shell-variables var))
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  )

(use-package adaptive-wrap
  :disabled t
  :ensure t
  :defer t
  :hook (after-init . adaptive-wrap-prefix-mode)
  )


(use-package keyfreq
  :ensure t
  :defer t
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
  )

(use-package vdiff
  :ensure t
  :defer t
  )

(when *linux*
  ;; pacman -S rustup
  ;; rustup install stable
  (use-package fuz
    :defer t
    :config
    (unless (require 'fuz-core nil t)
      (fuz-build-and-load-dymod))
    )
  )

(provide 'init-base)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-base.el ends here

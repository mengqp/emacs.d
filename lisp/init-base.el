;;; init-base.el --- base -*- coding: utf-8-unix -*-
;;; Commentary:
;;  这就一个进行基本配置的文件
;;; Code:
(require 'init-const)

(progn
  (setq make-backup-files nil)
  (setq auto-save-default nil)
  ;; backup in one place. flat, no tree structure
  (setq-default default-major-mode 'text-mode)    ;设置默认地主模式为TEXT模式
  (setq backup-directory-alist '(("" . (caocat my-emacs-d "/emacs-backup"))))
  ;; (setq initial-major-mode 'fundamental-mode)
  (setq initial-major-mode 'text-mode)
  ;; (setq initial-scratch-message nil )
  (setq inhibit-compacting-font-caches t) ;使用字体缓存，避免卡顿
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

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require-package 'use-package)
(require-package 'diminish)
(require-package 'dash-functional)

;; 空格
(use-package pangu-spacing
  :ensure t
  :defer t
  :diminish global-pangu-spacing-mode
  :diminish pangu-spacing-mode
  :hook
  (prog-mode-hook . pangu-spacing-mode)
  :init
  (setq pangu-spacing-real-insert-separtor nil)
  )

;;文件在改变时自动加载
(use-package autorevert
  :diminish auto-revert-mode
  :defer t
  :hook (after-init . global-auto-revert-mode)
  )

;; 自动保存
(use-package auto-save
  :defer 3
  ;; :load-path (concat my-site-lisp-d "/auto-save/autosave.el")
  :load-path auto-save-path
  :init
  (setq auto-save-delete-trailing-whitespace t)
  (setq auto-save-silent t)       ;; 自动保存的时候静悄悄的， 不要打扰我
  (setq auto-save-idle 5)
  :config
  (auto-save-enable)              ;; 开启自动保存功能
  )

(use-package recentf
  :defer t
  :hook (find-file . (lambda () (unless recentf-mode
				  (recentf-mode)
				  (recentf-track-opened-file))))
  :init
  (setq recentf-max-saved-items 100)
  ;; (setq recentf-auto-cleanup 'never)
  (setq recentf-max-menu-items 15)

  :config
  (add-to-list 'recentf-exclude (expand-file-name package-user-dir))
  (add-to-list 'recentf-exclude "COMMIT_EDITMSG\\'")
  (add-to-list 'recentf-exclude "bookmarks")

  )

(use-package savehist
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
  :ensure t
  :hook(after-init . session-initialize)
  :defer t
  :init
  (setq session-save-file (expand-file-name (concat user-emacs-directory ".session")))
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

(use-package restart-emacs
  :ensure t
  :defer t
  )

(use-package smart-tabs-mode
  :ensure t
  :defer t
  :hook (prog-mode . smart-tabs-mode)
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
  ;; (setq exec-path-from-shell-check-startup-files nil)
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
  :defer 10
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
  )

(use-package vdiff
  :ensure t
  :defer t
  )

(use-package fuz
  :ensure t
  :defer t
  :config
  (unless (require 'fuz-core nil t)
    (fuz-build-and-load-dymod))
  )

(provide 'init-base)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-base.el ends here

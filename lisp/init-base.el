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
;; ---------------------------------gui ----------------------------------------
;; (setq default-buffer-file-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)

;;不产生备份
(progn
  (setq make-backup-files nil)
  (setq auto-save-default -1)
  (setq backup-inhibited t)
  ;; backup in one place. flat, no tree structure
  (setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))
   )

(progn
  ;; 末尾加空行
  (setq require-final-newline t)
  ;; 清除白块
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  ;; 以 y/n代表 yes/no
  (fset 'yes-or-no-p 'y-or-n-p)
  )

(progn
  ;; auto insert closing bracket
  (electric-pair-mode 1)
  ;;显示括号匹配
  (show-paren-mode t)
  ;; show cursor position within line
  (column-number-mode 1)

  (use-package rainbow-delimiters
    :ensure t
    :defer t
    :init
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
    :config
    (set-face-foreground 'rainbow-delimiters-depth-2-face "cyan")
    )
  )

;;文件在改变时自动加载
(use-package autorevert
  :diminish auto-revert-mode
  :config
  (global-auto-revert-mode t)
  )


;; remember cursor position, for emacs 25.1 or later
(save-place-mode 1)

(use-package recentf
 ;; :ensure nil
  :defer t
  :init
  ;; lazy load recentf
  (add-hook 'after-init-hook 'recentf-mode)
  (add-hook 'find-file-hook (lambda () (unless recentf-mode
					 (recentf-mode)
					 (recentf-track-opened-file))))
  (setq recentf-max-saved-items 200)
  :config
  (add-to-list 'recentf-exclude (expand-file-name package-user-dir))
  (add-to-list 'recentf-exclude "COMMIT_EDITMSG\\'")
  (add-to-list 'recentf-exclude "bookmarks")

(use-package savehist
  ;;:ensure nil
  :defer t
  :init
  (add-hook 'after-init-hook 'savehist-mode)
  (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
        history-length 1000
        savehist-additional-variables '(mark-ring
                                        global-mark-ring
                                        search-ring
                                        regexp-search-ring
                                        extended-command-history)
        savehist-autosave-interval 60)
  )



  ;; )

;; (when *linux*
;;   (use-package all-the-icons
;;     :ensure t
;;     :init
;;     :config
;;     (use-package all-the-icons-dired
;;       :ensure t
;;       :defer t
;;       :init
;;       (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;;       )
;;     (use-package all-the-icons-ivy
;;       :ensure t
;;       :config
;;       (all-the-icons-ivy-setup)
;;       )

;;     )
;;   )

;; (when *linux*
;;   (use-package fcitx
;;     :ensure t
;;     :config
;;     (fcitx-default-setup)
;;     ))


  )


;;在minibuffer里启用自动补全函数和变量
;; (icomplete-mode 1)
;;允许minibuffer自由变化其宽度大小
;; (setq resize-mini-windows t)



;; --------------------------------coding --------------------------------------
;; (use-package unicad
;;   :defer t)
;; (require 'unicad)

;; --------------------------------other  --------------------------------------
;; 去除一个警告
;; (setq exec-path-from-shell-check-startup-files nil)





;; (use-package which-func
;;   :init
;;   (add-hook 'prog-major-mode #'which-function-mode)
;;   :config
  ;; ;; http://emacsredux.com/blog/2014/04/05/which-function-mode/
  ;; (which-function-mode)
  ;; when editing js file, this feature is very useful
  ;; (setq-default header-line-format
  ;; 		'((which-func-mode ("" which-func-format " "))))
  ;; (setq-default mode-line-misc-info
  ;; 		(assq-delete-all 'which-function-mode mode-line-misc-info))

  ;; )

(use-package expand-region
  :ensure t
  :defer t
  :commands er/expand-region
  :init
  (global-set-key (kbd "C-=") 'er/expand-region)
  )

(use-package undo-tree
  :ensure t
  :defer t
  :diminish undo-tree-mode
  )

(use-package eldoc
  :diminish eldoc-mode
  )

(use-package restart-emacs
  :ensure t
  :defer t
  )

;; (use-package real-auto-save
;;   :ensure t
;;   :init
;;   (add-hook 'prog-mode-hook 'real-auto-save-mode)
;;   )
;; (use-package repeater
;;   :ensure t)


;; (setq hippie-expand-try-functions-list
;;       '(
;;         try-expand-dabbrev
;;         try-expand-dabbrev-all-buffers
;;         ;; try-expand-dabbrev-from-kill
;;         try-complete-lisp-symbol-partially
;;         try-complete-lisp-symbol
;;         try-complete-file-name-partially
;;         try-complete-file-name
;;         ;; try-expand-all-abbrevs
;;         ;; try-expand-list
;;         ;; try-expand-line
;;         ))

;; (global-set-key (kbd "M-/") 'hippie-expand)

;; (use-package pomodoro
;;   :ensure t
;;   :config
;;   (pomodoro-add-to-mode-line)
;;   )
;; (require 'expand-region)

;; (add-hook 'after-init-hook 'org-agenda)
;; (add-hook 'after-init-hook
;; 	  (lambda ()
;; 	    (setq org-agenda-window-setup 'current-window)
;; 	    (org-agenda nil "a")
;; 	    ))

;; (use-package dashboard
;;     :ensure t
;;     :diminish dashboard-mode
;;     :config
;;     (setq dashboard-banner-logo-title "mengqp")
;;     (setq dashboard-startup-banner "~/DotFiles/mengqp-arch.jpg")
;;     (setq dashboard-items '((agenda . 20)))

;;     (dashboard-setup-startup-hook))

(provide 'init-base)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-base.el ends here

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
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

;; Show a marker in the left fringe for lines not in the buffer
(setq indicate-empty-lines t)

;; 设置透明
;; (set-frame-parameter (selected-frame) 'alpha '(80 . 100))
;; (add-to-list 'default-frame-alist '(alpha . (80 . 100)))

;; NO tool bar
(if (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
;; no scroll bar
(if (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))
;; no menu bar
(if (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

;; 关闭Tooltip
(tooltip-mode -1)


(when *linux*
  (defun fullscreen ()
    "fullscreen"
    (interactive)
    (set-frame-parameter nil 'fullscreen
			 (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
  (fullscreen)
  )
(when *win64*
  (run-with-idle-timer 0.2 nil 'w32-send-sys-command 61488)
  )
;; (setq default-buffer-file-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)

;;不产生备份
(setq make-backup-files nil)
(setq auto-save-default -1)
(setq backup-inhibited t)

;;当前行高亮
(global-hl-line-mode 1)
;; (set-face-background 'hl-line "#3e4446")
;; 末尾加空行
(setq require-final-newline t)

;; 平滑滚动
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;;显示括号匹配
(show-paren-mode t)

;; show cursor position within line
(column-number-mode 1)

;;文件在改变时自动加载
(use-package autorevert
  :diminish auto-revert-mode
  :config
  (global-auto-revert-mode t)
  )

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;指针不要闪
(blink-cursor-mode -1)

;; remember cursor position, for emacs 25.1 or later
(save-place-mode 1)

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

;;80列
;; (use-package fill-column-indicator
;;   :ensure t
;;   ;; :defer t
;;   :init
;;   (add-hook 'prog-mode-hook 'fci-mode)
;;   (add-hook 'prog-mode-hook (lambda () (setq truncate-lines nil)))
;;   (setq fci-rule-column 80)
;;   (setq fci-rule-width 3)
;;   (setq fci-rule-color "darkblue")
;;   )

(use-package column-enforce-mode
  :ensure t
  :diminish column-enforce-mode
  :init
  (add-hook 'prog-mode-hook 'column-enforce-mode)
  :config
  (setq column-enforce-column 81)
)
  ;; )

(when *linux*
  (use-package all-the-icons
    :ensure t
    :init
    :config
    (use-package all-the-icons-dired
      :ensure t
      :defer t
      :init
      (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
      )
    (use-package all-the-icons-ivy
      :ensure t
      :config
      (all-the-icons-ivy-setup)
      )

    )
  )

;; (when *linux*
;;   (use-package fcitx
;;     :ensure t
;;     :config
;;     (fcitx-default-setup)
;;     ))


(use-package recentf
 ;; :ensure nil
  :init
  (setq recentf-max-saved-items 200)

  ;; lazy load recentf
  (add-hook 'after-init-hook 'recentf-mode)
  (add-hook 'find-file-hook (lambda () (unless recentf-mode
					 (recentf-mode)
					 (recentf-track-opened-file))))
  :config
  (add-to-list 'recentf-exclude (expand-file-name package-user-dir))
  (add-to-list 'recentf-exclude "COMMIT_EDITMSG\\'")
  (add-to-list 'recentf-exclude "bookmarks")
  )


;;在minibuffer里启用自动补全函数和变量
(icomplete-mode 1)
;;允许minibuffer自由变化其宽度大小
(setq resize-mini-windows t)


;; 清除白块
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; --------------------------------coding --------------------------------------
;; (use-package unicad
;;   :defer t)
;; (require 'unicad)
(load-file "~/.emacs.d/lisp/unicad.el")
(when *win64*
  (prefer-coding-system 'cp950)
  (prefer-coding-system 'gb2312)
  (prefer-coding-system 'cp936)
  ;;(prefer-coding-system 'gb18030)
					;(prefer-coding-system 'utf-16le-with-signature)
  (prefer-coding-system 'utf-16)
  ;; 新建文件使用utf-8-unix方式
  ;; 如果不写下面两句，只写
  ;; (prefer-coding-system 'utf-8)
  ;; 这一句的话，新建文件以utf-8编码，行末结束符平台相关
  (prefer-coding-system 'utf-8-dos)
  (prefer-coding-system 'utf-8-unix)
  )


;; --------------------------------other  --------------------------------------
;; 去除一个警告
;; (setq exec-path-from-shell-check-startup-files nil)

;; 输入法切换时不出现问题
(global-set-key (kbd "C-SPC") nil)

(when *linux*
  ;; Auto generated by cnfonts
  ;; <https://github.com/tumashu/cnfonts>
  (set-face-attribute
   'default nil
   :font (font-spec :name "-ADBO-Source Code Pro-ultrabold-normal-normal-*-*-*-*-*-m-0-iso10646-1"
		    :weight 'normal
		    :slant 'normal
		    :size 12.5))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-WenQ-文泉驿正黑-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
		:weight 'normal
		:slant 'normal
		:size 15.0)))
  )

(when *win64*
  ;; Auto generated by cnfonts
  ;; <https://github.com/tumashu/cnfonts>
  (set-face-attribute
   'default nil
   :font (font-spec :name "-outline-Consolas-bold-normal-normal-mono-*-*-*-*-c-*-iso10646-1"
		    :weight 'normal
		    :slant 'normal
		    :size 12.5))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-outline-微软雅黑-normal-normal-normal-sans-*-*-*-*-p-*-iso10646-1"
		:weight 'normal
		:slant 'normal
		:size 15.0)))

  )


;; (use-package cnfonts
;;   :ensure t
;;   ;; :defer t
;;   :config
;;   ;; 让 cnfonts 随着 Emacs 自动生效。
;;   (cnfonts-enable)
;;   )
;; (require 'cnfonts)


(use-package savehist
  ;;:ensure nil
  :init
  (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
        history-length 1000
        savehist-additional-variables '(mark-ring
                                        global-mark-ring
                                        search-ring
                                        regexp-search-ring
                                        extended-command-history)
        savehist-autosave-interval 60)
  (add-hook 'after-init-hook 'savehist-mode))


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

(use-package diminish
  :ensure t
  :config
  (diminish 'eldoc-mode)
  (diminish 'abbrev-mode)
  )

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

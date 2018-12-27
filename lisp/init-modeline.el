;;; init-modeline.el --- modeline -*- coding: utf-8-unix -*-

;;; Copyright © 2018 - 2018 mengqp.

;; Author: mengqp
;; URL:
;; Version:$(4:0.0.1)
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
;; (use-package spaceline
;;   :ensure t
;;   :config
;;   (require 'spaceline-config)
;;   (spaceline-spacemacs-theme)
;;   (use-package spaceline-all-the-icons
;;     :ensure t
;;     :after spaceline
;;     :config
;;     (spaceline-all-the-icons-theme))

;;   (spaceline-toggle-which-function-on)
;;     ;; spaceline-toggle-<name>-on

;;   )

;; (use-package smart-mode-line
;;   :ensure t
;;   :init
;;   (setq sml/theme 'dark)
;;   (setq sml/no-confirm-load-theme t)
;;   :config
;;   (sml/setup)
;;   )

;; (defun mengqp/simplify-major-mode-name ()
;;   "Return simplifyed major mode name"
;;   (let* ((major-name (format-mode-line "%m"))
;;          (replace-table '(Emacs-Lisp "Lisp"
;;                                      Shell ">"
;;                                      Org "Org"
;;                                      ))
;;          (replace-name (plist-get replace-table (intern major-name))))
;;     (if replace-name replace-name major-name
;;         )))

;; (setq evil-normal-state-tag   (propertize "[N]" 'face '((:background "DarkGoldenrod2" :foreground "black")))
;;       evil-emacs-state-tag    (propertize "[E]" 'face '((:background "SkyBlue2" :foreground "black")))
;;       evil-insert-state-tag   (propertize "[I]" 'face '((:background "chartreuse3") :foreground "white"))
;;       evil-motion-state-tag   (propertize "[M]" 'face '((:background "plum3") :foreground "white"))
;;       evil-visual-state-tag   (propertize "[V]" 'face '((:background "gray" :foreground "black")))
;;       evil-operator-state-tag (propertize "[O]" 'face '((:background "purple"))))

;; (defun buffer-encoding-abbrev ()
;;   "The line ending convention used in the buffer."
;;   (let ((buf-coding (format "%s" buffer-file-coding-system)))
;;     (if (string-match "\\(dos\\|unix\\|mac\\)" buf-coding)
;; 	(match-string 1 buf-coding)
;;       buf-coding)))

;; (defun mode-line-fill (face reserve)
;;   "Return empty space using FACE and leaving RESERVE space on the right."
;;   (unless reserve
;;     (setq reserve 20))
;;   (when (and window-system (eq 'right (get-scroll-bar-mode)))
;;     (setq reserve (- reserve 3)))
;;   (propertize " "
;; 	      'display `((space :align-to
;; 				(- (+ right right-fringe right-margin) ,reserve)))
;; 	      'face face))

;; (defun mengqp/display-mode-indent-width ()
;;   (let ((mode-indent-level
;; 	 (catch 'break
;; 	   (dolist (test spacemacs--indent-variable-alist)
;; 	     (let ((mode (car test))
;; 		   (val (cdr test)))
;; 	       (when (or (and (symbolp mode) (derived-mode-p mode))
;; 			 (and (listp mode) (apply 'derived-mode-p mode))
;; 			 (eq 't mode))
;; 		 (when (not (listp val))
;; 		   (setq val (list val)))
;; 		 (dolist (v val)
;; 		   (cond
;; 		    ((integerp v) (throw 'break v))
;; 		    ((and (symbolp v) (boundp v))
;; 		     (throw 'break (symbol-value v))))))))
;; 	   (throw 'break (default-value 'evil-shift-width)))))
;;     (concat "TS:" (int-to-string (or mode-indent-level 0)))))


;; (which-function-mode)
;; (setq-default header-line-format
;; 	      '((which-func-mode ("" which-func-format " "))))
;; (setq mode-line-misc-info
;; 	      (assq-delete-all 'which-func-mode mode-line-misc-info))

;; ;; ;; 自动刷新 vc 状态
;; ;; (setq auto-revert-check-vc-info t)

;; (setq-default mode-line-format
;; 	      (list
;; 	       ;; " %1"
;; 	       ;; '(:eval (propertize
;; 	       ;; 		(window-number-mode-line)
;; 	       ;; 		'face
;; 	       ;; 		'font-lock-type-face))
;; 	       ;; " "
;; 	       ;; '(:eval (zilongshanren/update-persp-name))

;; 	       ;; evil state
;; 	       '(:eval evil-mode-line-tag)

;; 	       ;; "%1 "
;; 	       ;; the buffer name; the file name as a tool tip
;; 	       ;; evil state
;; 	       "["
;; 	       '(:eval (propertize "%b" 'face 'font-lock-keyword-face
;; 				   'help-echo (buffer-file-name)))

;; 	       ;; line and column
;; 	       ":" ;; '%02' to set to 2 chars at least; prevents flickering
;; 	       (propertize "%l" 'face 'font-lock-type-face)
;; 	       "] "
;; 	       ;; ","
;; 	       ;; (propertize "%02c" 'face 'font-lock-type-face)
;; 	       ;; ") "


;; 	       ;; " [" ;; insert vs overwrite mode, input-method in a tooltip
;; 	       ;; '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
;; 	       ;; 			   'face 'font-lock-preprocessor-face
;; 	       ;; 			   'help-echo (concat "Buffer is in "
;; 	       ;; 					      (if overwrite-mode
;; 	       ;; 						  "overwrite"
;; 	       ;; 						"insert") " mode")))

;; 	       ;; ;; was this buffer modified since the last save?
;; 	       ;; '(:eval (when (buffer-modified-p)
;; 	       ;; 		 (concat "," (propertize "Mod"
;; 	       ;; 					 'face 'font-lock-warning-face
;; 	       ;; 					 'help-echo "Buffer has been modified"))))

;; 	       ;; ;; is this buffer read-only?
;; 	       ;; '(:eval (when buffer-read-only
;; 	       ;; 		 (concat "," (propertize "RO"
;; 	       ;; 					 'face 'font-lock-type-face
;; 	       ;; 					 'help-echo "Buffer is read-only"))))
;; 	       ;; "] "

;; 	       ;; ;; anzu
;; 	       ;; ;; anzu--mode-line-format

;; 	       ;; relative position, size of file
;; 	       ;; " ["
;; 	       ;; ;; (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
;; 	       ;; ;; "/"
;; 	       ;; (propertize "%I" 'face 'font-lock-constant-face) ;; size
;; 	       ;; "] "

;; 	       ;; the current major mode for the buffer.
;; 	       ;; '(:eval (propertize "%m" 'face 'font-lock-string-face
;; 	       ;; 			   'help-echo buffer-file-coding-system))
;; 	        '(:eval (propertize (mengqp/simplify-major-mode-name) 'face 'font-lock-string-face
;;                       'help-echo buffer-file-coding-system))


;; 	       ;; "%1 "
;; 	       ;; my-flycheck-mode-line
;; 	       ;; "%1 "

;; 	       ;; minor modes
;; 	       '(:eval (when (> (window-width) 90)
;; 	                 minor-mode-alist))
;; 	       " "
;; 	       ;; git info
;; 	       '(:eval (when (> (window-width) 120)
;; 			 `(vc-mode vc-mode)))

;; 	       " "

;; 	       ;; global-mode-string goes in mode-line-misc-info
;; 	       '(:eval (when (> (window-width) 120)
;; 			 mode-line-misc-info))

;; 	       (mode-line-fill 'mode-line 20)

;; 	       ;; '(:eval (mengqp/display-mode-indent-width))


;; 	       mode-line-end-spaces

;; 	       " "
;; 	       '(:eval (when (> (window-width) 80)
;; 			 (buffer-encoding-abbrev)))
;; 	       ;; '(:eval (propertize (format "%s" buffer-file-coding-system) 'face 'font-lock-string-face) )
;; 	       " "

;; 	       ;; add the time, with the date and the emacs uptime in the tooltip
;; 	       '(:eval (propertize (format-time-string "%H:%M")
;; 				   'help-echo
;; 				   (concat (format-time-string "%c; ")
;; 					   (emacs-uptime "Uptime:%hh"))))
;; ))

(use-package moody
  :ensure t
  :disabled t
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(use-package awesome-tray
  :init
  :disabled t
  (setq awesome-tray-mode-line-active-color "Gray")
  (setq awesome-tray-active-modules '("git" "mode-name" "location"))
  (add-hook 'after-init-hook 'awesome-tray-mode)
  :config
  )

(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-init)
  :config
  ;; How tall the mode-line should be (only respected in GUI Emacs).
  (setq doom-modeline-height 15)

  ;; How wide the mode-line bar should be (only respected in GUI Emacs).
  (setq doom-modeline-bar-width 2)
  ;; Determines the style used by `doom-modeline-buffer-file-name'.
  ;;
  ;; Given ~/Projects/FOSS/emacs/lisp/comint.el
  ;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
  ;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
  ;;   truncate-with-project => emacs/l/comint.el
  ;;   truncate-except-project => ~/P/F/emacs/l/comint.el
  ;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
  ;;   truncate-all => ~/P/F/e/l/comint.el
  ;;   relative-from-project => emacs/lisp/comint.el
  ;;   relative-to-project => lisp/comint.el
  ;;   file-name => comint.el
  ;;   buffer-name => comint.el<2> (uniquify buffer name)
  ;;
  ;; If you are expereicing the laggy issue, especially while editing remote files
  ;; with tramp, please try `file-name' style.
  ;; Please refer to https://github.com/bbatsov/projectile/issues/657.
  (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)

  ;; What executable of Python will be used (if nil nothing will be showed).
  (setq doom-modeline-python-executable "python")

  ;; Whether show `all-the-icons' or not (if nil nothing will be showed).
  ;; The icons may not be showed correctly on Windows. Disable to make it work.
  (setq doom-modeline-icon t)

  ;; Whether show the icon for major mode. It respects `doom-modeline-icon'.
  (setq doom-modeline-major-mode-icon t)

  ;; Display color icons for `major-mode'. It respects `all-the-icons-color-icons'.
  (setq doom-modeline-major-mode-color-icon nil)

  ;; Whether display minor modes or not. Non-nil to display in mode-line.
  (setq doom-modeline-minor-modes nil)

  ;; Whether display perspective name or not. Non-nil to display in mode-line.
  (setq doom-modeline-persp-name t)

  ;; Whether display `lsp' state or not. Non-nil to display in mode-line.
  (setq doom-modeline-lsp t)

  ;; Whether display github notifications or not. Requires `ghub` package.
  (setq doom-modeline-github nil)

  ;; The interval of checking github.
  (setq doom-modeline-github-interval (* 30 60))

  )

;; (use-package feebleline
;;   :ensure t
;;   :custom
;;   (feebleline-show-git-branch t)
;;   (feebleline-show-dir nil)
;;   (feebleline-show-directory nil)
;;   (feebleline-show-time nil)
;;   (feebleline-show-previous-buffer nil)
;;   :config
;;   (feebleline-mode 1))

(provide 'init-modeline)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-modeline.el ends here

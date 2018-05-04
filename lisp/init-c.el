;;; init-c.el --- xxx -*- coding: utf-8-unix -*-

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

(use-package compile
  :defer t
  :config
  (defun mengqp/close-compilation-window ()
    "Close the window containing the '*compilation*' buffer."
    (interactive)
    (when compilation-last-buffer
      (delete-windows-on compilation-last-buffer)))
  )

(defvar gdb-many-windows t)

(use-package google-c-style
  :ensure t
  :defer t
  :init
  (progn
;;; 定义tab和缩进
    (defun mengqp/google-c-mode-hook ()
      (setq-default c-basic-offset 4          ;; 基本缩进宽度
	    indent-tabs-mode nil       ;; 禁止空格替换Tab
	    tab-width 4
	    ))     ;; 默认Tab宽度

    (add-hook 'c-mode-common-hook 'google-set-c-style)
    (add-hook 'c++-mode-common-hook 'google-set-c-style)
    (add-hook 'c-mode-common-hook 'google-make-newline-indent)
    (add-hook 'c++-mode-common-hook 'google-make-newline-indent)
    (add-hook 'c-mode-hook 'mengqp/google-c-mode-hook)
    (add-hook 'c++-mode-hook 'mengqp/google-c-mode-hook)
    )
  )

(use-package aggressive-indent
  :ensure t
  :defer t
  :diminish aggressive-indent-mode
  :init
  (add-hook 'c-mode-hook #'aggressive-indent-mode)
  (add-hook 'c++-mode-hook #'aggressive-indent-mode)
  :config
  (add-to-list
   'aggressive-indent-dont-indent-if
   '(and (derived-mode-p 'c++-mode)
	 (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
			     (thing-at-point 'line)))))
  (add-to-list
   'aggressive-indent-dont-indent-if
   '(and (derived-mode-p 'c-mode)
  	 (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
  			     (thing-at-point 'line)))))


  )

(use-package highlight-parentheses
  :ensure t
  :diminish highlight-parentheses-mode
  :init
  (add-hook 'c-mode-hook #'highlight-parentheses-mode)
  (add-hook 'c++-mode-hook #'highlight-parentheses-mode)

  )


(use-package xcscope
  :ensure t
  :defer t
  :init
  (add-hook 'c++-mode-hook 'cscope-minor-mode)
  (add-hook 'c-mode-hook 'cscope-minor-mode)
  :config
  (cscope-setup)
  (use-package helm-cscope
    :ensure t
    :defer t)

  (general-define-key :states '(normal motion)
		      :keymaps '(c++-mode-map
				 c-mode-map)
		      :prefix ";"
		      "s" 'helm-cscope-find-this-symbol
		      "d" 'helm-cscope-find-global-definition
		      "c" 'helm-cscope-find-called-function
		      "C" 'helm-cscope-find-calling-this-function
		      "i" 'cscope-index-files
		      )

  )

;; (use-package irony
;;   :ensure t
;;   :defer t
;;   :diminish irony-mode
;;   :init
;;   (add-hook 'c++-mode-hook 'irony-mode)
;;   (add-hook 'c-mode-hook 'irony-mode)
;;   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;;   :config
;;   (use-package company-irony
;;     :ensure t
;;     :config
;;     (eval-after-load 'company
;;       '(add-to-list 'company-backends 'company-irony))
;;     )
;;   (use-package flycheck-irony
;;     :ensure t
;;     :config
;;     (eval-after-load 'flycheck
;;       '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;;     )

;;   ;; (use-package company-irony-c-headers
;;   ;;   :ensure t
;;   ;;   :config
;;   ;;   (eval-after-load 'company
;;   ;;   '(add-to-list
;;   ;;     'company-backends '(company-irony-c-headers company-irony)))
;;   ;;   )

;;   )


(when *linux*
  (use-package ycmd
    :ensure t
    :defer t
    :diminish ycmd-mode
    :init
    (add-hook 'c++-mode-hook 'ycmd-mode)
    (add-hook 'c-mode-hook 'ycmd-mode)

    (set-variable 'ycmd-server-command '("python" "/root/DotFiles/ycmd/ycmd"))
    (set-variable 'ycmd-global-config "~/DotFiles/ycmd/cpp/ycm/.ycm_extra_conf.py")
    (setq ycmd-extra-conf-handler (quote load))
    (setq ycmd-startup-timeout 10)

    :config
    (use-package company-ycmd
      :ensure t
      :config
      (company-ycmd-setup)
      (add-to-list 'company-backends '(company-yasnippet  company-ycmd))
      )
    (use-package flycheck-ycmd
      :ensure t
      :config
      (flycheck-ycmd-setup)
      (when (not (display-graphic-p))
	(setq flycheck-indication-mode nil))
      )

    (general-define-key :states '(normal motion)
			:keymaps '(c++-mode-map
				   c-mode-map)
			:prefix ";"
			"g" 'ycmd-goto
			)

    )
  )

(use-package dynamic-spaces
  :ensure t
  :init
  (add-hook 'c-mode-common-hook 'dynamic-spaces-mode)
  (add-hook 'c++-mode-common-hook 'dynamic-spaces-mode)
  )


;; (use-package cquery
;;   :ensure t
;;   :init
;;   (add-hook 'c++-mode-hook #'lsp-cquery-enable)
;;   (add-hook 'c-mode-hook #'lsp-cquery-enable)
;;   :config

;;   (use-package company-lsp
;;     :ensure t
;;     :config
;;     (push 'company-lsp company-backends)
;;     )


;;   (use-package lsp-ui
;;     :ensure t
;;     :init
;;     (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;;     )

;;   (setq cquery-executable "/usr/bin/cquery")
;;   (setq cquery-project-roots '("opt/qt-everywhere-opensource-src-4.7.3/" "~/Dev/llvm"))
;;   (setq cquery-extra-init-params
;; 	'(:cacheFormat "msgpack" :completion (:detailedLabel t) :xref (:container t)
;; 		       :diagnostics (:frequencyMs 5000)))

;;   (use-package ivy-xref
;;     :ensure t
;;     :init
;;     (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))
;;   )

(general-define-key :states '(normal motion)
		    :keymaps '(c++-mode-map
			       c-mode-map)
		    :prefix ";"
		    "b" 'gdb
		    )

;; ;;; 设置编码风格
;; (require 'google-c-style)
;; ;;; 定义tab和缩进
;; (defun mengqp/google-c-mode-hook ()
;;   (setq c-basic-offset 4          ;; 基本缩进宽度
;;         indent-tabs-mode nil       ;; 禁止空格替换Tab
;;         tab-width 4
;;         ))     ;; 默认Tab宽度

;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c++-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)
;; (add-hook 'c++-mode-common-hook 'google-make-newline-indent)
;; (add-hook 'c-mode-hook 'mengqp/google-c-mode-hook)
;; (add-hook 'c++-mode-hook 'mengqp/google-c-mode-hook)


;;;; set gdb multi-windows when open

;;;; customize the gdb multi-windows
;; (defadvice gdb-setup-windows (after my-setup-gdb-windows activate)
;;   "my gdb UI"
;;   (gdb-get-buffer-create 'gdb-stack-buffer)
;;   (set-window-dedicated-p (selected-window) nil)
;;   (switch-to-buffer gud-comint-buffer)
;;   (delete-other-windows)
;;   (let ((win0 (selected-window))
;;         (win1 (split-window nil nil 'left))  ;; code and output
;;         (win2 (split-window-below (/ (* (window-height) 3) 4)))  ;; stack
;;         )
;;     (select-window win2)
;;     (gdb-set-window-buffer (gdb-stack-buffer-name))
;;     (select-window win1)
;;     (set-window-buffer
;;      win1
;;      (if gud-last-last-frame
;;          (gud-find-file (car gud-last-last-frame))
;;        (if gdb-main-file
;;            (gud-find-file gdb-main-file)
;;          ;; Put buffer list in window if we
;;          ;; can't find a source file.
;;          (list-buffers-noselect))))
;;     (setq gdb-source-window (selected-window))
;;     (let ((win3 (split-window nil (/ (* (window-height) 3) 4))))  ;; io
;;       (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-inferior-io) nil win3))
;;     (select-window win0)
;;     ))

;; (setq gud-gdb-history t)



(provide 'init-c)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-c.el ends here

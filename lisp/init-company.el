;;; init-company.el --- xxx -*- coding: utf-8-unix -*-

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

(use-package company
  :ensure t
  :defer t
  :commands (company company-select-next)
  :commands (company company-select-previous)
  :commands (company company-search-candidates)
  :diminish company-mode
  :hook (after-init . global-company-mode)
  :bind
  (("M-/" . company-complete)
   ;; ("C-c C-y" . company-yasnippet)
   ;; ("<backtab>" . company-yasnippet)
   :map company-active-map
   ("C-p" . company-select-previous)
   ("C-n" . company-select-next)
   ("<tab>" . company-complete-common-or-cycle)
   ;; ("C-c C-y" . my-company-yasnippet)
   :map company-search-map
   ("C-p" . company-select-previous)
   ("C-n" . company-select-next))
  :init
  ;; 设置等待时间
  (setq company-idle-delay 0.2)
  ;; 补全起始长度
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t)

  :config
  (use-package company-posframe
    :ensure t
    :diminish company-posframe-mode
    :config
    (company-posframe-mode 1)
    (use-package desktop
      :config
      (push '(company-childframe-mode . nil)
	    desktop-minor-mode-table
	    ))
    )

  ;; With use-package:
  (use-package company-box
    :ensure t
    :disabled t
    :hook (company-mode . company-box-mode))

  (use-package company-english-helper
    :ensure nil
    :disabled t
    :defer t
    :commands (company-english-helper toggle-company-english-helper)
    )

  (use-package company-ctags
    :ensure t
    :disabled t
    :defer t
    )

  (use-package company-tabnine
    :disabled t
    :ensure t
    :config
    (add-to-list 'company-backends #'company-tabnine)

    (defun company//sort-by-tabnine (candidates)
      (if (or (functionp company-backend)
	      (not (and (listp company-backend) (memq 'company-tabnine company-backend))))
	  candidates
	(let ((candidates-table (make-hash-table :test #'equal))
	      candidates-1
	      candidates-2)
	  (dolist (candidate candidates)
	    (if (eq (get-text-property 0 'company-backend candidate)
		    'company-tabnine)
		(unless (gethash candidate candidates-table)
		  (push candidate candidates-2))
	      (push candidate candidates-1)
	      (puthash candidate t candidates-table)))
	  (setq candidates-1 (nreverse candidates-1))
	  (setq candidates-2 (nreverse candidates-2))
	  (nconc (seq-take candidates-1 2)
		 (seq-take candidates-2 2)
		 (seq-drop candidates-1 2)
		 (seq-drop candidates-2 2)))))

    (add-to-list 'company-transformers 'company//sort-by-tabnine t)
    ;; `:separate`  使得不同 backend 分开排序
    (add-to-list 'company-backends '(company-lsp :with company-tabnine :separate))

    ;; The free version of TabNine is good enough,
    ;; and below code is recommended that TabNine not always
    ;; prompt me to purchase a paid version in a large project.
    (defadvice company-echo-show (around disable-tabnine-upgrade-message activate)
      (let ((company-message-func (ad-get-arg 0)))
	(when (and company-message-func
		   (stringp (funcall company-message-func)))
	  (unless (string-match "The free version of TabNine only indexes up to" (funcall company-message-func))
	    ad-do-it))))
    )
  )

;; (use-package eacl
;;   :disabled t
;;   :ensure t
;;   )



;;颜色
;; (require 'color)

;; (let ((bg (face-attribute 'default :background)))
;;   (custom-set-faces
;;    `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
;;    `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
;;    `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
;;    `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
;;    `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

(provide 'init-company)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-company.el ends here

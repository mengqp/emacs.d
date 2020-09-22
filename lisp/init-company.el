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
  :diminish company-mode
  :hook ((prog-mode org-mode) . company-mode)
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
  (with-eval-after-load 'yasnippet
    (defun company-backend-with-yas (backend)
      "Add `yasnippet' to company backend."
      (if (and (listp backend) (member 'company-yasnippet backend))
          backend
        (append (if (consp backend) backend (list backend))
                '(:with company-yasnippet))))

    (defun my-company-enbale-yas (&rest _)
      "Enable `yasnippet' in `company'."
      (setq company-backends (mapcar #'company-backend-with-yas company-backends)))
    ;; Enable in current backends
    (my-company-enbale-yas)
    ;; Support `company-lsp'
    (advice-add #'lsp--auto-configure :after #'my-company-enbale-yas)

    (defun my-company-yasnippet-disable-inline (fun command &optional arg &rest _ignore)
      "Enable yasnippet but disable it inline."
      (if (eq command 'prefix)
          (when-let ((prefix (funcall fun 'prefix)))
            (unless (memq (char-before (- (point) (length prefix))) '(?. ?> ?\())
              prefix))
        (progn
          (when (and (bound-and-true-p lsp-mode)
                     arg (not (get-text-property 0 'yas-annotation-patch arg)))
            (let* ((name (get-text-property 0 'yas-annotation arg))
                   (snip (format "%s (Snippet)" name))
                   (len (length arg)))
              (put-text-property 0 len 'yas-annotation snip arg)
              (put-text-property 0 len 'yas-annotation-patch t arg)))
          (funcall fun command arg))))
    (advice-add #'company-yasnippet :around #'my-company-yasnippet-disable-inline))

  (defun my-company-yasnippet--doc (arg)
    (let ((template (get-text-property 0 'yas-template arg))
          (mode major-mode)
          (file-name (buffer-file-name)))
      (with-current-buffer (company-doc-buffer)
        (let ((inhibit-message t)
              (buffer-file-name file-name))
          (ignore-errors
            (yas-minor-mode 1)
            (yas-expand-snippet (yas--template-content template))
            (funcall mode)
            (font-lock-ensure)))
        (current-buffer))))
  (advice-add #'company-yasnippet--doc :override #'my-company-yasnippet--doc)

  (use-package company-posframe
    :ensure t
    :defer t
    :diminish company-posframe-mode
    :config
    (company-posframe-mode 1)
    (use-package desktop
      :defer t
      :config
      (push '(company-childframe-mode . nil)
	    desktop-minor-mode-table
	    ))
    )

  ;; With use-package:
  (use-package company-box
    :ensure t
    :defer t
    :disabled t
    :hook (company-mode . company-box-mode))

  (use-package company-ctags
    :ensure t
    :disabled t
    :defer t
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

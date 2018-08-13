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
  (:map company-active-map
	("M-n" . nil)
	("M-p" . nil)
	("C-p" . company-select-previous)
	("C-n" . company-select-next)
	;; ("C-s" . company-search-candidates)
	)
  :init
  ;; (add-hook 'after-init-hook 'global-company-mode)
  ;; 设置等待时间
  ;; (setq company-idle-delay 0.08)
  (setq company-idle-delay 0.1)
  ;; 补全起始长度
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t)

  :config
  ;; (global-company-mode t)
  ;; (add-to-list 'company-backends '(company-yasnippet))

  ;; (define-key company-active-map (kbd "M-n") nil)
  ;; (define-key company-active-map (kbd "M-p") nil)
  ;; (define-key company-active-map (kbd "C-n") #'company-select-next)
  ;; (define-key company-active-map (kbd "C-p") #'company-select-previous)
  ;; (define-key company-active-map (kbd "C-s") #'company-search-candidates)

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

  (use-package company-english-helper
    :ensure nil
    :defer t
    :commands (company-english-helper toggle-company-english-helper)
    )
  )

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

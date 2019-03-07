;;; init-ycmd.el --- xxx -*- coding: utf-8-unix -*-

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
(use-package ycmd
  :ensure t
  :defer t
  :diminish ycmd-mode
  ;; :disabled t
  :init
  (add-hook 'c++-mode-hook 'ycmd-mode)
  (add-hook 'c-mode-hook 'ycmd-mode)

  (set-variable 'ycmd-server-command '("python" "/usr/share/ycmd/ycmd"))
  ;; (set-variable 'ycmd-global-config "~/DotFiles/ycmd/cpp/ycm/.ycm_extra_conf.py")
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

  (use-package ivy-ycmd
    :ensure t)

  ;; (use-package ycmd-eldoc
  ;;   :init
  ;;   (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)
  ;;   )

  (general-define-key :states '(normal motion)
		      :keymaps '(c++-mode-map
				 c-mode-map)
		      :prefix ";"
		      "g" 'ycmd-goto
		      )

  )
(provide 'init-ycmd)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ycmd.el ends here

;;; init-lsp-cquery.el --- xxx -*- coding: utf-8-unix -*-

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
(use-package cquery
  :ensure t
  :disabled t
  :init
  (add-hook 'c++-mode-hook #'lsp-cquery-enable)
  (add-hook 'c-mode-hook #'lsp-cquery-enable)
  :config

  (use-package company-lsp
    :ensure t
    :config
    (push 'company-lsp company-backends)
    )


  (use-package lsp-ui
    :ensure t
    :init
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    )

  (with-eval-after-load 'projectile
  (setq projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json"
                  ".cquery")
                projectile-project-root-files-top-down-recurring)))

  (setq cquery-executable "/usr/bin/cquery")
  ;; (setq cquery-project-roots '("opt/qt-everywhere-opensource-src-4.7.3/" "~/Dev/llvm"))
  (setq cquery-extra-init-params
	'(:cacheFormat "msgpack" :completion (:detailedLabel t) :xref (:container t)
		       :diagnostics (:frequencyMs 5000)))

  (use-package ivy-xref
    :ensure t
    :init
    (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))
  )

(provide 'init-lsp-cquery)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-lsp-cquery.el ends here

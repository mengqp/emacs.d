;;; init-python.el --- xxx -*- coding: utf-8-unix -*-

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
;; (use-package elpy
;;   :ensure t
;;   :defer t
;;   :diminish elpy-mode
;;   :init
;;   (add-hook 'python-mode-hook 'elpy-mode)
;;   :config
;;   (elpy-enable)

;;   ;; (use-package indent-tools
;;   ;;   :ensure t
;;   ;;   :config
;;   ;;   (indent-tools-hydra/body)
;;   ;;   )
;;   )
;; (defun mengqp/google-python-mode-hook ()
;;   (set (make-local-variable 'tab-width) 4)
;;   ;; (setq-default indent-tabs-mode nil)
;;   ;; (setq indent-tabs-mode nil       ;; 禁止空格替换Tab
;;   ;; 	tab-width 4
;;   ;; 	)     ;; 默认Tab宽度
;;   )


;; (add-hook 'python-mode-hook 'mengqp/google-python-mode-hook)

;; (smart-tabs-advice python-indent-line-1 python-indent)
(use-package python
  :ensure nil
  ;; :disabled t
  :defer t
  :hook (inferior-python-mode . (lambda ()
                                  (process-query-on-exit-flag
                                   (get-process "Python"))))
  :init
  (add-hook 'python-mode-hook
	    (lambda ()
	      (setq indent-tabs-mode nil)
	      (setq tab-width 4)))
  ;; (add-hook 'python-mode-hook
  ;;         (lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))
  ;; for executable of language server, if it's not symlinked on your PATH
  ;; (setq lsp-python-ms-executable
  ;;     "/usr/share/licenses/python-language-server~/python-language-server/output/bin/Release/osx-x64/publish/Microsoft.Python.LanguageServer")
  ;; Disable readline based native completion
  (setq python-shell-completion-native-enable nil)
  :config
  ;; Default to Python 3. Prefer the versioned Python binaries since some
  ;; systems stupidly make the unversioned one point at Python 2.
  (when (and (executable-find "python3")
             (string= python-shell-interpreter "python"))
    (setq python-shell-interpreter "python3"))
  ;; Env vars
  (with-eval-after-load 'exec-path-from-shell
    (exec-path-from-shell-copy-env "PYTHONPATH"))
  ;; Live Coding in Python
  (use-package live-py-mode
    :ensure t
    ))



;; (use-package lsp-python
;;   :ensure t
;;   :commands (lsp-python-enable)
;;   :defer t
;;   :init
;;   (add-hook 'python-mode-hook #'lsp-python-enable)
;;   :config

;;   (general-define-key :states '(normal motion)
;; 		      :keymaps '(python-mode-map)
;; 		      :prefix ";"
;; 		      "g" 'xref-find-definitions
;; 		      "r" 'xref-find-references
;; 		      "m" 'lsp-ui-imenu
;; 		      )
;;   )



(provide 'init-python)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-python.el ends here

;;; init-gdb.el --- gdb -*- coding: utf-8-unix -*-

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

;; set gdb multi-windows when open
(use-package gud
  :ensure nil
  ;; :disabled t
  :config
  (gud-tooltip-mode 1)
  ;; ;; customize the gdb multi-windows
  ;; (defadvice gdb-setup-windows (after my-setup-gdb-windows activate)
  ;;   "My gdb UI."
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
  ;; 	 (if gdb-main-file
  ;;            (gud-find-file gdb-main-file)
  ;;          ;; Put buffer list in window if we
  ;;          ;; can't find a source file.
  ;;          (list-buffers-noselect))))
  ;;     (setq gdb-source-window (selected-window))
  ;;     (let ((win3 (split-window nil (/ (* (window-height) 3) 4))))  ;; io
  ;; 	(gdb-set-window-buffer (gdb-get-buffer-create 'gdb-inferior-io) nil win3))
  ;;     (select-window win0)
  ;;     ))

  ;; ;; (setq gud-gdb-history t)
  ;; (defvar gdb-many-windows t)

  ;; (general-define-key :states '(normal motion)
  ;; 		      :keymaps '(c++-mode-map
  ;; 				 c-mode-map)
  ;; 		      :prefix ";"
  ;; 		      "b" 'gdb
  ;; 		      )

  (general-define-key :states '(normal motion)
		      :keymaps '(c++-mode-map
				 c-mode-map)
		      ;; :keymaps '(gud-mode-map)
		      :prefix ";"
		      "b" 'gud-break
		      "n" 'gud-next
		      "s" 'gud-stepi
		      "f" 'gud-finish
		      "r" 'gud-go
		      "c" 'gud-cout
		      "u" 'gud-until
		      "d" 'gud-until
		      )


  )



(use-package realgud
  :disabled t
  :ensure t
  :defer t
  )

(use-package dap-mode
  :ensure t
  :defer t
  :disabled t
  :commands (lsp-treemacs lsp-treemacs--make-ref-item)
  :hook ((c-mode c++-mode objc-mode python-mode) . #'dap-mode)
  :init
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (tooltip-mode 1)
  (dap-ui-controls-mode 1)
  (setq dap-auto-configure-features '(sessions locals breakpoints expressions controls))
  :config
  (require 'dap-lldb)
  (add-hook 'dap-stopped-hook
	  (lambda (arg) (call-interactively #'dap-hydra)))
  (dap-register-debug-template
   "EM761_BV2"
   (list :type "lldb"
	 :args ""
	 :cwd "/media/sf_code/EM761-BV2/02src/01v2/Debug"
	 ;; :env '(("DEBUG" . "1"))
	 :program "EM761_BV2"
	 ;; :request "launch"
	 :name "EM761_BV2"))
  ;; (setq dap-lldb-debug-program "/usr/bin/lldb-server")
  ;; (setq dap-lldb-debugged-program-function "/media/sf_workspace/EM761_BV2/02_src/V2/02src/01v2/Debug/EM761_BV2")
  )


(provide 'init-gdb)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-gdb.el ends here

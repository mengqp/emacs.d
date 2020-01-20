;;; init-yasnippet.el --- xxx -*- coding: utf-8-unix -*-

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


(use-package yasnippet
  :ensure t
  :defer t
  :bind
  ( "M-j" . 'yas-expand)
  :commands (yasnippet yas-reload-all)
  :commands (yasnippet yas-expand)
  :commands (yasnippet yas-next-field)
  :commands (yasnippet yas-abort-snippet)
  :commands (init-yasnippet do-yas-expand)
  :commands (init-yasnippet check-expansion)
  :commands (company company-abort)
  :commands (company company-complete-selection)
  :diminish yas-minor-mode
  :init
  (setq yas-snippet-dirs
	'("~/.emacs.d/mysnippets"
	  "~/.emacs.d/site-lisp/yasnippet-snippets/snippets"
	  ))
  (progn
    (add-hook 'org-mode-hook #'yas-minor-mode)
    (add-hook 'text-mode-hook #'yas-minor-mode)
    (add-hook 'shell-script-mode #'yas-minor-mode)
    (add-hook 'prog-mode-hook #'yas-minor-mode)
    )
  :config
  ;; (yas-minor-mode)
  ;; (add-to-list 'company-backends 'company-yasnippet)
  ;; (message "yasnippet")
  (yas-reload-all)
  (setq yas-prompt-functions '(yas-completing-prompt))

  (use-package ivy-yasnippet
    :ensure t
    :defer t
    :bind (
	   ("C-c C-y" . ivy-yasnippet)
	   )
    )
  )

(provide 'init-yasnippet)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-yasnippet.el ends here

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
  (progn
    (add-hook 'org-mode-hook #'yas-minor-mode)
    (add-hook 'c-mode-hook #'yas-minor-mode)
    (add-hook 'c++-mode-hook #'yas-minor-mode)
    (add-hook 'git-commit-mode-hook #'yas-minor-mode)
    (add-hook 'lisp-mode-hook #'yas-minor-mode)
    (add-hook 'emacs-lisp-mode-hook #'yas-minor-mode)

    )

  (setq yas-snippet-dirs
	'("~/.emacs.d/mysnippets"))

  :config
  ;; (add-to-list 'company-backends 'company-yasnippet)
  ;; (message "yasnippet")
  (yas-reload-all)
  (setq yas-prompt-functions '(yas-completing-prompt))
  (general-define-key
   :keymap '(yas-minor-mode-map)
   "M-j" 'yas-expand
   )
  (use-package ivy-yasnippet
    :ensure t
    ;; :config
    ;; (set ivy-yasnippet-expand-keys 'nil)
    )


  ;; (use-package helm-c-yasnippet
  ;;   :ensure t
  ;;   :defer t
  ;;   :init
  ;;   (setq helm-yas-space-match-any-greedy t)
  ;;   )

  ;; (defun check-expansion ()
  ;;   (save-excursion
  ;;     (if (looking-at "\\_>") t
  ;; 	(backward-char 1)
  ;; 	(if (looking-at "\\.") t
  ;; 	  (backward-char 1)
  ;; 	  (if (looking-at "->") t nil)))))

  ;; (defun do-yas-expand ()
  ;;     (yas-expand))
  ;;   ;; (let ((yas/fallback-behavior 'return-nil))
  ;;   ;;   (yas-expand)))

  ;; (defun tab-indent-or-complete ()
  ;;   (interactive)
  ;;   (cond
  ;;    ((minibufferp)
  ;;     (minibuffer-complete))
  ;;    (t
  ;;     (indent-for-tab-command)
  ;;     (if (or (not yas-minor-mode)
  ;; 	      (null (do-yas-expand)))
  ;; 	  (if (check-expansion)
  ;; 	      (progn
  ;; 		(company-manual-begin)
  ;; 		(if (null company-candidates)
  ;; 		    (progn
  ;; 		      (company-abort) ;; 		      (indent-for-tab-command)))))))))

  ;; (defun tab-complete-or-next-field ()
  ;;   (interactive)
  ;;   (if (or (not yas-minor-mode)
  ;; 	    (null (do-yas-expand)))
  ;; 	(if company-candidates
  ;; 	    (company-complete-selection)
  ;; 	  (if (check-expansion)
  ;; 	      (progn
  ;; 		(company-manual-begin)
  ;; 		(if (null company-candidates)
  ;; 		    (progn
  ;; 		      (company-abort)
  ;; 		      (yas-next-field))))
  ;; 	    (yas-next-field)))))

  ;; (defun expand-snippet-or-complete-selection ()
  ;;   (interactive)
  ;;   (if (or (not yas-minor-mode)
  ;; 	    (null (do-yas-expand))
  ;; 	    (company-abort))
  ;; 	(company-complete-selection)))

  ;; (defun abort-company-or-yas ()
  ;;   (interactive)
  ;;   (if (null company-candidates)
  ;; 	(yas-abort-snippet)
  ;;     (company-abort)))

  ;; ;; (global-set-key [tab] 'tab-indent-or-complete)
  ;; ;; (global-set-key (kbd "TAB") 'tab-indent-or-complete)
  ;; ;; (global-set-key [(control return)] 'company-complete-common)

  ;; ;; (define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
  ;; ;; (define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)

  ;; ;; (define-key yas-minor-mode-map [tab] nil)
  ;; ;; (define-key yas-minor-mode-map (kbd "TAB") nil)

  ;; ;; (define-key yas-keymap [tab] 'tab-complete-or-next-field)
  ;; ;; (define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
  ;; ;; (define-key yas-keymap [(control tab)] 'yas-next-field)
  ;; ;; (define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)

  ;; (define-key evil-insert-state-map (kbd "M-j") 'yas-expand)
  ;; ;; (define-key evil-emacs-state-map (kbd "M-j") 'yas-expand)
  ;; (define-key evil-insert-state-map (kbd "TAB") 'tab-indent-or-complete)
  ;; (define-key evil-insert-state-map (kbd "TAB") 'tab-indent-or-complete)
  ;; (global-set-key [(control return)] 'company-complete-common)

  ;; (define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
  ;; (define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)

  ;; (define-key yas-minor-mode-map [tab] nil)
  ;; (define-key yas-minor-mode-map (kbd "TAB") nil)

  ;; (define-key yas-keymap [tab] 'tab-complete-or-next-field)
  ;; (define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
  ;; (define-key yas-keymap [(control tab)] 'yas-next-field)
  ;; (define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)
  )

(provide 'init-yasnippet)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-yasnippet.el ends here

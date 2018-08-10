;;; init-evil.el --- xxx -*- coding: utf-8-unix -*-

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
(use-package evil
  :ensure t
  :diminish evil-mode
  :defer t
  :init
  (setq evil-want-integration nil)
  ;; (add-hook 'after-init-hook #'evil-mode)
  (add-hook 'prog-mode-hook #'evil-mode)
  :config
  (define-key evil-normal-state-map (kbd "go") 'ace-jump-char-mode)
  (define-key evil-ex-completion-map (kbd "C-a") 'move-beginning-of-line)
  (define-key evil-ex-completion-map (kbd "C-b") 'backward-char)
  (define-key evil-ex-completion-map (kbd "M-p") 'previous-complete-history-element)
  (define-key evil-ex-completion-map (kbd "M-n") 'next-complete-history-element)
  (define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
  (define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
  (define-key evil-insert-state-map (kbd "C-k") 'kill-line)
  (define-key evil-insert-state-map (kbd "C-n") 'next-line)
  (define-key evil-insert-state-map (kbd "C-p") 'previous-line)



  ;; (general-define-key :states '(normal motion)
  ;; 		      :keymaps '(evil-mode-map)
  ;; 		      "f" 'ace-jump-char-mode
  ;; 		      )


  ;;实现代码折叠
  (use-package hideshow
    :defer t
    :diminish hs-minor-mode
    :commands (evil-states evil-emacs-state)
    :init
    (add-hook 'prog-mode-hook
	      (lambda()
		(hs-minor-mode 1)
		))
    (add-hook 'dired-mode-hook
	      (lambda( )
		(evil-emacs-state)))
    )

  (use-package evil-numbers
    :ensure t
    :defer t
    :init
    ;; +/- 代替
    (define-key evil-normal-state-map (kbd "+") 'evil-numbers/inc-at-pt)
    (define-key evil-normal-state-map (kbd "-") 'evil-numbers/dec-at-pt)
    )


  (use-package evil-visualstar
    :ensure t
    :init
    (global-evil-visualstar-mode)
    )


  (use-package evil-matchit
    :ensure t
    :diminish evil-matchit-mode
    :init
    (defvar evilmi-ignore-comments nil)
    :config
    (global-evil-matchit-mode 1)
    )

  (use-package evil-escape
    :ensure t
    :diminish evil-escape-mode
    :init
    (setq-default evil-escape-key-sequence "jk")
    (setq-default evil-escape-delay 0.2)
    :config
    (evil-escape-mode t)
    )

  (use-package evil-mc
    :ensure t
    )

  (use-package evil-nerd-commenter
    :ensure t)

  (use-package evil-snipe
    :ensure t
    :diminish evil-snipe-mode evil-snipe-override-mode evil-snipe-local-mode
    :init
    (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)
    :config
    (evil-snipe-mode +1)
    (evil-snipe-override-mode +1)
    )

  (use-package evil-mc
    :ensure t
    :defer t
    :diminish evil-mc-mode
    :after evil-mode
    :config
    (global-evil-mc-mode 1)
    )

  ;; (use-package evil-collection
  ;;   :after evil
  ;;   :ensure t
  ;;   ;; :custom (evil-collection-setup-minibuffer t)
  ;;   :custom (evil-collection-company-use-tng nil)
  ;;   ;; :custom (evil-collection-outline-bind-tab-p nil)
  ;;   ;; :custom (evil-collection-term-sync-state-and-mode-p nil)
  ;;   ;; :custom (evil-collection-setup-debugger-keys nil)
  ;;   :init
  ;;   (evil-collection-init)
  ;;   )

  (use-package evil-smartparens
    :ensure t
    :diminish evil-smartparens-mode
    :init
    (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
    )

  )

(provide 'init-evil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-evil.el ends here

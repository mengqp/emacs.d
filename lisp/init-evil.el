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
;; (global-set-key (kbd "s-z") 'evil-local-mode)

(use-package evil
  :ensure t
  :diminish evil-mode
  :commands(evil-core evil-local-mode )
  :defer t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (add-hook 'after-init-hook #'evil-mode)
  :config
  ;; remove all keybindings from insert-state keymap,it is VERY VERY important
  (setcdr evil-insert-state-map nil)
  ;;;把 emacs 模式下的按键绑定到 Insert 模式下
  (define-key evil-insert-state-map
    (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
  ;; but [escape] should switch back to normal state
  (define-key evil-insert-state-map [escape] 'evil-normal-state)

  ;;实现代码折叠
  (use-package hideshow
    :defer t
    :diminish hs-minor-mode
    :bind (:map hs-minor-mode-map
		("C-`" . hs-toggle-hiding))
    ;; :commands (evil-states evil-emacs-state)
    ;; :after evil-mode
    ;; :after evil-local-mode
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
    :commands (evil-numbers  evil-numbers/inc-at-pt)
    :commands (evil-numbers  evil-numbers/dec-at-pt)
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
    ;; :after evil-mode
    :diminish evil-escape-mode
    :init
    (setq-default evil-escape-key-sequence "jk")
    (setq-default evil-escape-delay 0.2)
    :config
    (evil-escape-mode t)
    )

  (use-package evil-nerd-commenter
    :ensure t
    :after evil
    :config
    (general-define-key
     :keymaps '(normal visual emacs)
     :prefix ";"
     ";"  'evilnc-comment-or-uncomment-lines
     )
    )

  (use-package evil-mc
    :ensure t
    :defer t
    :disabled t
    :diminish evil-mc-mode
    :config
    (global-evil-mc-mode 1)
    )

  (use-package evil-collection
    ;; :after evil-mode
    :ensure t
    :disabled t
    ;; :custom (evil-collection-setup-minibuffer t)
    :custom (evil-collection-company-use-tng nil)
    ;; :custom (evil-collection-outline-bind-tab-p nil)
    ;; :custom (evil-collection-term-sync-state-and-mode-p nil)
    ;; :custom (evil-collection-setup-debugger-keys nil)
    ;; :init
    :config
    (evil-collection-init)
    )

  (use-package evil-avy
    :ensure t
    :after avy
    :config
    (evil-avy-mode t)
    )

  )

(provide 'init-evil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-evil.el ends here

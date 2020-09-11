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
  :hook(after-init . evil-mode)
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-set-initial-state 'snails-mode 'insert)
  (evil-set-initial-state 'vterm-mode 'insert)
  ;; (evil-set-initial-state 'text-mode 'emacs)
  (evil-set-initial-state 'color-rg-mode 'emacs)
  (evil-set-initial-state 'realgud-short-key-mode 'emacs)
  ;; remove all keybindings from insert-state keymap,it is VERY VERY important
  (setcdr evil-insert-state-map nil)
  ;;;把 emacs 模式下的按键绑定到 Insert 模式下
  (define-key evil-insert-state-map
    (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
  ;; but [escape] should switch back to normal state
  (define-key evil-insert-state-map [escape] 'evil-normal-state)
  (define-key evil-normal-state-map "\M-." 'xref-find-definitions)
  (define-key evil-motion-state-map "\M-." 'xref-find-definitions)
  (add-hook 'dired-mode-hook
	    (lambda( )
	      (evil-emacs-state)))
  )

;;实现代码折叠
(use-package hideshow
  :defer t
  :diminish hs-minor-mode
  :after evil
  ;; :bind (:map hs-minor-mode-map
  ;; 		("C-`" . hs-toggle-hiding))
  ;; :commands (evil-states evil-emacs-state)
  ;; :after evil-mode
  ;; :after evil-local-mode
  :hook (prog-mode . hs-minor-mode)
  )

(use-package evil-visualstar
  :ensure t
  ;; :after evil
  :defer t
  :hook (evil-mode . global-evil-visualstar-mode)
  )

(use-package evil-matchit
  :ensure t
  :defer t
  ;; :after evil
  :diminish evil-matchit-mode
  :hook (evil-mode . global-evil-matchit-mode)
  :init
  (defvar evilmi-ignore-comments nil)
  (setq evilmi-shortcut "m")
  )

(use-package evil-escape
  :ensure t
  :diminish evil-escape-mode
  :hook (evil-mode . evil-escape-mode )
  :init
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2)
  ;; :config
  ;; (evil-escape-mode t)
  )

(use-package evil-nerd-commenter
  :ensure t
  :defer t
  :after evil
  )

(use-package evil-avy
  :ensure t
  :defer t
  :after avy
  :config
  (evil-avy-mode t)
  )

(provide 'init-evil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-evil.el ends here

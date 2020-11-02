;;; init-evil.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

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
  (evil-set-initial-state 'snails-mode 'emacs)
  (evil-set-initial-state 'vterm-mode 'emacs)
  ;; (evil-set-initial-state 'text-mode 'emacs)
  (evil-set-initial-state 'color-rg-mode 'emacs)
  (evil-set-initial-state 'xref--xfef-buffer-mode 'emacs)
  (evil-set-initial-state 'realgud-short-key-mode 'emacs)
  (evil-set-initial-state 'dired-mode 'emacs)
  ;; remove all keybindings from insert-state keymap,it is VERY VERY important
  (setcdr evil-insert-state-map nil)
  ;;;把 emacs 模式下的按键绑定到 Insert 模式下
  (define-key evil-insert-state-map
    (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
  ;; but [escape] should switch back to normal state
  (define-key evil-insert-state-map [escape] 'evil-normal-state)
  (define-key evil-normal-state-map "\M-." 'xref-find-definitions)
  (define-key evil-motion-state-map "\M-." 'xref-find-definitions)
  )

;;实现代码折叠
(use-package hideshow
  :defer t
  :diminish hs-minor-mode
  :after evil
  )

(use-package evil-visualstar
  :ensure t
  :defer t
  :hook (evil-mode . global-evil-visualstar-mode)
  )

(use-package evil-matchit
  :ensure t
  :defer t
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
  )

(use-package evil-nerd-commenter
  :ensure t
  :defer t
  :after evil
  )

(provide 'init-evil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-evil.el ends here

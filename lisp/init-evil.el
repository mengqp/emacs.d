;;; init-evil.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package evil
  :diminish evil-mode
  ;; :disabled t
  ;; :hook(after-init . evil-mode)
  ;; :hook(after-init . evil-mode)
  ;; :hook((prog-mode org-mode) . evil-mode)
  :defer 2
  :init

  ;; This is optional since it's already set to t by default.
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode t)
  ;; {{ specify major mode uses Evil (vim) NORMAL state or EMACS original state.
  ;; You may delete this setup to use Evil NORMAL state always.
  (dolist (p '((minibuffer-inactive-mode . emacs)
               ;; (text-mode . emacs)
               (realgud-short-key-mode . emacs)
               (dired-mode . emacs)
               (color-rg-mode . emacs)
               (vterm-mode . emacs)
               (snails-mode . emacs)
               (calendar-mode . emacs)
               (dashboard-mode . emacs)
               (special-mode . emacs)
               (grep-mode . emacs)
               (Info-mode . emacs)
               (term-mode . emacs)
               (anaconda-nav-mode . emacs)
               (log-edit-mode . emacs)
               (vc-log-edit-mode . emacs)
               (magit-log-edit-mode . emacs)
               (erc-mode . emacs)
               (gud-mode . emacs)
               (help-mode . emacs)
               (eshell-mode . emacs)
               (shell-mode . emacs)
               (xref--xref-buffer-mode . emacs)
               ;;(message-mode . emacs)
               (epa-key-list-mode . emacs)
               ;; (fundamental-mode . emacs)
               (woman-mode . emacs)
               (sr-mode . emacs)
               (profiler-report-mode . emacs)
               (dired-mode . emacs)
               (compilation-mode . emacs)
               (speedbar-mode . emacs)
               (ivy-occur-mode . emacs)
               (ffip-file-mode . emacs)
               (eaf-mode . emacs)
               (ivy-occur-grep-mode . normal)
               (messages-buffer-mode . normal)
               (js2-error-buffer-mode . emacs)))
    (evil-set-initial-state (car p) (cdr p)))

  ;; remove all keybindings from insert-state keymap,it is VERY VERY important
  (setcdr evil-insert-state-map nil)
  ;;;把 emacs 模式下的按键绑定到 Insert 模式下
  (define-key evil-insert-state-map
    (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
  ;; but [escape] should switch back to normal state
  (define-key evil-insert-state-map [escape] 'evil-normal-state)
  (define-key evil-normal-state-map "\M-." 'xref-find-definitions)
  (define-key evil-motion-state-map "\M-." 'xref-find-definitions)
  (define-key evil-visual-state-map (kbd "v") 'er/expand-region)

  )

(use-package evil-visualstar
  :defer 3
  ;; :hook (evil-mode . global-evil-visualstar-mode)
  :init
  (global-evil-visualstar-mode t)
  )

(use-package evil-matchit
  :defer 4
  :diminish evil-matchit-mode
  ;; :hook (evil-mode . global-evil-matchit-mode)
  :init
  (global-evil-matchit-mode t)
  (defvar evilmi-ignore-comments nil)
  (setq evilmi-shortcut "m")
  )

(use-package evil-escape
  :diminish evil-escape-mode
  :hook (evil-mode . evil-escape-mode )
  :init
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2)
  )

(use-package evil-nerd-commenter)

(provide 'init-evil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-evil.el ends here

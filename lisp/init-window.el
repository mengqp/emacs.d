;;; init-window.el --- windows -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package switch-window
  :ensure t
  :defer t
  ;; :defer t
  ;; :bind ("C-x o" . switch-window)
  ;; :bind ("C-x 1" . switch-window-then-maximize)
  ;; :bind ("C-x 2" . switch-window-then-split-below)
  ;; :bind ("C-x 3" . switch-window-then-split-right)
  ;; :bind ("C-x 0" . switch-window-then-delete)
  :init
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f" "q" "w" "e" "r" ))
  (setq switch-window-threshold 2)
  )

(use-package zoom
  :ensure t
  :defer t
  )

(provide 'init-window)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-window.el ends here

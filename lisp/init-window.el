;;; init-window.el --- windows -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package switch-window
  :init
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f" "q" "w" "e" "r" ))
  (setq switch-window-threshold 2)
  )

(use-package zoom)

(provide 'init-window)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-window.el ends here

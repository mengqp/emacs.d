


(use-package window-numbering
  :init
  (setq window-numbering-assign-func
	(lambda () (when (equal (buffer-name) "*Calculator*") 9)))
  :config
  (window-numbering-mode t)
  )

(use-package switch-window
  :init
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f" "q" "w" "e" "r" ))
  (setq switch-window-increase 6) ;Increase or decrease this number.
  (setq switch-window-threshold 2)
  (setq switch-window-minibuffer-shortcut ?z)
  )

(provide 'init-window-numbering)

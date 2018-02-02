

;; (use-package ace-window
;;   :ensure t
;;   :diminish ace-window-mode
;;   :config
;;   (global-set-key (kbd "M-p") 'ace-window)
;;   )

;; (use-package window-numbering
;;   :ensure t
;;   :init
;;   (setq window-numbering-assign-func
;; 	(lambda () (when (equal (buffer-name) "*Calculator*") 9)))
;;   :config
;;   (window-numbering-mode t)
;;   )

(use-package switch-window
  :ensure t
  :defer t
  :init
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f" "q" "w" "e" "r" ))
  (setq switch-window-increase 12) ;Increase or decrease this number.
  (setq switch-window-threshold 2)
  ;; (setq switch-window-minibuffer-shortcut ?z)
  ;; (setq switch-window-auto-resize-window
  ;; 	(lambda ()
  ;; 	  (equal (buffer-name) "*scratch*"))) ;when return t, run auto switch
  ;; (setq switch-window-default-window-size '(0.8 . 0.6)) ;80% width and 60% height of frame
  ;; (setq switch-window-input-style 'minibuffer)
  :config
  (use-package golden-ratio
    :ensure t
    :diminish golden-ratio-mode
    :config
    (golden-ratio-mode 1)
    )
  )

(provide 'init-window)

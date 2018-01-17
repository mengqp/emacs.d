;;; ahk-mode


(use-package ahk-mode
  :ensure t
  :defer t
  :init
  (setq auto-mode-alist (cons '("\\.ahk$" . ahk-mode) auto-mode-alist))

  )


(provide 'init-ahk)

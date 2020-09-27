;;; init-cc.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package cc-mode
  :ensure nil
  :defer t
  :hook (c-mode-common . (lambda ()
                           (c-set-style "linux")
                           (setq tab-width 4)
			   (setq c-basic-offset 4)
			   indent-tabs-mode nil       ;; 禁止空格替换 Tab
			   ))
  )

(use-package doxy-graph-mode
  :ensure t
  :disabled t
  :init
  (add-hook 'c-mode-hook 'doxy-graph-mode)
  (add-hook 'c++-mode-hook 'doxy-graph-mode)
  (add-hook 'python-mode-hook 'doxy-graph-mode)
  )

(provide 'init-cc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-cc.el ends here

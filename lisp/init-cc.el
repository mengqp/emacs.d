;;; init-cc.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package cc-mode
  :hook (c-mode-common . (lambda ()
                           (c-set-style "linux")
                           (setq tab-width 4)
			   (setq c-basic-offset 4)
			   indent-tabs-mode nil       ;; 禁止空格替换 Tab
			   ))
  )

(provide 'init-cc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-cc.el ends here

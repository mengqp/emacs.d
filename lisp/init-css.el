;;; init-css.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package css-mode
  :ensure nil
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.qss$" . css-mode))
  )
(provide 'init-css)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-css.el ends here

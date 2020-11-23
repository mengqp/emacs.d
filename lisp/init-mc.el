;;; init-mc.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package evil-mc
  :ensure t
  :defer t
  :diminish evil-mc-mode
  :after evil-mode
  :config
  (global-evil-mc-mode 1)
  )


(provide 'init-mc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-mc.el ends here

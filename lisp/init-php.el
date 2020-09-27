;;; init-php.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package php-mode
  :ensure t
  :defer t
  :init
  (setq auto-mode-alist (cons '("\\.php$" . php-mode) auto-mode-alist))
  )


(provide 'init-php)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-php.el ends here

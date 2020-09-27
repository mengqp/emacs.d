;;; init-ace-jump.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package avy
  :ensure t
  :defer t
  )

;; Kill text between the point and the character CHAR
(use-package avy-zap
  :ensure t
  :defer t
  :bind* (
	 ("M-z" . avy-zap-to-char-dwim)
	 ("M-Z" . avy-zap-up-to-char-dwim)
	 )
  )

(provide 'init-ace-jump)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ace-jump.el ends here

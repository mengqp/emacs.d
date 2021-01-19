;;; init-snails.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package snails
  :ensure nil
  :init
  (setq snails-show-with-frame nil)
  (setq snails-default-show-prefix-tips nil)
  (setq snails-default-backends
	'(snails-backend-buffer snails-backend-recentf)
	)
  (setq snails-prefix-backends
	'((">" '(snails-backend-command))
	  ("@" '(snails-backend-imenu))
	  ("#" '(snails-backend-current-buffer))
	  ("!" '(snails-backend-rg))
	  ;; ("?" '(snails-backend-fd snails-backend-projectile ))
	  ("?" '(snails-backend-projectile ))
	  )
	)
  )

(provide 'init-snails)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-snails.el ends here

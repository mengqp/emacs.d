;;; init-snails.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package snails
  :ensure nil
  :bind*
  (
   ;; ("M-j s" . snails)
   ("M-j j" . snails)
   ("M-j M-j" . snails)
   (:map snails-mode-map
    ("M-n" . snails-select-next-backend)
    ("M-p" . snails-select-prev-backend)
    )
   )
  :init
  (setq snails-default-show-prefix-tips nil)
  :config
  ;; (use-package exec-path-from-shell
  ;;   :if (featurep 'cocoa) :defer t)

  (setq snails-default-backends
	'(snails-backend-buffer snails-backend-recentf)
	)
  (setq snails-prefix-backends
	'((">" '(snails-backend-command))
	  ("@" '(snails-backend-imenu))
	  ("#" '(snails-backend-current-buffer))
	  ("!" '(snails-backend-rg))
	  ("?" '(snails-backend-fd snails-backend-projectile ))
	  )
	)
  )

(provide 'init-snails)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-snails.el ends here

;; (require 'ycmd)

;; (add-hook 'c++-mode-hook 'ycmd-mode)
;; (add-hook 'c-mode-hook 'ycmd-mode)

(add-hook 'c++-mode-hook 'ycmd-mode)
(add-hook 'c-mode-hook 'ycmd-mode)

(with-eval-after-load 'ycmd
  (set-variable 'ycmd-server-command '("python" "/home/mengqp/DotFiles/ycmd/ycmd"))
  (set-variable 'ycmd-global-config "~/DotFiles/ycmd/cpp/ycm/.ycm_extra_conf.py")
  (setq ycmd-extra-conf-handler (quote load))
  (require 'company-ycmd)
  (company-ycmd-setup)
  (require 'flycheck-ycmd)
  (flycheck-ycmd-setup)
  )
;; (set-variable 'ycmd-server-command '("python" "/home/mengqp/DotFiles/ycmd/ycmd"))
;; (set-variable 'ycmd-global-config "~/DotFiles/ycmd/cpp/ycm/.ycm_extra_conf.py")
;; (setq ycmd-extra-conf-handler (quote load))
;; (add-hook 'after-init-hook 'global-ycmd-mode)
;; (add-hook 'after-init-hook 'yas-global-mode)


					; (require 'company-ycmd)
					; (company-ycmd-setup)

 ;;;;;;;;;;;;;;;;;;;;;;;company;;;;;;;;;;;;;;;;;;
; (add-hook 'after-init-hook #'global-company-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;flycheck;;;;;;;;;;;;;;;;
; (add-hook 'after-init-hook #'global-flycheck-mode)
;;;;;;;;;;;;;;;;;;;emacs-ycmd;;;;;;;;;;;;;;;;;;;
; (require 'ycmd)
; (add-hook 'after-init-hook #'global-ycmd-mode)
; (set-variable 'ycmd-server-command '("python" "/home/mengqp/emacs-etc/mengqp/ycmd/ycmd"))
; (set-variable 'ycmd-global-config "/home/mengqp/emacs-etc/mengqp/ycmd/cpp/ycm/.ycm_extra_conf.py")
; (ycmd-force-semantic-completion t)
; (ycmd-global-config nil)
; (ycmd-server-command (quote ("python" "/home/mengqp/emacs_etc/mengqp/ycmd/ycmd")))
; (set-variable 'ycmd-global-config "/home/mengqp/emacs_etc/mengqp/ycmd/cpp/ycm/.ycm_extra_conf.py")
; ;(set-variable 'ycmd-extra-conf-whitelist '("/home/chris/Code/daily_report_system/v1.0/*"))


(provide 'init-ycmd)

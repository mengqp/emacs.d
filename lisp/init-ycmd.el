;;; init-ycmd.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package ycmd
  :ensure t
  :defer t
  :diminish ycmd-mode
  ;; :disabled t
  :init
  (add-hook 'c++-mode-hook 'ycmd-mode)
  (add-hook 'c-mode-hook 'ycmd-mode)

  (set-variable 'ycmd-server-command '("python" "/usr/share/ycmd/ycmd"))
  ;; (set-variable 'ycmd-global-config "~/DotFiles/ycmd/cpp/ycm/.ycm_extra_conf.py")
  (setq ycmd-extra-conf-handler (quote load))
  (setq ycmd-startup-timeout 10)

  :config
  (use-package company-ycmd
    :ensure t
    :config
    (company-ycmd-setup)
    (add-to-list 'company-backends '(company-yasnippet  company-ycmd))
    )
  (use-package flycheck-ycmd
    :ensure t
    :config
    (flycheck-ycmd-setup)
    (when (not (display-graphic-p))
      (setq flycheck-indication-mode nil))
    )

  (use-package ivy-ycmd
    :ensure t)

  ;; (use-package ycmd-eldoc
  ;;   :init
  ;;   (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)
  ;;   )

  (general-define-key :states '(normal motion)
		      :keymaps '(c++-mode-map
				 c-mode-map)
		      :prefix ";"
		      "g" 'ycmd-goto
		      )

  )
(provide 'init-ycmd)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ycmd.el ends here

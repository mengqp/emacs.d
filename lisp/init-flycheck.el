;;; init-flycheck.el --- flycheck -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package flycheck
  ;; :disabled t
  :ensure t
  :commands (flycheck flycheck-display-error-messages-unless-error-list)
  :commands (flycheck flycheck-list-errors)
  :commands (flycheck flycheck-get-error-list-window)
  :defer t
  :hook ((prog-mode org-mode) . flycheck-mode)
  :init
  ;;; 保存的时候自动检查
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  ;;; 显示 errors
  (setq flycheck-display-errors-function
	#'flycheck-display-error-messages-unless-error-list)

  (setq flycheck-mode-line-prefix "!")
  )

  ;; (use-package flycheck-posframe
  ;;   :ensure t
  ;;   :defer t
  ;;   :hook ((potframe-mode) . flycheck-posframe)
  ;;   :config
  ;;   (flycheck-posframe-configure-pretty-defaults)
  ;;   )



(provide 'init-flycheck)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-flycheck.el ends here

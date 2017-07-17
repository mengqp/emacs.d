;;; init-flycheck.el --- 语法
;;; 主要进行语法处理

;;; flycheck
;; (require 'flycheck)

;;; 全局语法检查
;; (add-hook 'after-init-hook #'global-flycheck-mode)
;;; c和c++
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)

(with-eval-after-load 'flycheck
;;; 保存的时候自动检查
  (setq flycheck-check-syntax-automatically '(mode-enabled save))

;;; Tune error list display
  (add-to-list 'display-buffer-alist
	       `(,(rx bos "*Flycheck errors*" eos)
		 (display-buffer-reuse-window
		  display-buffer-in-side-window)
		 (side            . bottom)
		 (reusable-frames . visible)
		 (window-height   . 0.33)))

;;; 显示errors
  (setq flycheck-display-errors-function
	#'flycheck-display-error-messages-unless-error-list)

  ;; toggle flycheck window
  (defun mengqp/toggle-flycheck-error-list ()
    "Toggle flycheck's error list window.
If the error list is visible, hide it.  Otherwise, show it."
    (interactive)
    (-if-let (window (flycheck-get-error-list-window))
	(quit-window nil window)
      (flycheck-list-errors)))

  (eval-after-load 'flycheck
    '(flycheck-package-setup))
  ;; (require 'flycheck-pos-tip)
  ;; (with-eval-after-load 'flycheck
  ;;   (flycheck-pos-tip-mode))
  )


(provide 'init-flycheck)
;;; init-flycheck.el ends here

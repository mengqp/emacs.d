;;; init-company.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :hook ((prog-mode org-mode) . company-mode)
  :init
  ;; 设置等待时间
  (setq company-idle-delay 0.2)
  ;; 补全起始长度
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t)
  )

(use-package company-posframe
  :ensure t
  :defer t
  :hook (company-mode . company-posframe-mode)
  :diminish company-posframe-mode
  )

(provide 'init-company)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-company.el ends here

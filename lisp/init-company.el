;;; init-company.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :hook ((prog-mode org-mode) . company-mode)
  ;; :bind
  ;; (("M-/" . company-complete)
  ;;  ("C-c C-y" . company-yasnippet)
  ;;  ("<backtab>" . company-yasnippet)
  ;;  :map company-active-map
  ;;  ("C-p" . company-select-previous)
  ;;  ("C-n" . company-select-next)
  ;;  ("<tab>" . company-complete-common-or-cycle)
  ;;  ("C-c C-y" . my-company-yasnippet)
  ;;  :map company-search-map
  ;;  ("C-p" . company-select-previous)
  ;;  ("C-n" . company-select-next))
  :init
  ;; 设置等待时间
  (setq company-idle-delay 0.2)
  ;; 补全起始长度
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t)

  :config
  (use-package company-posframe
    :ensure t
    :defer t
    :diminish company-posframe-mode
    :config
    (company-posframe-mode 1)
    )

  )

(provide 'init-company)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-company.el ends here

;;; init-company.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :hook ((prog-mode org-mode vterm-mode) . company-mode)
  :bind
  (
   :map company-mode-map
	("M-y" . company-yasnippet)
   :map company-active-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next)
         ("<tab>" . company-complete-common-or-cycle)
         ("M-y" . my-company-yasnippet)
   )
  :init
  ;; 设置等待时间
  (setq company-idle-delay 0)
  ;; 补全起始长度
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (defun my-company-yasnippet ()
    "Hide the current completeions and show snippets."
    (interactive)
    (company-cancel)
    (call-interactively 'company-yasnippet))
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

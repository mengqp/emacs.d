(require 'irony)


(use-package irony
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)

  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-irony))

  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

  (require 'company-irony-c-headers)
  ;; Load with `irony-mode` as a grouped backend
  (eval-after-load 'company
    '(add-to-list
      'company-backends '(company-irony-c-headers company-irony)))
  )

(provide 'init-irony)

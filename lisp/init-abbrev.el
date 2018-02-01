;;; init-abbrev.el --- abbrev https://github.com/phillord/pabbrev -*- coding: utf-8-unix -*-
;;; Commentary:


;;; Code:
(use-package abbrev
  :defer t
  :diminish abbrev-mode
  :config
  (clear-abbrev-table global-abbrev-table)
  (define-abbrev-table 'global-abbrev-table
    '(
      ;; net abbrev
      ("afaik" "as far as i know" )

      ;;
      ))

  ;; define abbrev for specific major mode
  ;; the first part of the name should be the value of the variable major-mode of that mode
  ;; e.g. for go-mode, name should be go-mode-abbrev-table


  (define-abbrev-table 'c++-mode-abbrev-table
    '(
      ("fo" "for(int i=0; i<4; i++)")
      ))

  (set-default 'abbrev-mode t)

  (setq save-abbrevs nil)
  )


(provide 'init-abbrev)

;;; init-abbrev.el ends here

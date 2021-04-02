;;; init-layout.el --- layout -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package eyebrowse
  :hook (after-init . eyebrowse-mode)
  )

(use-package workgroups2
  :disabled t
  :hook
  (after-init . workgroups-mode)
  :init
  ;;(setq wg-session-load-on-start t)    ; default: (not (daemonp))

  ;; Change workgroups session file
  (setq wg-session-file "~/.emacs.d/.emacs_workgroups")
  ;; What to do on Emacs exit / workgroups-mode exit?
  ;; (setq wg-emacs-exit-save-behavior           'save)      ; Options: 'save 'ask nil
  ;; (setq wg-workgroups-mode-exit-save-behavior 'save)      ; Options: 'save 'ask nil

  ;; Mode Line changes
  ;; Display workgroups in Mode Line?
  ;; (setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
  ;; (setq wg-flag-modified t)                 ; Display modified flags as well
  ;; (setq wg-mode-line-decor-left-brace "["
  ;; 	wg-mode-line-decor-right-brace "]"  ; how to surround it
  ;; 	wg-mode-line-decor-divider ":")

  )


(provide 'init-layout)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-layout.el ends here

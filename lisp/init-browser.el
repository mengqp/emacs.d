;;; init-browser.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package eaf
  :load-path "site-lisp/eaf"
  :ensure nil
  :init
  (use-package epc)
  (use-package ctable)
  (use-package deferred)
  (use-package s)
  (setq eaf-find-alternate-file-in-dired t)
  ;; :config
  ;; (eaf-bind-key scroll_up "RET" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key scroll_down_page "DEL" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  )

(provide 'init-browser)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-browser.el ends here

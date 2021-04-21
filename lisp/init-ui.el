;;; init-ui.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(progn
  (setq use-file-dialog nil)
  (setq use-dialog-box nil)
  ;; Show a marker in the left fringe for lines not in the buffer
  (setq indicate-empty-lines t)

  ;;指针不要闪
  (blink-cursor-mode -1)
  )

;; (set-frame-parameter nil 'alpha '(90 . 100))

(defun linux-fullscreen ()
  "Linux fullscreen."
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth))
  )

(linux-fullscreen)

(use-package hl-line
  :ensure nil
  :hook (after-init . global-hl-line-mode)
  )

(use-package highlight-parentheses
  :hook (prog-mode . highlight-parentheses-mode)
  )

(use-package all-the-icons)

(use-package symbol-overlay)

;; (use-package eldoc-box
;;   :hook (prog-mode . eldoc-box-hover-at-point-mode))

(use-package column-enforce-mode
  :diminish column-enforce-mode
  :hook((prog-mode) . column-enforce-mode)
  :init
  (setq column-enforce-column 80)
  )

(provide 'init-ui)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here

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

(set-frame-parameter nil 'alpha '(90 . 100))

(defun linux-fullscreen ()
  "Linux fullscreen."
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth))
  )

(linux-fullscreen)

;; (when *win64*
;;   (run-with-idle-timer 0.2 nil 'w32-send-sys-command 61488)
;;   )

(use-package all-the-icons
  :ensure t
  :defer t
  )

(use-package symbol-overlay
  :ensure t
  :defer t
  )

(use-package column-enforce-mode
  :ensure t
  :defer t
  :diminish column-enforce-mode
  :hook((cc-mode python-mode) . column-enforce-mode)
  :config
  (setq column-enforce-column 80)
  )

(use-package dashboard
  :ensure t
  :disabled t
  :init
  ;; Set the banner
  (setq dashboard-startup-banner 2)
  ;; Value can be
  ;; 'official which displays the official emacs logo
  ;; 'logo which displays an alternative emacs logo
  ;; 1, 2 or 3 which displays one of the text banners
  ;; "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever image/text you would prefer
  ;; Set the title
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
  ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)
  (setq dashboard-set-navigator t)
  (setq dashboard-items '(
			  (recents  . 5)
			  (bookmarks . 5)
			  (projects . 5)
			  ))
  :config
  (dashboard-setup-startup-hook)
  )

(provide 'init-ui)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here

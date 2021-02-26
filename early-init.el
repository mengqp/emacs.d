;;; early-init.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
          (lambda ()
            "Restore defalut values after startup."
            ;; (setq file-name-handler-alist default-file-name-handler-alist)
            (setq gc-cons-threshold 6000000
                  gc-cons-percentage 0.1)
	    )
	  )


;; initialization, so we must prevent Emacs from doing it early!
(setq package-enable-at-startup nil)

;; 设置基本界面
(progn
  ;; Faster to disable these here (before they've been initialized)
  (push '(menu-bar-lines . 0) default-frame-alist)
  (push '(tool-bar-lines . 0) default-frame-alist)
  (push '(vertical-scroll-bars) default-frame-alist)
  (tooltip-mode -1)
  ;; Inhibit resizing frame
  (setq frame-inhibit-implied-resize t);
  )


(provide 'early-init)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; early-init.el ends here

;;; init-gdb.el --- gdb -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

;; set gdb multi-windows when open
(use-package gud
  :defer t
  ;; :disabled t
  :config
  (gud-tooltip-mode 1)
  ;; ;; customize the gdb multi-windows
  ;; (defadvice gdb-setup-windows (after my-setup-gdb-windows activate)
  ;;   "My gdb UI."
  ;;   (gdb-get-buffer-create 'gdb-stack-buffer)
  ;;   (set-window-dedicated-p (selected-window) nil)
  ;;   (switch-to-buffer gud-comint-buffer)
  ;;   (delete-other-windows)
  ;;   (let ((win0 (selected-window))
  ;;         (win1 (split-window nil nil 'left))  ;; code and output
  ;;         (win2 (split-window-below (/ (* (window-height) 3) 4)))  ;; stack
  ;;         )
  ;;     (select-window win2)
  ;;     (gdb-set-window-buffer (gdb-stack-buffer-name))
  ;;     (select-window win1)
  ;;     (set-window-buffer
  ;;      win1
  ;;      (if gud-last-last-frame
  ;;          (gud-find-file (car gud-last-last-frame))
  ;; 	 (if gdb-main-file
  ;;            (gud-find-file gdb-main-file)
  ;;          ;; Put buffer list in window if we
  ;;          ;; can't find a source file.
  ;;          (list-buffers-noselect))))
  ;;     (setq gdb-source-window (selected-window))
  ;;     (let ((win3 (split-window nil (/ (* (window-height) 3) 4))))  ;; io
  ;; 	(gdb-set-window-buffer (gdb-get-buffer-create 'gdb-inferior-io) nil win3))
  ;;     (select-window win0)
  ;;     ))

  ;; ;; (setq gud-gdb-history t)
  ;; (defvar gdb-many-windows t)

  (general-define-key :states '(normal motion)
		      :keymaps '(c++-mode-map
				 c-mode-map)
		      ;; :keymaps '(gud-mode-map)
		      :prefix ";"
		      "b" 'gud-break
		      "n" 'gud-next
		      "s" 'gud-stepi
		      "f" 'gud-finish
		      "r" 'gud-go
		      "c" 'gud-cout
		      "u" 'gud-until
		      "d" 'gud-until
		      )


  )
(provide 'init-gdb)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-gdb.el ends here

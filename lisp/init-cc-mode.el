;;; init-cc-mode.el --- 关于c和c++的配置

(defun mengqp/close-compilation-window ()
  "Close the window containing the '*compilation*' buffer."
  (interactive)
  (when compilation-last-buffer
    (delete-windows-on compilation-last-buffer)))

(setq gdb-many-windows t)

(use-package google-c-style
  :ensure t
  :defer t
  :init
  (progn
;;; 定义tab和缩进
    (defun mengqp/google-c-mode-hook ()
      (setq c-basic-offset 4          ;; 基本缩进宽度
	    indent-tabs-mode nil       ;; 禁止空格替换Tab
	    tab-width 4
	    ))     ;; 默认Tab宽度

    (add-hook 'c-mode-common-hook 'google-set-c-style)
    (add-hook 'c++-mode-common-hook 'google-set-c-style)
    (add-hook 'c-mode-common-hook 'google-make-newline-indent)
    (add-hook 'c++-mode-common-hook 'google-make-newline-indent)
    (add-hook 'c-mode-hook 'mengqp/google-c-mode-hook)
    (add-hook 'c++-mode-hook 'mengqp/google-c-mode-hook)
    )
  )

;; ;;; 设置编码风格
;; (require 'google-c-style)
;; ;;; 定义tab和缩进
;; (defun mengqp/google-c-mode-hook ()
;;   (setq c-basic-offset 4          ;; 基本缩进宽度
;;         indent-tabs-mode nil       ;; 禁止空格替换Tab
;;         tab-width 4
;;         ))     ;; 默认Tab宽度

;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c++-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)
;; (add-hook 'c++-mode-common-hook 'google-make-newline-indent)
;; (add-hook 'c-mode-hook 'mengqp/google-c-mode-hook)
;; (add-hook 'c++-mode-hook 'mengqp/google-c-mode-hook)


;;;; set gdb multi-windows when open

;;;; customize the gdb multi-windows
;; (defadvice gdb-setup-windows (after my-setup-gdb-windows activate)
;;   "my gdb UI"
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
;;        (if gdb-main-file
;;            (gud-find-file gdb-main-file)
;;          ;; Put buffer list in window if we
;;          ;; can't find a source file.
;;          (list-buffers-noselect))))
;;     (setq gdb-source-window (selected-window))
;;     (let ((win3 (split-window nil (/ (* (window-height) 3) 4))))  ;; io
;;       (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-inferior-io) nil win3))
;;     (select-window win0)
;;     ))

;; (setq gud-gdb-history t)



(provide 'init-cc-mode)

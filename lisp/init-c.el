;;; init-c.el --- 关于c和c++的配置

;; (setq init-cc-mode-hook '(c-mode-hook
;; 		     c++-mode-hook
;; 		     ))



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

(use-package aggressive-indent
  :ensure t
  :defer t
  :diminish aggressive-indent-mode
  :init
  (add-hook 'c-mode-hook #'aggressive-indent-mode)
  (add-hook 'c++-mode-hook #'aggressive-indent-mode)
  :config
  (add-to-list
   'aggressive-indent-dont-indent-if
   '(and (derived-mode-p 'c++-mode)
	 (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
			     (thing-at-point 'line)))))
  (add-to-list
   'aggressive-indent-dont-indent-if
   '(and (derived-mode-p 'c-mode)
  	 (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
  			     (thing-at-point 'line)))))


  )

(use-package highlight-parentheses
  :ensure t
  :diminish highlight-parentheses-mode
  :init
  (add-hook 'c-mode-hook #'highlight-parentheses-mode)
  (add-hook 'c++-mode-hook #'highlight-parentheses-mode)

  )


(use-package xcscope
  :ensure t
  :defer t
  :init
  (add-hook 'c++-mode-hook 'cscope-minor-mode)
  (add-hook 'c-mode-hook 'cscope-minor-mode)
  :config
  (cscope-setup)
  (use-package helm-cscope
    :ensure t
    :defer t)
  )

;; (use-package irony
;;   :ensure t
;;   :defer t
;;   :diminish irony-mode
;;   :init
;;   (add-hook 'c++-mode-hook 'irony-mode)
;;   (add-hook 'c-mode-hook 'irony-mode)
;;   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;;   :config
;;   (use-package company-irony
;;     :ensure t
;;     :config
;;     (eval-after-load 'company
;;       '(add-to-list 'company-backends 'company-irony))
;;     )
;;   (use-package flycheck-irony
;;     :ensure t
;;     :config
;;     (eval-after-load 'flycheck
;;       '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;;     )

;;   ;; (use-package company-irony-c-headers
;;   ;;   :ensure t
;;   ;;   :config
;;   ;;   (eval-after-load 'company
;;   ;;   '(add-to-list
;;   ;;     'company-backends '(company-irony-c-headers company-irony)))
;;   ;;   )

;;   )


(use-package ycmd
  :ensure t
  :defer t
  :diminish ycmd-mode
  :init
  (add-hook 'c++-mode-hook 'ycmd-mode)
  (add-hook 'c-mode-hook 'ycmd-mode)

  (set-variable 'ycmd-server-command '("python" "/root/DotFiles/ycmd/ycmd"))
  (set-variable 'ycmd-global-config "~/DotFiles/ycmd/cpp/ycm/.ycm_extra_conf.py")
  (setq ycmd-extra-conf-handler (quote load))
  (setq ycmd-startup-timeout 10)
  :config
  (use-package company-ycmd
    :ensure t
    :config
    (company-ycmd-setup)
    ;; (add-to-list 'company-backends '(company-yasnippet  company-ycmd))
    )
  (use-package flycheck-ycmd
    :ensure t
    :config
    (flycheck-ycmd-setup)
    (when (not (display-graphic-p))
      (setq flycheck-indication-mode nil))
    )


  )

(use-package cquery
  :ensure t
  ;; :init
  ;; (add-hook 'c++-mode-hook 'cquery-mode)
  ;; (add-hook 'c-mode-hook 'cquery-mode)
  :config
  (setq cquery-executable "/usr/bin/cquery")
  )

(general-define-key :states '(normal motion)
		    :keymaps '(c++-mode-map
			       c-mode-map)
		    :prefix ";"
		    "g" 'ycmd-goto
		    "s" 'helm-cscope-find-this-symbol
		    "d" 'helm-cscope-find-global-definition
		    "c" 'helm-cscope-find-called-function
		    "C" 'helm-cscope-find-calling-this-function
		    "i" 'cscope-index-files
		    "a" 'projectile-find-other-file
		    "A" 'projectile-find-other-file-other-window
		    "b" 'gdb
		    "el" 'mengqp/toggle-flycheck-error-list
		    "en" 'flycheck-next-error
		    "ep" 'flycheck-previous-error

		    ;; (which-key-add-key-based-replacements
		    ;;   ", g" "goto")

		    ;; (which-key-add-key-based-replacements
		    ;;   ", e" "error")
		    )

(which-key-add-major-mode-key-based-replacements 'c++-mode
    "; e" "error"
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



(provide 'init-c)

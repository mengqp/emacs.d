;; (require 'company)

(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  ;; 设置等待时间
  ;; (setq company-idle-delay 0.08)
  (setq company-idle-delay 0.1)
  ;; 补全起始长度
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t)

  :config
  ;; (global-company-mode t)

  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)

  )



;;颜色
;; (require 'color)

;; (let ((bg (face-attribute 'default :background)))
;;   (custom-set-faces
;;    `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
;;    `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
;;    `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
;;    `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
;;    `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

(provide 'init-company)

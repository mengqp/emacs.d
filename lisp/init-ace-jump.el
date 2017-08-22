;; (require 'ace-jump-mode)
(use-package ace-jump-mode
  :ensure t
  :defer t)
;; (require 'ace-jump-helm-line)
;; (eval-after-load "helm"
;; '(define-key helm-map (kbd "C-s") 'ace-jump-helm-line))
;; ;; or if using key-chord-mode
;; ;; (eval-after-load "helm"
;; ;;  '(key-chord-define helm-map "jj" 'ace-jump-helm-line))
;; (setq ace-jump-helm-line-style 'pre)
;; (setq ace-jump-helm-line-background t)
;; (setq ace-jump-helm-line-default-action 'select)
;; (setq ace-jump-helm-line-select-key ?e) ;; this line is not needed
;; ;; Set the move-only and persistent keys
;; (setq ace-jump-helm-line-move-only-key ?o)
;; (setq ace-jump-helm-line-persistent-key ?p)
;; ;; enable idle execution for `helm-mini'
;; (ace-jump-helm-line-idle-exec-add 'helm-mini)
;; ;; enable hints preview
;; (ace-jump-helm-line-autoshow-mode +1)
;; ;; use `linum-mode' to show
;; (setq ace-jump-helm-line-autoshow-mode-use-linum t)

(provide 'init-ace-jump)

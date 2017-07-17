;; (require 'yasnippet)


;; (add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'org-mode-hook #'yas-minor-mode)
(add-hook 'c-mode-hook #'yas-minor-mode)
(add-hook 'c++-mode-hook #'yas-minor-mode)

(with-eval-after-load 'yasnippet
  (message "yasnippet")
  (setq yas-snippet-dirs
	'("~/DotFiles/mysnippets"))

  (yas-reload-all)
  (require 'helm-c-yasnippet)
  (setq helm-yas-space-match-any-greedy t)

  ;; (yas-global-mode 1)

  ;; (add-hook 'c-mode-hook
  ;;           #'(lambda ()
  ;;               (yas-activate-extra-mode 'c-mode)))
  ;; (add-hook 'c++-mode-hook
  ;;           #'(lambda ()
  ;;               (yas-activate-extra-mode 'c-mode)))
  ;;(setq yas/root-directory "~/.emacs.d/snippets")
  ;;(yas/load-directory yas/root-directory)

  ;; (global-set-key "\C-o" 'aya-open-line)

  ;; (defun aya-open-line ()
  ;;   "Call `open-line', unless there are abbrevs or snippets at point.
  ;; In that case expand them.  If there's a snippet expansion in progress,
  ;; move to the next field. Call `open-line' if nothing else applies."
  ;;   (interactive)
  ;;   (cond ((expand-abbrev))

  ;;         ((yas--snippets-at-point)
  ;;          (yas-next-field-or-maybe-expand))

  ;;         ((ignore-errors
  ;;            (yas-expand)))

  ;;         (t
  ;;          (open-line 1))))

;;; use popup menu for yas-choose-value
  ;; (require 'popup)

  ;; add some shotcuts in popup menu mode
  ;; (define-key popup-menu-keymap (kbd "M-n") 'popup-next)
  ;; (define-key popup-menu-keymap (kbd "TAB") 'popup-next)
  ;; (define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
  ;; (define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
  ;; (define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

  ;; (defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
  ;;   (when (featurep 'popup)
  ;;     (popup-menu*
  ;;      (mapcar
  ;;       (lambda (choice)
  ;;         (popup-make-item
  ;;          (or (and display-fn (funcall display-fn choice))
  ;;              choice)
  ;;          :value choice))
  ;;       choices)
  ;;      :prompt prompt
  ;;      ;; start isearch mode immediately
  ;;      :isearch t
  ;;      )))

  ;; (setq yas-prompt-functions '(yas-popup-isearch-prompt yas-ido-prompt yas-no-prompt))


  (defun check-expansion ()
    (save-excursion
      (if (looking-at "\\_>") t
	(backward-char 1)
	(if (looking-at "\\.") t
	  (backward-char 1)
	  (if (looking-at "->") t nil)))))

  (defun do-yas-expand ()
    (let ((yas/fallback-behavior 'return-nil))
      (yas/expand)))

  (defun tab-indent-or-complete ()
    (interactive)
    (cond
     ((minibufferp)
      (minibuffer-complete))
     (t
      (indent-for-tab-command)
      (if (or (not yas/minor-mode)
	      (null (do-yas-expand)))
	  (if (check-expansion)
	      (progn
		(company-manual-begin)
		(if (null company-candidates)
		    (progn
		      (company-abort)
		      (indent-for-tab-command)))))))))

  (defun tab-complete-or-next-field ()
    (interactive)
    (if (or (not yas/minor-mode)
	    (null (do-yas-expand)))
	(if company-candidates
	    (company-complete-selection)
	  (if (check-expansion)
	      (progn
		(company-manual-begin)
		(if (null company-candidates)
		    (progn
		      (company-abort)
		      (yas-next-field))))
	    (yas-next-field)))))

  (defun expand-snippet-or-complete-selection ()
    (interactive)
    (if (or (not yas/minor-mode)
	    (null (do-yas-expand))
	    (company-abort))
	(company-complete-selection)))

  (defun abort-company-or-yas ()
    (interactive)
    (if (null company-candidates)
	(yas-abort-snippet)
      (company-abort)))

  (global-set-key [tab] 'tab-indent-or-complete)
  (global-set-key (kbd "TAB") 'tab-indent-or-complete)
  (global-set-key [(control return)] 'company-complete-common)

  (define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
  (define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)

  (define-key yas-minor-mode-map [tab] nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)

  (define-key yas-keymap [tab] 'tab-complete-or-next-field)
  (define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
  (define-key yas-keymap [(control tab)] 'yas-next-field)
  (define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)

  (define-key evil-insert-state-map (kbd "M-j") 'yas-expand)
  (define-key evil-emacs-state-map (kbd "M-j") 'yas-expand)

  )

(provide 'init-yasnippet)

;;; init-helm.el --- mengqp use helm
;;;

(require 'helm)
(require 'helm-config)

(use-package helm
  :init

  :bind
  (
   ("M-x" . helm-M-x)
   ;; ("<tab>" . helm-execute-persistent-action)
   ("C-z" . helm-select-action)
   )
  :config
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  ;; (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  ;; (global-set-key (kbd "C-x C-f") #'helm-find-files)
  ;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  )


  (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
	helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
	helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
	helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
	helm-ff-file-name-history-use-recentf t
	helm-echo-input-in-header-line t)


(defun mengqp//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'mengqp//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)

(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(helm-autoresize-mode 1)
(helm-mode 1)

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(require 'helm-ag)

(defun mengqp/helm-jump-in-buffer ()
  "Jump in buffer using `imenu' facilities and helm."
  (interactive)
  (call-interactively
   (cond
    ((eq major-mode 'org-mode) 'helm-org-in-buffer-headings)
    (t 'helm-semantic-or-imenu))))

(defvar dotspacemacs-search-tools '("ag" "pt" "ack" "grep"))

(defun mengqp//helm-do-search-find-tool (base tools default-inputp)
  "Create a cond form given a TOOLS string list and evaluate it."
  (eval
   `(cond
     ,@(mapcar
        (lambda (x)
          `((executable-find ,x)
            ',(let ((func
                     (intern
                      (format (if default-inputp
                                  "spacemacs/%s-%s-region-or-symbol"
                                "spacemacs/%s-%s")
                              base x))))
                (if (fboundp func)
                    func
                  (intern (format "%s-%s"  base x))))))
        tools)
     (t 'helm-do-grep))))

(defun mengqp/helm-file-do-ag (&optional _)
  "Wrapper to execute `helm-ag-this-file.'"
  (interactive)
  (helm-do-ag-this-file))

(defun mengqp/helm-file-smart-do-search (&optional default-inputp)
  "Search in current file using `dotspacemacs-search-tools'.
Search for a search tool in the order provided by `dotspacemacs-search-tools'
If DEFAULT-INPUTP is non nil then the current region or symbol at point
are used as default input."
  (interactive)
  (call-interactively
   (mengqp//helm-do-search-find-tool "mengqp/helm-file-do"
                                        dotspacemacs-search-tools
                                        default-inputp)))

(provide 'init-helm)

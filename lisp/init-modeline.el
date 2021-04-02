;;; init-modeline.el --- modeline -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

;; (setq-default mode-line-format
;;   (list
;;     ;; the buffer name; the file name as a tool tip
;;     '(:eval (propertize "%b " 'face nil 'help-echo (buffer-file-name)))

;;     ;; line and column
;;     "(" ;; '%02' to set to 2 chars at least; prevents flickering
;;     "%02l" "," "%01c"
;;     ") "

;;     ;; @see https://www.gnu.org/software/emacs/manual/html_node/emacs/Help-Echo.html
;;     "["
;;     ;; the current major mode for the buffer.
;;     '(:eval (propertize "%m" 'face nil 'help-echo buffer-file-coding-system))

;;     " "
;;     ;; buffer file encoding
;;     '(:eval (let ((sys (coding-system-plist buffer-file-coding-system)))
;;               (if (memq (plist-get sys :category)
;;                         '(coding-category-undecided coding-category-utf-8))
;;                   "UTF-8"
;;                 (upcase (symbol-name (plist-get sys :name))))))
;;     " "

;;     ;; insert vs overwrite mode, input-method in a tooltip
;;     '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
;;               'face nil
;;               'help-echo (concat "Buffer is in "
;;                            (if overwrite-mode "overwrite" "insert") " mode")))

;;     ;; was this buffer modified since the last save?
;;     '(:eval (when (buffer-modified-p)
;;               (concat ","  (propertize "Mod"
;;                              'face nil
;;                              'help-echo "Buffer has been modified"))))

;;     ;; is this buffer read-only?
;;     '(:eval (when buffer-read-only
;;               (concat ","  (propertize "RO" 'face nil 'help-echo "Buffer is read-only"))))
;;     "] "

;;     ;;global-mode-string, org-timer-set-timer in org-mode need this
;;     (propertize "%M" 'face nil)

;;     " --"
;;     ;; Don't show `minor-mode'
;;     ;; minor-mode-alist  ;; list of minor modes
;;     "%-" ;; fill with '-'
;;     ))

;; (setq-default mode-line-format
;; 	      (list
;; 	       ;; the buffer name; the file name as a tool tip
;; 	       '(:eval (propertize "%b " 'face nil 'help-echo (buffer-file-name)))

;; 	       ;; line and column
;; 	       "(" ;; '%02' to set to 2 chars at least; prevents flickering
;; 	       "%02l" "," "%01c"
;; 	       ") "

;; 	       ;; @see https://www.gnu.org/software/emacs/manual/html_node/emacs/Help-Echo.html
;; 	       "["
;; 	       ;; the current major mode for the buffer.
;; 	       '(:eval (propertize "%m" 'face nil 'help-echo buffer-file-coding-system))

;; 	       " "
;; 	       ;; buffer file encoding
;; 	       '(:eval (let ((sys (coding-system-plist buffer-file-coding-system)))
;; 			 (if (memq (plist-get sys :category)
;; 				   '(coding-category-undecided coding-category-utf-8))
;; 			     "UTF-8"
;; 			   (upcase (symbol-name (plist-get sys :name))))))
;; 	       ;; " "
;; 	       ;; ;; insert vs overwrite mode, input-method in a tooltip
;; 	       ;; '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
;; 	       ;;           'face nil
;; 	       ;;           'help-echo (concat "Buffer is in "
;; 	       ;;                        (if overwrite-mode "overwrite" "insert") " mode")))

;; 	       ;; was this buffer modified since the last save?
;; 	       '(:eval (when (buffer-modified-p)
;; 			 (concat ","  (propertize "Mod"
;; 						  'face nil
;; 						  'help-echo "Buffer has been modified"))))

;; 	       ;; is this buffer read-only?
;; 	       '(:eval (when buffer-read-only
;; 			 (concat ","  (propertize "RO" 'face nil 'help-echo "Buffer is read-only"))))
;; 	       "] "

;; 	       '(:eval
;; 		(pcase flycheck-last-status-change
;; 		  (`not-checked nil)
;; 		  (`no-checker (propertize " -" 'face 'warning))
;; 		  (`running (propertize " ✷" 'face 'success))
;; 		  (`errored (propertize " !" 'face 'error))
;; 		  (`finished
;; 		   (let* ((error-counts (flycheck-count-errors flycheck-current-errors))
;; 			  (no-errors (cdr (assq 'error error-counts)))
;; 			  (no-warnings (cdr (assq 'warning error-counts)))
;; 			  (face (cond (no-errors 'error)
;;                                       (no-warnings 'warning)
;;                                       (t 'success))))
;; 		     (propertize (format "[%s/%s]" (or no-errors 0) (or no-warnings 0))
;; 				 'face face)))
;; 		  (`interrupted " -")
;; 		  (`suspicious '(propertize " ?" 'face 'warning))))

;; 	       ;;global-mode-string, org-timer-set-timer in org-mode need this
;; 	       ;; (propertize "%M" 'face nil)

;; 	       ;; " --"
;; 	       ;; Don't show `minor-mode'
;; 	       ;; minor-mode-alist  ;; list of minor modes
;; 	       ;; "%-" ;; fill with '-'
;; 	       ))

(use-package awesome-tray
  :ensure nil
  :disabled t
  :hook (after-init . awesome-tray-mode)
  :init
  ;; (setq awesome-tray-mode-line-active-color "Gray60")
  ;; (setq awesome-tray-active-modules '("buffer-name" "awesome-tab" "git" "mode-name" "location"))
  (setq awesome-tray-active-modules '("evil" "circe" "input-method" "buffer-name" "location" "git" "mode-name" ))
  )

(use-package doom-modeline
  ;; :disabled t
  :hook (after-init . doom-modeline-mode)
  :init
  ;; How tall the mode-line should be. It's only respected in GUI.
  ;; If the actual char height is larger, it respects the actual height.
  (setq doom-modeline-height 25)

  ;; How wide the mode-line bar should be. It's only respected in GUI.
  (setq doom-modeline-bar-width 3)

  ;; The limit of the window width.
  ;; If `window-width' is smaller than the limit, some information won't be displayed.
  (setq doom-modeline-window-width-limit fill-column )

  ;; How to detect the project root.
  ;; The default priority of detection is `ffip' > `projectile' > `project'.
  ;; nil means to use `default-directory'.
  ;; The project management packages have some issues on detecting project root.
  ;; e.g. `projectile' doesn't handle symlink folders well, while `project' is unable
  ;; to hanle sub-projects.
  ;; You can specify one if you encounter the issue.
  (setq doom-modeline-project-detection 'project)

  ;; Determines the style used by `doom-modeline-buffer-file-name'.
  ;;
  ;; Given ~/Projects/FOSS/emacs/lisp/comint.el
  ;;   auto => emacs/lisp/comint.el (in a project) or comint.el
  ;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
  ;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
  ;;   truncate-with-project => emacs/l/comint.el
  ;;   truncate-except-project => ~/P/F/emacs/l/comint.el
  ;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
  ;;   truncate-all => ~/P/F/e/l/comint.el
  ;;   truncate-nil => ~/Projects/FOSS/emacs/lisp/comint.el
  ;;   relative-from-project => emacs/lisp/comint.el
  ;;   relative-to-project => lisp/comint.el
  ;;   file-name => comint.el
  ;;   buffer-name => comint.el<2> (uniquify buffer name)
  ;;
  ;; If you are experiencing the laggy issue, especially while editing remote files
  ;; with tramp, please try `file-name' style.
  ;; Please refer to https://github.com/bbatsov/projectile/issues/657.
  (setq doom-modeline-buffer-file-name-style 'relative-to-project)

  ;; Whether display icons in the mode-line.
  ;; While using the server mode in GUI, should set the value explicitly.
  (setq doom-modeline-icon (display-graphic-p))

  ;; Whether display the icon for `major-mode'. It respects `doom-modeline-icon'.
  (setq doom-modeline-major-mode-icon t)

  ;; Whether display the colorful icon for `major-mode'.
  ;; It respects `all-the-icons-color-icons'.
  (setq doom-modeline-major-mode-color-icon t)

  ;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
  (setq doom-modeline-buffer-state-icon t)

  ;; Whether display the modification icon for the buffer.
  ;; It respects `doom-modeline-icon' and `doom-modeline-buffer-state-icon'.
  (setq doom-modeline-buffer-modification-icon t)

  ;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
  (setq doom-modeline-unicode-fallback nil)

  ;; Whether display the minor modes in the mode-line.
  (setq doom-modeline-minor-modes nil)

  ;; If non-nil, a word count will be added to the selection-info modeline segment.
  (setq doom-modeline-enable-word-count nil)

  ;; Major modes in which to display word count continuously.
  ;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
  ;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
  ;; remove the modes from `doom-modeline-continuous-word-count-modes'.
  (setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

  ;; Whether display the buffer encoding.
  (setq doom-modeline-buffer-encoding t)

  ;; Whether display the indentation information.
  (setq doom-modeline-indent-info nil)

  ;; If non-nil, only display one number for checker information if applicable.
  (setq doom-modeline-checker-simple-format t)

  ;; The maximum number displayed for notifications.
  (setq doom-modeline-number-limit 99)

  ;; The maximum displayed length of the branch name of version control.
  (setq doom-modeline-vcs-max-length 12)

  ;; Whether display the perspective name. Non-nil to display in the mode-line.
  (setq doom-modeline-persp-name nil)

  ;; If non nil the default perspective name is displayed in the mode-line.
  (setq doom-modeline-display-default-persp-name nil)

  ;; If non nil the perspective name is displayed alongside a folder icon.
  (setq doom-modeline-persp-icon nil)

  ;; Whether display the `lsp' state. Non-nil to display in the mode-line.
  (setq doom-modeline-lsp t)

  ;; Whether display the GitHub notifications. It requires `ghub' package.
  (setq doom-modeline-github nil)

  ;; The interval of checking GitHub.
  (setq doom-modeline-github-interval (* 30 60))

  ;; Whether display the modal state icon.
  ;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
  (setq doom-modeline-modal-icon t)

  ;; Whether display the mu4e notifications. It requires `mu4e-alert' package.
  (setq doom-modeline-mu4e nil)

  ;; Whether display the gnus notifications.
  (setq doom-modeline-gnus nil)

  ;; Wheter gnus should automatically be updated and how often (set to 0 or smaller than 0 to disable)
  ;; (setq doom-modeline-gnus-timer 0)

  ;; Wheter groups should be excludede when gnus automatically being updated.
  ;; (setq doom-modeline-gnus-excluded-groups '("dummy.group"))

  ;; Whether display the IRC notifications. It requires `circe' or `erc' package.
  (setq doom-modeline-irc nil)

  ;; Hooks that run before/after the modeline version string is updated
  (setq doom-modeline-before-update-env-hook nil)
  (setq doom-modeline-after-update-env-hook nil)

  )

(provide 'init-modeline)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-modeline.el ends here

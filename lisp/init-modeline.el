;; ;; @see http://emacs-fu.blogspot.com/2011/08/customizing-mode-line.html
;; ;; But I need global-mode-string,
;; ;; @see http://www.delorie.com/gnu/docs/elisp-manual-21/elisp_360.html
;; ;; use setq-default to set it for /all/ modes
  (defun zilongshanren/update-persp-name ()
    (when (bound-and-true-p persp-mode)
      ;; There are multiple implementations of
      ;; persp-mode with different APIs
      (progn
             (or (not (string= persp-nil-name (safe-persp-name (get-frame-persp))))
                 "Default")
             (let ((name (safe-persp-name (get-frame-persp))))
               (propertize (concat "[" name "] ")
                           'face 'font-lock-preprocessor-face
                           'help-echo "Current Layout name.")))))


  (defun spaceline--unicode-number (str)
    "Return a nice unicode representation of a single-digit number STR."
    (cond
     ((string= "1" str) "➊")
     ((string= "2" str) "➋")
     ((string= "3" str) "➌")
     ((string= "4" str) "➍")
     ((string= "5" str) "➎")
     ((string= "6" str) "➏")
     ((string= "7" str) "➐")
     ((string= "8" str) "➑")
     ((string= "9" str) "➒")
     ((string= "0" str) "➓")))

  (defun window-number-mode-line ()
    "The current window number. Requires `window-numbering-mode' to be enabled."
    (when (bound-and-true-p window-numbering-mode)
      (let* ((num (window-numbering-get-number))
             (str (when num (int-to-string num))))
        (spaceline--unicode-number str))))


  (defun buffer-encoding-abbrev ()
    "The line ending convention used in the buffer."
    (let ((buf-coding (format "%s" buffer-file-coding-system)))
      (if (string-match "\\(dos\\|unix\\|mac\\)" buf-coding)
          (match-string 1 buf-coding)
        buf-coding)))

(defun mode-line-fill (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to
                                (- (+ right right-fringe right-margin) ,reserve)))
              'face face))

(defun mengqp/display-mode-indent-width ()
    (let ((mode-indent-level
           (catch 'break
             (dolist (test spacemacs--indent-variable-alist)
               (let ((mode (car test))
                     (val (cdr test)))
                 (when (or (and (symbolp mode) (derived-mode-p mode))
                           (and (listp mode) (apply 'derived-mode-p mode))
                           (eq 't mode))
                   (when (not (listp val))
                     (setq val (list val)))
                   (dolist (v val)
                     (cond
                      ((integerp v) (throw 'break v))
                      ((and (symbolp v) (boundp v))
                       (throw 'break (symbol-value v))))))))
             (throw 'break (default-value 'evil-shift-width)))))
      (concat "TS:" (int-to-string (or mode-indent-level 0)))))

  (setq my-flycheck-mode-line
	'(:eval
	  (pcase flycheck-last-status-change
	    ((\` not-checked) nil)
	    ((\` no-checker) (propertize " -" 'face 'warning))
	    ((\` running) (propertize " ✷" 'face 'success))
	    ((\` errored) (propertize " !" 'face 'error))
	    ((\` finished)
	     (let* ((error-counts (flycheck-count-errors flycheck-current-errors))
		    (no-errors (cdr (assq 'error error-counts)))
		    (no-warnings (cdr (assq 'warning error-counts)))
		    (face (cond (no-errors 'error)
				(no-warnings 'warning)
				(t 'success))))
	       (propertize (format "[%s/%s]" (or no-errors 0) (or no-warnings 0))
			   'face face)))
	    ((\` interrupted) " -")
	    ((\` suspicious) '(propertize " ?" 'face 'warning)))))

  (setq-default mode-line-misc-info
                (assq-delete-all 'which-func-mode mode-line-misc-info))

  (setq-default mode-line-format
                (list
                 " %1"
                 '(:eval (propertize
                          (window-number-mode-line)
                          'face
                          'font-lock-type-face))
                 " "
                 '(:eval (zilongshanren/update-persp-name))

                 ;; "%1 "
                 ;; the buffer name; the file name as a tool tip
                 '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                                     'help-echo (buffer-file-name)))


                 " [" ;; insert vs overwrite mode, input-method in a tooltip
                 '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                                     'face 'font-lock-preprocessor-face
                                     'help-echo (concat "Buffer is in "
                                                        (if overwrite-mode
                                                            "overwrite"
                                                          "insert") " mode")))

                 ;; was this buffer modified since the last save?
                 '(:eval (when (buffer-modified-p)
                           (concat "," (propertize "Mod"
                                                   'face 'font-lock-warning-face
                                                   'help-echo "Buffer has been modified"))))

                 ;; is this buffer read-only?
                 '(:eval (when buffer-read-only
                           (concat "," (propertize "RO"
                                                   'face 'font-lock-type-face
                                                   'help-echo "Buffer is read-only"))))
                 "] "

                 ;; ;; anzu
                 ;; ;; anzu--mode-line-format

                 ;; relative position, size of file
                 "["
                 (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
                 "/"
                 (propertize "%I" 'face 'font-lock-constant-face) ;; size
                 "] "

                 ;; the current major mode for the buffer.
                 '(:eval (propertize "%m" 'face 'font-lock-string-face
                                     'help-echo buffer-file-coding-system))
		 " -"
                 '(:eval (propertize (format "%s" buffer-file-coding-system) 'face 'font-lock-string-face) )
		 "- "

                 "%1 "
                 my-flycheck-mode-line
                 "%1 "
                 ;; evil state
                 '(:eval evil-mode-line-tag)

                 ;; minor modes
                 ;; '(:eval (when (> (window-width) 90)
                 ;;           minor-mode-alist))
                 " "
                 ;; git info
                 '(:eval (when (> (window-width) 120)
                           `(vc-mode vc-mode)))

                 " "

                 ;; global-mode-string goes in mode-line-misc-info
                 '(:eval (when (> (window-width) 120)
                           mode-line-misc-info))

                 (mode-line-fill 'mode-line 20)

                 ;; '(:eval (mengqp/display-mode-indent-width))
                 ;; line and column
                 " (" ;; '%02' to set to 2 chars at least; prevents flickering
                 (propertize "%02l" 'face 'font-lock-type-face) ","
                 (propertize "%02c" 'face 'font-lock-type-face)
                 ") "

                 ;; '(:eval (when (> (window-width) 80)
                 ;;           (buffer-encoding-abbrev)))
                 mode-line-end-spaces
                 ;; add the time, with the date and the emacs uptime in the tooltip
                 '(:eval (propertize (format-time-string "%H:%M")
                                     'help-echo
                                     (concat (format-time-string "%c; ")
                                             (emacs-uptime "Uptime:%hh"))))
                 ))




(provide 'init-modeline)

;;; init-modeline.el ends here

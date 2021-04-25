;;; init-python.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:
(use-package python
  :ensure nil
  :disabled t
  :hook (inferior-python-mode . (lambda ()
                                  (process-query-on-exit-flag
                                   (get-process "Python"))))
  :init
  (add-hook 'python-mode-hook
	    (lambda ()
	      (setq indent-tabs-mode nil)
	      (setq tab-width 4)))
  ;; (add-hook 'python-mode-hook
  ;;         (lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))
  ;; for executable of language server, if it's not symlinked on your PATH
  ;; (setq lsp-python-ms-executable
  ;;     "/usr/share/licenses/python-language-server~/python-language-server/output/bin/Release/osx-x64/publish/Microsoft.Python.LanguageServer")
  ;; Disable readline based native completion
  (setq python-shell-completion-native-enable nil)
  :config
  ;; Default to Python 3. Prefer the versioned Python binaries since some
  ;; systems stupidly make the unversioned one point at Python 2.
  (when (and (executable-find "python3")
             (string= python-shell-interpreter "python"))
    (setq python-shell-interpreter "python3"))
  ;; Env vars
  (with-eval-after-load 'exec-path-from-shell
    (exec-path-from-shell-copy-env "PYTHONPATH"))
  ;; Live Coding in Python
  )

(provide 'init-python)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-python.el ends here

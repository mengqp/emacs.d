;;; init-plantuml.el --- xxx -*- coding: utf-8-unix -*-
;;; Commentary:
;;; Code:

(use-package plantuml-mode
  :commands (org-src org-src-lang-modes)
  :commands (plantuml-mode org-src-lang-modes)
  :ensure t
  :defer t
  :init
  ;; Enable plantuml-mode for PlantUML files
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
  (setq tab-width 2);
  :config
  (setq plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")
  (setq plantuml-default-exec-mode 'jar)

  ;; active Org-babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(;; other Babel languages
     (plantuml . t)))

  ;; (base64-encode-string (encode-coding-string string 'utf-8-unix) t)
  (setq org-plantuml-jar-path plantuml-jar-path)
  )

(provide 'init-plantuml)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-plantuml.el ends here

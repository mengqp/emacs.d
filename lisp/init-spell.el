;;; init-spell.el --- Config for mengqp -*- coding: utf-8-unix -*-
;;; Commentary:

;; Copyright (C) 2017-2018 by mengqp


;;; Code:

;; On-the-fly spell checker
(use-package flyspell
  :ensure nil
  :disabled t
  :defer t
  :diminish
  ;; :if (executable-find "aspell")
  :hook (((text-mode outline-mode) . flyspell-mode)
	 (prog-mode . flyspell-prog-mode)
	 (flyspell-mode . (lambda ()
			    (dolist (key '("C-;" "C-," "C-."))
			      (unbind-key key flyspell-mode-map)))))
  :init
  (setq flyspell-issue-message-flag nil)
  (setq ispell-program-name "aspell")
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US" "--run-together"))

  (use-package flyspell-correct
    :defer t
    :ensure t
    )


  (use-package flyspell-correct-ivy
    :ensure t
    :defer t
    :bind ("C-M-;" . flyspell-correct-wrapper)
    :init
    (setq flyspell-correct-interface #'flyspell-correct-ivy))

  )

(provide 'init-spell)

;;; init-spell ends here

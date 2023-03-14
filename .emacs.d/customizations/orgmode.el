(require 'org-journal)
(require 'olivetti)

(setq org-journal-dir "~/Dropbox/org/journal")


(use-package epa-file
  :ensure nil
  :config
  (setq epa-file-encrypt-to '("jacob@tjoernholm.dk"))
  :custom
  (epa-file-select-keys 'silent))

(use-package org-crypt
  :ensure nil  ;; included with org-mode
  :after org
  :config
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  :custom
  (org-crypt-key "jacob@tjoernholm.dk"))

(add-hook 'org-journal-mode-hook
	(lambda ()
	  (olivetti-mode)
	  (olivetti-set-width 80)))

(add-hook 'olivetti-mode-on-hook
	(lambda ()
	  (linum-mode 0)))

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

(add-hook 'org-mode-hook
          (lambda ()
            (auto-fill-mode 1)))

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Dropbox/org-roam")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i"    . completion-at-point)
         ("C-M-r"    . org-refile)
         ("C-M-n"    . org-forward-heading-same-level)
         ("C-M-p"    . org-backward-heading-same-level)
         ("C-M-u"    . org-up-element))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies)
  (org-roam-setup))

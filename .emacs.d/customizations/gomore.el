

(defun load-gomore ()
  (interactive)

  ;; API project
  (eyebrowse-switch-to-window-config-1)
  (find-file "~/c/g/api/src/gomore_api/routes.clj")
  (add-hook 'cider-connected-hook
            (lambda ()
              (cider-run "reset")))
  (cider-jack-in-clj nil)

  ;; Web project
  (eyebrowse-switch-to-window-config-2)
  (find-file "~/c/g/web/config/routes.rb")

  ;; Notes
  (eyebrowse-switch-to-window-config-3)
  (find-file "~/Dropbox/org-roam/20230617113329-tmp.org")

  ;; SQL
  (eyebrowse-switch-to-window-config-9)
  (find-file "~/Dropbox/Notes/scratch.sql")
  (setq sql-postgres-login-params
      '((user :default "gomore")
        (database :default "gomore_development")
        (server :default "localhost")
        (port :default 5432)))

  ;; Back to first workspace by default
  (eyebrowse-switch-to-window-config-1)
  )

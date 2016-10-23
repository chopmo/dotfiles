(setq load-path (cons "~/.emacs.d/rails" load-path))
(require 'rails)
;; Make rails-core recognize Rails 2.0 style views
;; (add-to-list 'rails-templates-list "html.erb" t)

; This was not a very nice thing to enable globally!!
(remove-hook 'write-file-hooks 'untabify-before-write)

(defun open-rails-project ()
  (interactive)
  (progn
    (find-file "app/controllers/*.rb" t)
    (find-file "app/helpers/*.rb" t)
    (find-file "app/models/*.rb" t)
    (find-file "config/database.yml" t)
    (find-file "db/migrate/*.rb" t)
    (find-file "test/*.rb" t)
    (find-file "test/unit/*.rb" t)))



(defun jpt-commit-everything ()
  (interactive)
  (shell-command "git add --all")
  (shell-command "git commit -m \"Bulk commit\""))


(defun dired-open ()
  (interactive)
  (save-window-excursion
    (dired-do-async-shell-command
     "open" current-prefix-arg
     (dired-get-marked-files t current-prefix-arg))))


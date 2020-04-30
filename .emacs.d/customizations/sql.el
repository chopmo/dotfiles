

(defun jpt-sql-in-region-as-csv-copy (beg end)
  (interactive "r")
  (if (region-active-p)
      (progn
        (kill-new
         (concat
          "\\copy ("
          (replace-regexp-in-string
           "[\n;]"
           " "
           (buffer-substring-no-properties beg end))
          ") TO '/tmp.csv' CSV HEADER;"))
        (deactivate-mark)
        (message "OK"))

    (message "Region is not active")))

(define-key sql-mode-map (kbd "C-M-c") 'jpt-sql-in-region-as-csv-copy)

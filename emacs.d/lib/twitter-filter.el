; From: http://www.emacswiki.org/emacs/TwitteringMode

(setq twittering-tweet-filters '("bacon" "beef" "that is all" "lunch" "foursquare"))

(defun twittering-filter-tweets ()
  (setq non-matching-statuses '())
  (dolist (status twittering-new-tweets-statuses)
    (setq matched-tweets 0)
    (dolist (pat twittering-tweet-filters)
      (if (string-match pat (downcase (cdr (assoc 'text status))))
          (setq matched-tweets (+ 1 matched-tweets))))
    (if (= 0 matched-tweets)
        (setq non-matching-statuses (append non-matching-statuses `(,status)))))
  (setq new-statuses non-matching-statuses))
(add-hook 'twittering-new-tweets-hook 'twittering-filter-tweets)

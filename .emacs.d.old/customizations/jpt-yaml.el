;;
;; jpt-yaml-show-path-to-point: Display the "path" to the current
;; current place in a big YAML file, up to the root.
;;
;; Example: Given the following YAML file:
;;
;; ---
;; - :id: 1                   <== PARENT
;;   :country_id: 1
;;   :car_classification_options:
;;     - van
;;     - cabriolet
;;   :vat_rate: 25
;;   :daily_rate:
;;     :default: 29500
;;     :factor: 10
;;   :max_car_age: 15
;;   :examples:              <== PARENT
;;     :postal_code: 1208
;;     :pricing:             <== PARENT
;;       :small: '200-250'
;;       :medium: '250-300'
;;       :large: '300-400'   <== POINT HERE
;;
;; The message printed when invoking the function on the last line would be:
;; id: 1 => examples => pricing

(defun jpt-yaml-indentation-level (s)
  (if (string-match "^ " s)
      (+ 1 (jpt-yaml-indentation-level (substring s 1)))
    0))

(defun jpt-yaml-current-line ()
  (buffer-substring-no-properties (point-at-bol) (point-at-eol)))

(defun jpt-yaml-clean-string (s)
  (let* ((s (replace-regexp-in-string "^[ -:]*" "" s))
         (s (replace-regexp-in-string ":$" "" s)))
    s))

(defun jpt-yaml-not-blank-p (s)
  (string-match "[^[:blank:]]" s))

(defun jpt-yaml-path-to-point ()
  (save-excursion
    (let* ((line (jpt-yaml-current-line))
           (level (jpt-yaml-indentation-level line))
           result)
      (while (> (point) (point-min))
        (beginning-of-line 0)
        (setq line (jpt-yaml-current-line))

        (let ((new-level (jpt-yaml-indentation-level line)))
          (when (and (jpt-yaml-not-blank-p line)
                     (< new-level level))

            (setq level new-level)
            (setq result (push (jpt-yaml-clean-string line) result)))))

      (mapconcat 'identity result " => "))))

(defun jpt-yaml-show-path-to-point ()
  (interactive)
  (message (jpt-yaml-path-to-point)))

(eval-after-load 'yaml-mode
  '(progn
     (define-key yaml-mode-map (kbd "C-x p") 'jpt-yaml-show-path-to-point)))

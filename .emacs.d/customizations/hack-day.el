
(defun jpt-debug-out (s)
  (with-current-buffer "*scratch*"
    (erase-buffer)
    (insert (prin1-to-string s))))

(defun jpt-find-ns ()
  (interactive)
  (cider-ensure-connected)
  (cider-ensure-op-supported "ns-path")
  (let* ((namespaces (cider-sync-request:ns-list))
         (complete
          (completion-table-dynamic
           (lambda (s)
             (jpt-debug-out s)
             (when (> (length s) 0)
              (seq-filter (lambda (ns) (string-match s ns)) namespaces))))))

    (completing-read "Find namespace: " complete)))



; (global-set-key [f8] 'jpt-find-ns)


(defun jpt-swap-systems (orig-fun &rest args)
  (cider-interactive-eval "(gomore-api.test-system/swap-in-test-system)")
  (let ((res (apply orig-fun args)))
    (cider-interactive-eval "(gomore-api.test-system/swap-out-test-system)")
    res))

;; (advice-add 'cider-test-execute :around #'jpt-swap-systems)


(advice-remove 'cider-test-execute #'jpt-swap-systems)

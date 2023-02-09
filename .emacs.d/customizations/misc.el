;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

(setq ag-reuse-buffers t)

;; These functions require the ddcctl utility to be installed.
;; Clone this repo and run `make; make install` in it: https://github.com/kfix/ddcctl
(defun jpt-monitor-brightness-up (monitor-id)
  (async-shell-command (concat "ddcctl -d " (number-to-string monitor-id) " -b 10+")))

(defun jpt-monitor-brightness-down (monitor-id)
  (async-shell-command (concat "ddcctl -d " (number-to-string monitor-id) " -b 10-")))

(defun jpt-isearch-forward-word-at-point ()
  (interactive)
  (isearch-forward-word nil 1)
  (let ((bounds (find-tag-default-bounds)))
    (cond
     (bounds
      (when (< (car bounds) (point))
	(goto-char (car bounds)))
      (isearch-yank-string
       (buffer-substring-no-properties (car bounds) (cdr bounds))))
     (t
      (setq isearch-error "No symbol at point")
      (isearch-push-state)
      (isearch-update)))))

;; Default dired to copying/moving to another window
(setq dired-dwim-target t)

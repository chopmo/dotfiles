(require 'hide-lines)

(setq jpt-api-doc-mode-hiding nil)

(make-variable-buffer-local 'jpt-api-doc-mode-hiding)

(defun jpt-api-doc-mode-hide ()
  (let ((keywords '("-"
                    "android"
                    "application/json"
                    "content"
                    "description"
                    "format"
                    "introduced"
                    "ios"
                    "nullable"
                    "operationId"
                    "platform"
                    "produces"
                    "properties"
                    "removed"
                    "responses"
                    "schema"
                    "status"
                    "summary"
                    "tags"
                    "type")))
    (hide-lines-matching (mapconcat (lambda (s) (concat "^\s*" s)) keywords  "\\|"))))

(defun jpt-api-doc-mode-toggle ()
  (interactive)
  (setq jpt-api-doc-mode-hiding (not jpt-api-doc-mode-hiding))
  (if jpt-api-doc-mode-hiding
      (jpt-api-doc-mode-hide)
      (hide-lines-show-all)))

(define-minor-mode jpt-api-doc-mode
  "Toggles global API doc mode"
  nil   ; Initial value, nil for disabled
  :global t
  :group 'dotfiles
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-M-h") 'jpt-api-doc-mode-toggle)
            map)
  :lighter " API-doc")

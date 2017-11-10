;; Customizations relating to editing a buffer.

;; Key binding to use "hippie expand" for text autocompletion
;; http://www.emacswiki.org/emacs/HippieExpand
(global-set-key (kbd "M-/") 'hippie-expand)

;; Lisp-friendly hippie expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; OSX: Use Cmd as meta, don't use Option
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; When you visit a file, point goes to the last place where it
;; was when you previously visited the same file.
;; http://www.emacswiki.org/emacs/SavePlace
(require 'saveplace)
(setq-default save-place t)
;; keep track of saved places in ~/.emacs.d/places
(setq save-place-file (concat user-emacs-directory "places"))

(require 'hi-lock)

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)


;; comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

;; yay rainbows!
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;; fix weird os x kill error
(defun ns-get-pasteboard ()
  "Returns the value of the pasteboard, or nil for unsupported formats."
  (condition-case nil
      (ns-get-selection-internal 'CLIPBOARD)
    (quit nil)))

(setq electric-indent-mode nil)

(global-set-key (kbd "C-x g") 'magit-status)

;; Disable old window switching so I can get used to Windmove
;; (global-unset-key (kbd "C-x o"))

;; Always remove trailing whitespace before saving a file, because it
;; looks nice in diffs.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Always revert buffers to the file version. This is handy when
;; switching branches from the command line. Also, if the contents of
;; a file has changed, I am never interested in seeing the old
;; contents in the buffer.
(global-auto-revert-mode 1)

;; I've always found that highlighting the symbol at point is very
;; useful, but it causes a lot of visual noise if it happens
;; automatically. So I'm defining a function to toggle it on and off
;; and binding it to Super-.
(require 'hi-lock)
(defun jpt-toggle-mark-word-at-point ()
  (interactive)
  (if hi-lock-interactive-patterns
      (unhighlight-regexp (car (car hi-lock-interactive-patterns)))
    (highlight-symbol-at-point)))

(global-set-key (kbd "M-s-.") 'jpt-toggle-mark-word-at-point)

(global-set-key (kbd "s-o") 'projectile-project-buffers-other-buffer)

; (global-unset-key (kbd "s-p"))


; New

(projectile-rails-global-mode)

(global-set-key "\C-cn" (lambda () (interactive) (find-file "~/Dropbox/notes/capture.md")))
(global-set-key "\C-cs" (lambda () (interactive) (find-file "~/Dropbox/notes/scratch.md")))

;; TODO: This seems to be committing the wrong thing on Linux :-O
;; (defun jpt-commit-notes ()
;;   (interactive)
;;   (async-shell-command "cd ~/Dropbox/notes; git add -A; git commit -m \"Save\""))
;; (global-set-key "\C-cN" 'jpt-commit-notes)

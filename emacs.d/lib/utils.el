;; Functions below are from http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (cond ((not (= (count-windows) 2)) (message "You need exactly 2 windows to do this."))
        (t
         (let* ((w1 (first (window-list)))
                (w2 (second (window-list)))
                (b1 (window-buffer w1))
                (b2 (window-buffer w2))
                (s1 (window-start w1))
                (s2 (window-start w2)))
           (set-window-buffer w1 b2)
           (set-window-buffer w2 b1)
           (set-window-start w1 s2)
           (set-window-start w2 s1)))))

;;
;; Never understood why Emacs doesn't have this function.
;;
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;;
;; Never understood why Emacs doesn't have this function, either.
;;
(defun move-buffer-file (dir)
  "Moves both current buffer and file it's visiting to DIR."
  (interactive "DNew directory: ")
  (let* ((name (buffer-name))
         (filename (buffer-file-name))
         (dir
          (if (string-match dir "\\(?:/\\|\\\\)$")
              (substring dir 0 -1) dir))
         (newname (concat dir "/" name)))

    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (progn   (copy-file filename newname 1)
               (delete-file filename)
               (set-visited-file-name newname)
               (set-buffer-modified-p nil)
               t))))

(defun revert-all-buffers ()
  (interactive)
  (let ((current-buffer (buffer-name)))
    (loop for buf in (buffer-list)
          do
          (unless (null (buffer-file-name buf))
            (switch-to-buffer (buffer-name buf))
            (revert-buffer nil t)))
    (switch-to-buffer current-buffer)
    (message "All buffers reverted!")))

(defun current-font-name ()
  (cdr (assoc 'font (frame-parameters))))

(defun open-dot-emacs-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el" t))

(defun open-local-config-file ()
  (interactive)
  (find-file (calculate-local-config-filename)))

(defun remove-windows-lfs ()
  (interactive)
  (replace-regexp "
" ""))

(defun current-number ()
  (let ((s (current-word)))
    (and (string-match "[0-9]+" s) (match-string 0 s))))

(defun google (start end)
  (interactive "r")
  (let ((search-term (buffer-substring start end)))
    (browse-url (concat "http://www.google.dk/search?q=" (w3m-url-encode-string search-term)))))

(defun calculate-local-config-filename ()
  (concat "~/.emacs.d/local/" (system-name) ".el"))

(defun cadar (x)
  (car (cdr (car x))))


; From http://blog.bookworm.at/2007/03/pretty-print-xml-with-emacs.html
(defun xml-reformat-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
      (indent-region begin end)))

(defun decode-html-entities ()
  (interactive)
  (replace-regexp "&lt;" "<")
  (replace-regexp "&gt;" ">")
  (replace-regexp "&quot;" "\""))


;; Adapted from http://www.emacswiki.org/emacs/hl-line%2b.el
(defun flash-current-line (&optional arg)
  (global-hl-line-mode 1)
  (run-at-time 0.2 nil #'(lambda () (global-hl-line-mode 0))))

(defadvice move-beginning-of-line (before flash-if-at-column-zero)
  (if (= (point) (point-at-bol))
      (flash-current-line)))

(ad-activate 'move-beginning-of-line)

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(setq jpt-num-lines 8)

(defun jpt-several-lines-down ()
  (interactive)
  (dotimes (_ jpt-num-lines) (next-line)))

(defun jpt-several-lines-up ()
  (interactive)
  (dotimes (_ jpt-num-lines) (previous-line)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (define-key ruby-mode-map (kbd "C-M-n") 'jpt-several-lines-down)
            (define-key ruby-mode-map (kbd "C-M-p") 'jpt-several-lines-up)))

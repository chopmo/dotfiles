;; Known globally available great keys
;; M-i

(global-set-key (quote [f12]) (quote open-dot-emacs-file))

(global-set-key (kbd "M-J") 'windmove-left)
(global-set-key (kbd "M-K") 'windmove-down)
(global-set-key (kbd "M-I") 'windmove-up)
(global-set-key (kbd "M-L") 'windmove-right)

(global-set-key (kbd "C-M-0") 'maximize-window)
(global-set-key (kbd "C-M-9") 'balance-windows)


(global-set-key (kbd "M-P") 'projectile-ag)
(global-set-key (kbd "M-U") 'projectile-find-file)

(global-set-key (kbd "M-B") 'projectile-switch-to-buffer)

(global-set-key (kbd "M-O") 'helm-find-files)

(global-set-key (kbd "C-M-l") 'goto-line)

(global-set-key (kbd "M-!") 'delete-other-windows)

(global-set-key (kbd "M-@") (lambda () (interactive)
                              (split-window-below)
                              (balance-windows)))

(global-set-key (kbd "M-#") (lambda () (interactive)
                              (split-window-right)
                              (balance-windows)))

(global-set-key (kbd "M-k") (lambda () (interactive)
                              (delete-window)
                              (balance-windows)))

(global-set-key (kbd "M-*") 'jpt-isearch-forward-word-at-point)

(global-set-key (kbd "M-[") 'eyebrowse-prev-window-config)
(global-set-key (kbd "M-]") 'eyebrowse-next-window-config)

(global-unset-key (kbd "C-z"))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (quote [f5]) 'jpt-commit-everything)
(define-key global-map (kbd "C-\\") 'toggle-windows-split)

(global-set-key (kbd "M-M") 'mc/edit-lines)

(global-set-key (kbd "C-M-o") 'zoom-window-zoom)

(global-set-key (kbd "C-M-y") 'helm-show-kill-ring)

(global-set-key (kbd "M-H") 'auto-highlight-symbol-mode)

(global-set-key (kbd "C-M-j") 'imenu)

(global-set-key (quote [f7]) 'toggle-truncate-lines)
(global-set-key (quote [f8]) 'jpt-append-timestamp)

(global-set-key (kbd "C-S-k") 'kill-current-buffer)

(define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map)

(global-set-key (quote [f6]) 'org-journal-new-entry)

(global-set-key (kbd "C-c g") 'code-review-start)

(global-set-key (kbd "C-M-t") (lambda () (interactive)
                                (message "%s" (gomore-translation-value (current-word)))))

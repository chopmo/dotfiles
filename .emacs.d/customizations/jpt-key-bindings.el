
(global-set-key (quote [f12]) (quote open-dot-emacs-file))

; Old
(global-set-key (kbd "s-w") 'whitespace-mode)
(global-set-key (kbd "s-l") 'goto-line)
(global-set-key (kbd "s-J") 'windmove-left)
(global-set-key (kbd "s-K") 'windmove-down)
(global-set-key (kbd "s-I") 'windmove-up)
(global-set-key (kbd "s-L") 'windmove-right)
(global-set-key (kbd "s-l") 'goto-line)
(global-set-key (kbd "s-i") 'projectile-ag)
(global-set-key (kbd "s-u") 'projectile-find-file)
(global-set-key (kbd "s-b") 'helm-buffers-list)
(global-set-key (kbd "s-1") 'delete-other-windows)

(global-set-key (kbd "s-2") (lambda () (interactive)
                              (split-window-below)
                              (balance-windows)))

(global-set-key (kbd "s-3") (lambda () (interactive)
                              (split-window-right)
                              (balance-windows)))

(global-set-key (kbd "s-0") (lambda () (interactive)
                              (delete-window)
                              (balance-windows)))

(global-set-key (kbd "s-k") 'kill-this-buffer)
(global-set-key (kbd "s-f") 'helm-find-files)


; new
(global-set-key (kbd "C-s-j") 'windmove-left)
(global-set-key (kbd "C-s-k") 'windmove-down)
(global-set-key (kbd "C-s-i") 'windmove-up)
(global-set-key (kbd "C-s-l") 'windmove-right)
(global-set-key (kbd "M-s-w") 'whitespace-mode)

(global-set-key (kbd "C-M-l") 'goto-line)
(global-set-key (kbd "M-s-i") 'projectile-ag)
(global-set-key (kbd "M-s-u") 'projectile-find-file)
(global-set-key (kbd "M-s-b") 'helm-buffers-list)

(global-set-key (kbd "M-s-1") 'delete-other-windows)

(global-set-key (kbd "M-s-2") (lambda () (interactive)
                              (split-window-below)
                              (balance-windows)))

(global-set-key (kbd "M-s-3") (lambda () (interactive)
                              (split-window-right)
                              (balance-windows)))

(global-set-key (kbd "M-s-0") (lambda () (interactive)
                              (delete-window)
                              (balance-windows)))

(global-set-key (kbd "M-s-k") 'kill-this-buffer)

(global-set-key (kbd "M-s-f") 'helm-find-files)

;; Unchanged
(global-set-key (kbd "M-N") 'next-error)
(global-set-key (kbd "M-P") 'previous-error)

(global-set-key (kbd "M-n") 'next-buffer)
(global-set-key (kbd "M-p") 'previous-buffer)

(global-set-key (kbd "C-c x") 'browse-url-at-point)

(global-set-key (kbd "M-[") 'eyebrowse-prev-window-config)
(global-set-key (kbd "M-]") 'eyebrowse-next-window-config)

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "s-m"))

;; Toggle fullscreen with f11
(global-set-key (quote [f11]) 'toggle-frame-fullscreen)

(global-set-key (kbd "s-8") 'isearch-forward-symbol-at-point)

(global-set-key (kbd "M-x") 'helm-M-x)

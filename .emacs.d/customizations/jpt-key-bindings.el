
(global-set-key (quote [f12]) (quote open-dot-emacs-file))

; Old
;; (global-set-key (kbd "s-w") 'whitespace-mode)
;; (global-set-key (kbd "s-l") 'goto-line)
;; (global-set-key (kbd "s-J") 'windmove-left)
;; (global-set-key (kbd "s-K") 'windmove-down)
;; (global-set-key (kbd "s-I") 'windmove-up)
;; (global-set-key (kbd "s-L") 'windmove-right)
;; (global-set-key (kbd "s-l") 'goto-line)
;; (global-set-key (kbd "s-i") 'projectile-ag)
;; (global-set-key (kbd "s-u") 'projectile-find-file)
;; (global-set-key (kbd "s-b") 'helm-buffers-list)
;; (global-set-key (kbd "s-1") 'delete-other-windows)

;; (global-set-key (kbd "s-2") (lambda () (interactive)
;;                               (split-window-below)
;;                               (balance-windows)))

;; (global-set-key (kbd "s-3") (lambda () (interactive)
;;                               (split-window-right)
;;                               (balance-windows)))

;; (global-set-key (kbd "s-0") (lambda () (interactive)
;;                               (delete-window)
;;                               (balance-windows)))

;; (global-set-key (kbd "s-k") 'kill-this-buffer)
;; (global-set-key (kbd "s-f") 'helm-find-files)


; new
(global-set-key (kbd "M-J") 'windmove-left)
(global-set-key (kbd "M-K") 'windmove-down)
(global-set-key (kbd "M-I") 'windmove-up)
(global-set-key (kbd "M-L") 'windmove-right)

(global-set-key (kbd "C-M-0") 'maximize-window)
(global-set-key (kbd "C-M-9") 'balance-windows)

; (global-set-key (kbd "M-s-w") 'whitespace-mode)


(global-set-key (kbd "M-P") 'projectile-ag)
(global-set-key (kbd "M-U") 'projectile-find-file)
(global-set-key (kbd "M-B") 'helm-buffers-list)
(global-set-key (kbd "M-O") 'helm-find-files)

(global-set-key (kbd "C-M-l") 'goto-line)

(global-set-key (kbd "M-!") 'delete-other-windows)

(global-set-key (kbd "M-@") (lambda () (interactive)
                              (split-window-below)
                              (balance-windows)))

(global-set-key (kbd "M-#") (lambda () (interactive)
                              (split-window-right)
                              (balance-windows)))

(global-set-key (kbd "M-)") (lambda () (interactive)
                              (delete-window)
                              (balance-windows)))

;; (global-set-key (kbd "C-K") 'kill-this-buffer)

(global-set-key (kbd "M-*") 'jpt-isearch-forward-word-at-point)


;; Unchanged
;; (global-set-key (kbd "M-N") 'next-error)
;; (global-set-key (kbd "M-P") 'previous-error)

;; (global-set-key (kbd "M-n") 'switch-to-next-buffer)
;; (global-set-key (kbd "M-p") 'switch-to-prev-buffer)
(global-set-key (kbd "M-n") 'projectile-next-project-buffer)
(global-set-key (kbd "M-p") 'projectile-previous-project-buffer)

;; (global-set-key (kbd "C-c x") 'browse-url-at-point)

(global-set-key (kbd "M-[") 'eyebrowse-prev-window-config)
(global-set-key (kbd "M-]") 'eyebrowse-next-window-config)

(global-unset-key (kbd "C-z"))
;; (global-unset-key (kbd "s-m"))

;; Toggle fullscreen with f11
;; (global-set-key (quote [f11]) 'toggle-frame-fullscreen)


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

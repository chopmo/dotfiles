
(add-to-list 'load-path "~/.emacs.d/vendor/copilot.el-main")

(require 'copilot)

(add-hook 'prog-mode-hook 'copilot-mode)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

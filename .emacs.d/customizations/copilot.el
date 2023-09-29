
(add-to-list 'load-path "~/.emacs.d/vendor/copilot.el-main")

(require 'copilot)

(add-hook 'prog-mode-hook 'copilot-mode)

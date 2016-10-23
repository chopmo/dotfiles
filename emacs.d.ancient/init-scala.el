(add-to-list 'load-path "~/.emacs.d/lib/scala")

(defun me-turn-off-indent-tabs-mode ()
  (setq indent-tabs-mode nil))
(add-hook 'scala-mode-hook 'me-turn-off-indent-tabs-mode)

(require 'scala-mode-auto)

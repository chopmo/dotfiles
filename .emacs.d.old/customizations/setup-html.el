(add-hook 'html-mode-hook (lambda ()
                            (tagedit-mode 0)))

(add-hook 'mhtml-mode-hook (lambda ()
                             (tagedit-mode 0)
                             (rainbow-delimiters-mode-disable)))

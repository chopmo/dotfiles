;;;;
;; Clojure
;;;;

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; Always enable zprint mode
(add-hook 'clojure-mode-hook 'zprint-mode)

;; yay rainbows!
;; Disabling for now because it's too subtle with my color scheme
;; (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

;; A little more syntax highlighting
(require 'clojure-mode-extra-font-locking)

(eval-after-load "paredit"
  '(progn
     ;; I need the M-J keybinding for windmove
    (define-key paredit-mode-map (kbd "M-J") nil)
    (define-key paredit-mode-map (kbd "RET") nil)
    (define-key paredit-mode-map (kbd "C-M-]") 'cider-doc)
    (define-key paredit-mode-map (kbd "C-M-S-u") (lambda ()
                                                   (interactive)
                                                   (paredit-backward-up 100)))
    ))

;; clj-refactor
(add-hook 'clojure-mode-hook
          (lambda ()
            (clj-refactor-mode 1)
            (enable-paredit-mode)
            (flycheck-mode 1)))


(setq cider-repl-display-help-banner nil)
(setq cider-use-xref nil)
(setq cider-repl-display-in-current-window t)

;; Always enable paredit for clojure buffers
(add-hook 'clojure-mode-hook #'paredit-mode)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojurescript-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

(eval-after-load 'cider
  '(progn
     (define-key clojure-mode-map (kbd "C-M-r") 'cider-switch-to-repl-buffer)
     (define-key cider-repl-mode-map (kbd "C-M-r") 'cider-switch-to-last-clojure-buffer)))

(global-prettify-symbols-mode 1)
(setq clojure-align-forms-automatically t)

(require 'flycheck-clj-kondo)

(use-package lsp-mode
  :ensure t
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp))
  :config
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
     (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))

  :bind (("C-c e" . 'lsp-execute-code-action)
         ("C-c l" . 'lsp-find-references)
         ("C-c r" . 'lsp-rename)
         ("C-c n s" . 'lsp-clojure-clean-ns)))

(setq lsp-headerline-breadcrumb-enable nil)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil)

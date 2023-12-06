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

;; syntax hilighting for midje
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))))

(eval-after-load "paredit"
  '(progn
     ;; I need the M-J keybinding for windmove
    (define-key paredit-mode-map (kbd "M-J") nil)
    (define-key paredit-mode-map (kbd "RET") nil)
    (define-key paredit-mode-map (kbd "C-M-]") 'cider-doc)
    (define-key paredit-mode-map (kbd "C-M-S-u") (lambda ()
                                                   (interactive)
                                                   (paredit-backward-up 100)))))

;; clj-refactor
(add-hook 'clojure-mode-hook
          (lambda ()
            (clj-refactor-mode 1)
            (enable-paredit-mode)
            (flycheck-mode 1)))


;;;;
;; Cider
;;;;

(setq cider-repl-display-help-banner nil)
(setq cider-use-xref nil)
(setq cider-repl-display-in-current-window t)

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'eldoc-mode)

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


;; key bindings
;; these help me out with the way I usually develop web apps
(defun cider-start-http-server ()
  (interactive)
  (cider-load-current-buffer)
  (let ((ns (cider-current-ns)))
    (cider-repl-set-ns ns)
    (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
    (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))


(defun cider-refresh ()
  (interactive)
  (cider-interactive-eval (format "(load \"user\")"))
  (cider-interactive-eval (format "(user/reset)")))

(defun cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))

(defun jpt-switch-to-cider-buffer ()
  (interactive)
  (switch-to-buffer (cider-current-repl nil 'ensure)))

(eval-after-load 'cider
  '(progn
     (define-key clojure-mode-map (kbd "C-c C-v") 'cider-start-http-server)
     (define-key clojure-mode-map (kbd "C-M-r") 'cider-switch-to-repl-buffer)
     (define-key cider-repl-mode-map (kbd "C-M-r") 'cider-switch-to-last-clojure-buffer)
     (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
     (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)))

(global-prettify-symbols-mode 1)
(setq clojure-align-forms-automatically t)

(require 'flycheck-clj-kondo)

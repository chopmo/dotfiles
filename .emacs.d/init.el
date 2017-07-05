;; This config was originally based on http://www.braveclojure.com/basic-emacs/
;;
;; Thanks for a great starting point!!


;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(require 'cl) ; TODO: Still required?
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)


;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ; ido-ubiquitous

    ;; project navigation
    projectile

    ;; Display results vertically for easier scanning
    ido-vertical-mode

    ;; Use Helm for most things
    helm
    helm-projectile
    helm-ag

    ;; enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    ; smex

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    ;; Mobile org sync
    org-mobile-sync

    ;; Mode for editing CoffeeScript
    coffee-mode

    ;; Like ack but faster
    ag
    ))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;;
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")


;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")

;; Org setup
(load "org-setup.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments
   (quote
    ("--smart-case" "--nogroup" "--column" "--ignore" "log" "--")))
 '(coffee-tab-width 2)
 '(display-buffer-alist
   (quote
    (("*Async Shell Command*" display-buffer-no-window
      (nil)))))
 '(helm-buffers-fuzzy-matching t)
 '(helm-completion-in-region-fuzzy-match t)
 '(helm-mode-fuzzy-match t)
 '(linum-format "%4d")
 '(org-agenda-files (quote ("~/notes/notes.org")))
 '(package-selected-packages
   (quote
    (clj-refactor yasnippet smex helm-ag helm-projectile helm ido-vertical-mode yaml-mode projectile-rails markdown-mode+ rspec-mode ag coffee-mode tagedit projectile paredit magit ido-ubiquitous exec-path-from-shell clojure-mode-extra-font-locking cider)))
 '(rspec-use-bundler-when-possible nil)
 '(ruby-insert-encoding-magic-comment nil)
 '(safe-local-variable-values
   (quote
    ((eval define-clojure-indent
           (fnk 1))
     (eval define-clojure-indent
           (for-all 1))
     (projectile-project-type . boot-clj)
     (cider-boot-parameters . "dev")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "gray28" :distant-foreground "black"))))
 '(hl-line ((t (:background "#3a4a3a"))))
 '(linum ((t (:foreground "gray65")))))

; Helm stuff
(helm-mode 1)
(require 'helm-config)
(require 'helm-projectile)
(helm-projectile-on)
(setq helm-ag-insert-at-point 'symbol)
(setq helm-M-x-fuzzy-match t)

(global-set-key (kbd "s-f") 'helm-find-files)
(global-set-key (kbd "s-8") 'isearch-forward-symbol-at-point)

(global-set-key (kbd "M-x") 'helm-M-x)

(ido-vertical-mode)

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

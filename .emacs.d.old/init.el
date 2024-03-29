;; This config was originally based on http://www.braveclojure.com/basic-emacs/
;;
;; Thanks for a great starting point!!

;;;;
;; Packages
;;;;

;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("tromey" . "http://tromey.com/elpa/") t)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)


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

    prettier-js

    rspec-mode

    clj-refactor

    eyebrowse

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ; ido-ubiquitous

    ;; project navigation
    projectile
    projectile-rails

    ;; Display results vertically for easier scanning
    ido-vertical-mode

    ;; Use Helm for most things
    helm
    helm-projectile
    helm-ag

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    ;; Mode for editing CoffeeScript
    coffee-mode

    ;; Like ack but faster
    ag

    yasnippet

    use-package

    request

    editorconfig

    color-theme-sanityinc-tomorrow

    org-journal

    olivetti

    ;; vendor/vue-mode stuff
    vue-html-mode
    ssass-mode
    edit-indirect))

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
(add-to-list 'load-path "~/.emacs.d/vendor/mmm-mode")

(load "zprint.el")
(load "vue-mode.el")
(load "mmm-mode.el")

(add-to-list 'exec-path "~/c/dotfiles/bin")
(add-to-list 'exec-path "~/.nvm/versions/node/v16.13.1/bin")

(setq exec-path (append exec-path '("~/.nvm/versions/node/v16.13.1/bin")))

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

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")

(load "setup-js.el")

(load "setup-ruby.el")

(load "sql-setup.el")

(load "jpt-key-bindings.el")

(load "setup-html.el")

(load "git.el")

(load "jpt-yaml.el")

(load "gomore.el")

(load "orgmode.el")

(load "bookmarks.el")

(setq custom-file "~/c/dotfiles/.emacs.d/custom.el")
(load custom-file)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-definition-face ((((class color) (min-colors 89)) (:foreground "#FFFFFF" :background "#F33600"))))
 '(ahs-face ((((class color) (min-colors 89)) (:foreground "#FFFFFF" :background "#F33600"))))
 '(eyebrowse-mode-line-active ((t (:inverse-video t))))
 '(font-lock-string-face ((t (:foreground "#ad7fa8" :slant normal))))
 '(highlight-symbol-face ((t (:background "chocolate"))))
 '(hl-line ((t (:background "#3a4a3a"))))
 '(jpt-hi-gray ((t (:foreground "gray"))))
 '(linum ((t (:foreground "gray65"))))
 '(markdown-header-face-1 ((t (:height 2.0))))
 '(markdown-header-face-2 ((t (:height 1.5))))
 '(markdown-header-face-3 ((t (:weight bold :height 1.0))))
 '(mmm-default-submode-face ((t nil)))
 '(rainbow-delimiters-unmatched-face ((t (:inherit bold)))))

;; Projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

; Helm stuff
(helm-mode 1)

(require 'helm-projectile)
(helm-projectile-on)
(setq helm-ag-insert-at-point 'symbol)
(setq helm-M-x-fuzzy-match t)

(ido-vertical-mode)

;; This will be handled by i3
;; (display-battery-mode 1)
;; (display-time-mode 1)

(require 'yasnippet)
(yas-global-mode 1)

(setq ad-redefinition-action 'accept)

; (set-frame-font "-1ASC-Liberation Mono-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")

;; Enable repeated mark pops with C-u C-SPC C-SPC C-SPC etc...
(setq set-mark-command-repeat-pop t)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

(setq ag-reuse-buffers t)

;; These functions require the ddcctl utility to be installed.
;; Clone this repo and run `make; make install` in it: https://github.com/kfix/ddcctl
(defun jpt-monitor-brightness-up (monitor-id)
  (async-shell-command (concat "ddcctl -d " (number-to-string monitor-id) " -b 10+")))

(defun jpt-monitor-brightness-down (monitor-id)
  (async-shell-command (concat "ddcctl -d " (number-to-string monitor-id) " -b 10-")))

(defun jpt-isearch-forward-word-at-point ()
  (interactive)
  (isearch-forward-word nil 1)
  (let ((bounds (find-tag-default-bounds)))
    (cond
     (bounds
      (when (< (car bounds) (point))
	(goto-char (car bounds)))
      (isearch-yank-string
       (buffer-substring-no-properties (car bounds) (cdr bounds))))
     (t
      (setq isearch-error "No symbol at point")
      (isearch-push-state)
      (isearch-update)))))

;; Default dired to copying/moving to another window
(setq dired-dwim-target t)

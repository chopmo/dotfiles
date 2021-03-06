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
    ))

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

(add-to-list 'exec-path "~/c/dotfiles/bin")

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

(load "sql-setup.el")

(load "jpt-key-bindings.el")

(load "setup-html.el")

(load "git.el")

(load "yaml.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments
   (quote
    ("--smart-case" "--nogroup" "--column" "--ignore" "log" "--")))
 '(ahs-idle-interval 0.1)
 '(ahs-modes
   (quote
    (actionscript-mode apache-mode bat-generic-mode c++-mode c-mode csharp-mode css-mode dos-mode emacs-lisp-mode html-mode ini-generic-mode java-mode javascript-mode js-mode lisp-interaction-mode lua-mode latex-mode makefile-mode makefile-gmake-mode markdown-mode moccur-edit-mode nxml-mode nxhtml-mode outline-mode perl-mode cperl-mode php-mode python-mode rc-generic-mode reg-generic-mode ruby-mode sgml-mode sh-mode squirrel-mode text-mode tcl-mode visual-basic-mode clojure-mode)))
 '(cider-annotate-completion-candidates t)
 '(cider-auto-jump-to-error nil)
 '(cider-completion-use-context t)
 '(cider-lein-parameters "repl :headless :host localhost")
 '(cider-prompt-for-symbol nil)
 '(cider-save-file-on-load t)
 '(cider-stacktrace-default-filters nil)
 '(coffee-tab-width 2)
 '(completion-styles (quote (basic partial-completion emacs22)))
 '(custom-safe-themes
   (quote
    ("a10ca93d065921865932b9d7afae98362ce3c347f43cb0266d025d70bec57af1" "713f898dd8c881c139b62cf05b7ac476d05735825d49006255c0a31f9a4f46ab" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "4e63466756c7dbd78b49ce86f5f0954b92bf70b30c01c494b37c586639fa3f6f" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" default)))
 '(display-buffer-alist
   (quote
    (("*Async Shell Command*" display-buffer-no-window
      (nil)))))
 '(eyebrowse-new-workspace t)
 '(git-link-default-branch nil)
 '(git-link-use-commit t)
 '(global-auto-highlight-symbol-mode nil)
 '(helm-ag-base-command "ag --nocolor --nogroup --hidden")
 '(helm-buffer-max-length 50)
 '(helm-buffers-fuzzy-matching t)
 '(helm-completion-in-region-fuzzy-match nil)
 '(helm-completion-style (quote emacs))
 '(helm-mode-fuzzy-match nil)
 '(highlight-symbol-colors (quote ("light gray")))
 '(highlight-symbol-idle-delay 0.2)
 '(highlight-symbol-occurrence-message (quote (explicit navigation)))
 '(highlight-symbol-on-navigation-p nil)
 '(hippie-expand-try-functions-list
   (quote
    (try-expand-line try-expand-line-all-buffers try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-lisp-symbol-partially try-complete-lisp-symbol)))
 '(linum-format "%4d")
 '(magit-list-refs-sortby "-creatordate")
 '(magit-pull-or-fetch t)
 '(magit-status-sections-hook
   (quote
    (magit-insert-status-headers magit-insert-merge-log magit-insert-rebase-sequence magit-insert-am-sequence magit-insert-sequencer-sequence magit-insert-untracked-files magit-insert-unstaged-changes magit-insert-staged-changes magit-insert-unpushed-to-pushremote magit-insert-unpushed-to-upstream-or-recent magit-insert-unpulled-from-pushremote magit-insert-unpulled-from-upstream)))
 '(neo-window-width 40)
 '(package-selected-packages
   (quote
    (edit-server modus-themes minimap highlight-symbol tangotango-theme flycheck-clj-kondo neotree geiser go-mode auto-highlight-symbol vue-mode mmm-mode dockerfile-mode helm-cider kotlin-mode swift-mode zoom-window markdown-mode cljr-helm clj-refactor git-link multiple-cursors cider restclient restclient-helm haskell-mode json-mode magit-popup eyebrowse sml-mode yasnippet smex helm-ag helm-projectile helm ido-vertical-mode yaml-mode projectile-rails markdown-mode+ rspec-mode ag coffee-mode projectile paredit magit exec-path-from-shell clojure-mode-extra-font-locking)))
 '(projectile-globally-ignored-files (quote ("TAGS")))
 '(projectile-project-root-files
   (quote
    ("rebar.config" "project.clj" "build.boot" "SConstruct" "pom.xml" "build.sbt" "gradlew" "build.gradle" ".ensime" "Gemfile" "requirements.txt" "setup.py" "tox.ini" "composer.json" "Cargo.toml" "mix.exs" "stack.yaml" "info.rkt" "DESCRIPTION" "TAGS" "GTAGS")))
 '(projectile-project-root-files-bottom-up
   (quote
    (".projectile" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs")))
 '(projectile-project-root-files-top-down-recurring (quote (".svn" "CVS")))
 '(projectile-tags-command "find . -name '*.rb' | xargs etags -o TAGS")
 '(rspec-spec-command "rspec")
 '(rspec-use-bundler-when-possible nil)
 '(ruby-insert-encoding-magic-comment nil)
 '(safe-local-variable-values
   (quote
    ((eval define-clojure-indent
           (fnk 1))
     (eval define-clojure-indent
           (for-all 1))
     (projectile-project-type . boot-clj)
     (cider-boot-parameters . "dev"))))
 '(search-default-mode nil)
 '(sql-password "")
 '(sql-postgres-login-params
   (quote
    ((user :default "gomore")
     password server
     (database :default "gomore_development"))))
 '(sql-postgres-program "/usr/bin/psql")
 '(sql-product (quote postgres)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eyebrowse-mode-line-active ((t (:inverse-video t))))
 '(font-lock-string-face ((t (:foreground "#ad7fa8" :slant normal))))
 '(highlight-symbol-face ((t (:background "chocolate"))))
 '(hl-line ((t (:background "#3a4a3a"))))
 '(linum ((t (:foreground "gray65"))))
 '(mmm-default-submode-face ((t nil))))

;; Projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

; Helm stuff
(helm-mode 1)
(require 'helm-config)
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

(set-frame-font "-1ASC-Liberation Mono-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")

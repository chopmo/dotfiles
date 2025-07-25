(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments
   '("--smart-case" "--nogroup" "--column" "--ignore" "log" "--"))
 '(ahs-idle-interval 0.1)
 '(ahs-modes
   '(actionscript-mode apache-mode bat-generic-mode c++-mode c-mode
                       csharp-mode css-mode dos-mode emacs-lisp-mode
                       html-mode ini-generic-mode java-mode
                       javascript-mode js-mode lisp-interaction-mode
                       lua-mode latex-mode makefile-mode
                       makefile-gmake-mode markdown-mode
                       moccur-edit-mode nxml-mode nxhtml-mode
                       outline-mode perl-mode cperl-mode php-mode
                       python-mode rc-generic-mode reg-generic-mode
                       ruby-mode sgml-mode sh-mode squirrel-mode
                       text-mode tcl-mode visual-basic-mode
                       clojure-mode))
 '(bookmark-default-file "~/Dropbox/emacs-bookmarks")
 '(cider-annotate-completion-candidates t)
 '(cider-auto-jump-to-error nil)
 '(cider-auto-select-test-report-buffer t)
 '(cider-clojure-cli-command "clojure")
 '(cider-completion-use-context t)
 '(cider-lein-parameters "repl :headless :host localhost")
 '(cider-prompt-for-symbol nil)
 '(cider-save-file-on-load t)
 '(cider-stacktrace-default-filters nil)
 '(cider-test-show-report-on-success nil)
 '(cider-use-tooltips nil)
 '(clojure-align-binding-forms
   '("let" "when-let" "when-some" "if-let" "if-some" "binding" "loop"
     "doseq" "for" "with-open" "with-local-vars" "with-redefs" "plait"))
 '(clojure-comment-regexp "\\(?:#_ *\\)+\\(?1:[^ ]\\)")
 '(clojure-toplevel-inside-comment-form nil)
 '(coffee-tab-width 2)
 '(completion-styles '(basic partial-completion emacs22))
 '(custom-enabled-themes '(sanityinc-tomorrow-day))
 '(display-buffer-alist '(("*Async Shell Command*" display-buffer-no-window (nil))))
 '(eyebrowse-new-workspace t)
 '(flycheck-display-errors-function 'ignore)
 '(flycheck-keymap-prefix "\3f")
 '(forge-topic-list-limit '(60 . -5))
 '(git-link-default-branch nil)
 '(git-link-use-commit t)
 '(global-auto-highlight-symbol-mode nil)
 '(helm-ag-base-command "ag --nocolor --nogroup --hidden")
 '(helm-buffer-max-length 50)
 '(helm-buffers-fuzzy-matching t)
 '(helm-completion-in-region-fuzzy-match nil)
 '(helm-completion-style 'emacs)
 '(helm-mode-fuzzy-match nil)
 '(helm-move-to-line-cycle-in-source nil)
 '(highlight-symbol-colors '("light gray"))
 '(highlight-symbol-idle-delay 0.2)
 '(highlight-symbol-occurrence-message '(explicit navigation))
 '(highlight-symbol-on-navigation-p nil)
 '(hippie-expand-try-functions-list
   '(try-expand-dabbrev try-expand-dabbrev-all-buffers
                        try-expand-dabbrev-from-kill
                        try-complete-lisp-symbol-partially
                        try-complete-lisp-symbol try-expand-line))
 '(isearch-allow-motion t)
 '(ispell-dictionary nil)
 '(linum-format "%4d")
 '(magit-list-refs-sortby "-creatordate")
 '(magit-pull-or-fetch t)
 '(magit-status-sections-hook
   '(magit-insert-status-headers magit-insert-merge-log
                                 magit-insert-rebase-sequence
                                 magit-insert-am-sequence
                                 magit-insert-sequencer-sequence
                                 magit-insert-untracked-files
                                 magit-insert-unstaged-changes
                                 magit-insert-staged-changes
                                 magit-insert-unpushed-to-pushremote
                                 magit-insert-unpushed-to-upstream-or-recent
                                 magit-insert-unpulled-from-pushremote
                                 magit-insert-unpulled-from-upstream))
 '(markdown-header-scaling t)
 '(minimap-mode t)
 '(neo-window-width 40)
 '(org-agenda-files '("/home/jtj/Dropbox/org-roam"))
 '(org-agenda-skip-deadline-if-done nil)
 '(org-journal-date-format "%A, %d-%m-%Y")
 '(org-journal-enable-encryption nil)
 '(org-journal-encrypt-journal t)
 '(org-journal-file-format "%Y%m%d.org")
 '(org-journal-time-format "")
 '(org-journal-time-prefix "")
 '(org-link-frame-setup
   '((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news) (file . find-file)
     (wl . wl-other-frame)))
 '(org-reverse-note-order t)
 '(package-selected-packages
   '(ag auto-highlight-symbol cider cljr-helm
        clojure-mode-extra-font-locking color-theme-sanityinc-tomorrow
        company csv-mode dockerfile-mode edit-indirect edit-server
        exec-path-from-shell eyebrowse flycheck-clj-kondo geiser
        git-link go-mode haskell-mode helm helm-ag helm-cider
        helm-projectile hide-lines highlight-symbol ido-vertical-mode
        json-mode kotlin-mode lsp-treemacs magit magit-popup
        markdown-mode markdown-mode+ mmm-mode modus-themes
        multiple-cursors neotree nov ocamlformat olivetti org-journal
        org-roam paredit pr-review prettier-js projectile
        projectile-rails request restclient restclient-helm rspec-mode
        smex sml-mode solarized-theme ssass-mode swift-mode
        tangotango-theme tuareg unfill use-package vue-html-mode
        vue-mode yafolding yaml-mode yasnippet zoom-window))
 '(prettier-js-args '("prettier"))
 '(prettier-js-command "/usr/bin/npx")
 '(projectile-completion-system 'helm)
 '(projectile-create-missing-test-files t)
 '(projectile-globally-ignored-files '("TAGS"))
 '(projectile-project-root-files
   '("rebar.config" "project.clj" "build.boot" "SConstruct" "pom.xml"
     "build.sbt" "gradlew" "build.gradle" ".ensime" "Gemfile"
     "requirements.txt" "setup.py" "tox.ini" "composer.json"
     "Cargo.toml" "mix.exs" "stack.yaml" "info.rkt" "DESCRIPTION"
     "TAGS" "GTAGS"))
 '(projectile-project-root-files-bottom-up
   '(".projectile" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs"))
 '(projectile-project-root-files-top-down-recurring '(".svn" "CVS"))
 '(projectile-tags-command "find . -name '*.rb' | xargs etags -o TAGS")
 '(rspec-spec-command "rspec")
 '(rspec-use-bundler-when-possible t)
 '(ruby-insert-encoding-magic-comment nil)
 '(safe-local-variable-values
   '((cider-shadow-default-options . "app")
     (cider-default-cljs-repl . shadow)
     (eval define-clojure-indent (fnk 1))
     (eval define-clojure-indent (for-all 1))
     (projectile-project-type . boot-clj)
     (cider-boot-parameters . "dev")))
 '(search-default-mode nil)
 '(solarized-distinct-doc-face nil)
 '(solarized-distinct-fringe-background nil)
 '(solarized-high-contrast-mode-line t)
 '(solarized-use-less-bold nil)
 '(solarized-use-more-italic nil)
 '(sql-password "gomore")
 '(sql-postgres-login-params
   '((user :default "gomore") password server
     (database :default "gomore_development") port))
 '(sql-postgres-program "/usr/bin/psql")
 '(sql-product 'postgres)
 '(warning-suppress-types '((use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-definition-face ((((class color) (min-colors 89)) (:foreground "#FFFFFF" :background "#F33600"))))
 '(ahs-face ((((class color) (min-colors 89)) (:foreground "#FFFFFF" :background "#F33600"))))
 '(diff-added ((t (:extend t :background "#272912" :foreground "#b5bd68"))))
 '(diff-removed ((t (:extend t :background "#351c0b" :foreground "#de935f"))))
 '(eyebrowse-mode-line-active ((t (:inverse-video t))))
 '(flycheck-error ((t (:underline t))))
 '(flycheck-warning ((t (:background "dark red" :underline (:color "#de935f" :style wave)))))
 '(font-lock-string-face ((t (:foreground "#ad7fa8" :slant normal))))
 '(helm-selection ((t (:extend t :inverse-video t))))
 '(highlight-symbol-face ((t (:background "chocolate"))))
 '(hl-line ((t (:background "#3a4a3a"))))
 '(jpt-hi-gray ((t (:foreground "gray"))))
 '(linum ((t (:foreground "gray65"))))
 '(magit-diff-added ((t (:extend t :foreground "#b5bd68"))))
 '(magit-diff-added-highlight ((t (:extend t :background "#282a2e" :foreground "lawn green"))))
 '(magit-diff-file-heading ((t (:extend t :foreground "white"))))
 '(magit-diff-removed ((t (:extend t :foreground "#de935f"))))
 '(magit-diff-removed-highlight ((t (:extend t :background "#282a2e" :foreground "gold"))))
 '(markdown-header-face-1 ((t (:height 2.0))))
 '(markdown-header-face-2 ((t (:height 1.5))))
 '(markdown-header-face-3 ((t (:weight bold :height 1.0))))
 '(mmm-default-submode-face ((t nil)))
 '(org-block-begin-line ((t (:extend t :background "#1d1f21" :foreground "gray35" :slant italic))))
 '(org-block-end-line ((t (:background "#1d1f21" :foreground "gray35" :slant italic))))
 '(org-headline-todo ((t (:height 1.0 :inherit nil))))
 '(org-level-1 ((t (:inherit outline-1 :extend nil :height 1.0))))
 '(org-level-2 ((t (:inherit outline-2 :extend nil :height 1.0))))
 '(rainbow-delimiters-unmatched-face ((t (:inherit bold)))))

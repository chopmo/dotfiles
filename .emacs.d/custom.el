(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments
   '("--smart-case" "--nogroup" "--column" "--ignore" "log" "--"))
 '(ahs-idle-interval 0.1)
 '(ahs-modes
   '(actionscript-mode apache-mode bat-generic-mode c++-mode c-mode csharp-mode css-mode dos-mode emacs-lisp-mode html-mode ini-generic-mode java-mode javascript-mode js-mode lisp-interaction-mode lua-mode latex-mode makefile-mode makefile-gmake-mode markdown-mode moccur-edit-mode nxml-mode nxhtml-mode outline-mode perl-mode cperl-mode php-mode python-mode rc-generic-mode reg-generic-mode ruby-mode sgml-mode sh-mode squirrel-mode text-mode tcl-mode visual-basic-mode clojure-mode))
 '(bookmark-default-file "~/Dropbox/emacs-bookmarks")
 '(cider-annotate-completion-candidates t)
 '(cider-auto-jump-to-error nil)
 '(cider-auto-select-test-report-buffer t)
 '(cider-completion-use-context t)
 '(cider-lein-parameters "repl :headless :host localhost")
 '(cider-prompt-for-symbol nil)
 '(cider-save-file-on-load t)
 '(cider-stacktrace-default-filters nil)
 '(cider-test-show-report-on-success nil)
 '(clojure-align-binding-forms
   '("let" "when-let" "when-some" "if-let" "if-some" "binding" "loop" "doseq" "for" "with-open" "with-local-vars" "with-redefs" "plait"))
 '(coffee-tab-width 2)
 '(completion-styles '(basic partial-completion emacs22))
 '(custom-safe-themes
   '("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "3e200d49451ec4b8baa068c989e7fba2a97646091fd555eca0ee5a1386d56077" "5e2cdea6453f8963037723ab91c779b203fb201bf5c377094440f0c465d688ec" "f5b6be56c9de9fd8bdd42e0c05fecb002dedb8f48a5f00e769370e4517dde0e8" "57a29645c35ae5ce1660d5987d3da5869b048477a7801ce7ab57bfb25ce12d3e" "efcecf09905ff85a7c80025551c657299a4d18c5fcfedd3b2f2b6287e4edd659" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "d2db4af7153c5d44cb7a67318891e2692b8bf5ddd70f47ee7a1b2d03ad25fcd9" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "a10ca93d065921865932b9d7afae98362ce3c347f43cb0266d025d70bec57af1" "713f898dd8c881c139b62cf05b7ac476d05735825d49006255c0a31f9a4f46ab" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "4e63466756c7dbd78b49ce86f5f0954b92bf70b30c01c494b37c586639fa3f6f" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" default))
 '(display-buffer-alist '(("*Async Shell Command*" display-buffer-no-window (nil))))
 '(eyebrowse-new-workspace t)
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
 '(highlight-symbol-colors '("light gray"))
 '(highlight-symbol-idle-delay 0.2)
 '(highlight-symbol-occurrence-message '(explicit navigation))
 '(highlight-symbol-on-navigation-p nil)
 '(hippie-expand-try-functions-list
   '(try-expand-line try-expand-line-all-buffers try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-lisp-symbol-partially try-complete-lisp-symbol))
 '(isearch-allow-motion t)
 '(linum-format "%4d")
 '(magit-list-refs-sortby "-creatordate")
 '(magit-pull-or-fetch t)
 '(magit-status-sections-hook
   '(magit-insert-status-headers magit-insert-merge-log magit-insert-rebase-sequence magit-insert-am-sequence magit-insert-sequencer-sequence magit-insert-untracked-files magit-insert-unstaged-changes magit-insert-staged-changes magit-insert-unpushed-to-pushremote magit-insert-unpushed-to-upstream-or-recent magit-insert-unpulled-from-pushremote magit-insert-unpulled-from-upstream))
 '(markdown-header-scaling t)
 '(minimap-mode t)
 '(neo-window-width 40)
 '(org-journal-date-format "%A, %d-%m-%Y")
 '(org-journal-enable-encryption nil)
 '(org-journal-encrypt-journal t)
 '(org-journal-file-format "%Y%m%d.org")
 '(org-journal-time-format "")
 '(org-journal-time-prefix "")
 '(org-reverse-note-order t)
 '(package-selected-packages
   '(editorconfig request edit-server olivetti nov use-package color-theme-sanityinc-tomorrow hide-lines yafolding prettier-js kotlin-mode tuareg ocamlformat solarized-theme org-journal modus-themes highlight-symbol tangotango-theme neotree geiser go-mode auto-highlight-symbol vue-mode mmm-mode dockerfile-mode helm-cider swift-mode zoom-window markdown-mode cljr-helm git-link multiple-cursors restclient restclient-helm haskell-mode json-mode magit-popup eyebrowse sml-mode yasnippet smex helm-ag helm-projectile helm ido-vertical-mode yaml-mode projectile-rails markdown-mode+ rspec-mode ag projectile paredit magit exec-path-from-shell clojure-mode-extra-font-locking))
 '(projectile-globally-ignored-files '("TAGS"))
 '(projectile-project-root-files
   '("rebar.config" "project.clj" "build.boot" "SConstruct" "pom.xml" "build.sbt" "gradlew" "build.gradle" ".ensime" "Gemfile" "requirements.txt" "setup.py" "tox.ini" "composer.json" "Cargo.toml" "mix.exs" "stack.yaml" "info.rkt" "DESCRIPTION" "TAGS" "GTAGS"))
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
     (eval define-clojure-indent
           (fnk 1))
     (eval define-clojure-indent
           (for-all 1))
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
   '((user :default "gomore")
     password server
     (database :default "gomore_development")
     port))
 '(sql-postgres-program "/usr/bin/psql")
 '(sql-product 'postgres))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-definition-face ((((class color) (min-colors 89)) (:foreground "#FFFFFF" :background "#F33600"))))
 '(ahs-face ((((class color) (min-colors 89)) (:foreground "#FFFFFF" :background "#F33600"))))
 '(eyebrowse-mode-line-active ((t (:inverse-video t))))
 '(flycheck-error ((t (:underline t))))
 '(flycheck-warning ((t (:background "dark red" :underline (:color "#de935f" :style wave)))))
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

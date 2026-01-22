;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Startup and basic UI
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; no message in scratch buffer
(setq initial-scratch-message "")

;; no startup screen
(setq inhibit-startup-screen t)

(setq package-enable-at-startup t)

;; Consider all themes safe
(setq custom-safe-themes t)

;; Use ~/tmp for temporary files (Firefox snap can access home directory)
(setq temporary-file-directory "~/tmp/")

(menu-bar-mode -1)
(tool-bar-mode -1)

;; It's OK to have windows with a small height. Specifically, this
;; ensure that rspec tests are (almost) always run in a horizontal
;; split.
(setq split-height-threshold 10)

;; Show line numbers
(global-display-line-numbers-mode 1)

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(scroll-bar-mode -1)
(blink-cursor-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-verbose t)

(require 'use-package)
(setq use-package-always-demand t)
(setq use-package-always-ensure t)
(setq load-prefer-newer t)

(require 'org)

(use-package emacsql)
(use-package paredit)
(use-package clojure-mode)
(use-package clojure-mode-extra-font-locking)
(use-package cider)
(use-package prettier)
(use-package rspec-mode)
(use-package clj-refactor)
(use-package eyebrowse)
(use-package projectile)
(use-package projectile-rails)
(use-package ido-vertical-mode)
(use-package helm)

(use-package helm-projectile
  :ensure t
  :bind (("M-U" . 'helm-projectile)))

(use-package helm-ag)
(use-package rainbow-delimiters)
(use-package tagedit)
(use-package magit
  :config
  (setq magit-pull-arguments '("--rebase" "--all")))

(use-package ag)
(use-package yasnippet)
(use-package request)
(use-package color-theme-sanityinc-tomorrow)

(use-package org
  :config (require 'org-tempo))

(use-package org-journal)

(use-package olivetti)
(use-package flycheck-clj-kondo)
(use-package vue-html-mode)
(use-package ssass-mode)
(use-package edit-indirect)
(use-package zoom-window)
(use-package auto-highlight-symbol)
(use-package git-link)
(use-package restclient)
(use-package yaml-mode
  :config
  (add-hook 'yaml-mode-hook (lambda ()
                              (lsp-headerline-breadcrumb-mode t)))

  :bind (("C-x p" . 'jpt-yaml-show-path-to-point)))

(use-package company
  :bind (("C-M-i" . company-complete)))
(setq package-check-signature 'allow-unsigned)

(use-package gnu-elpa-keyring-update)

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

  :custom
  (lsp-eldoc-enable-hover nil)

  :bind (("C-c e" . 'lsp-execute-code-action)
         ("C-c l" . 'lsp-find-references)
         ("C-c r" . 'lsp-rename)
         ("C-c n s" . 'lsp-clojure-clean-ns)))

(use-package lsp-treemacs
  :ensure t
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp)))

(use-package epa-file
  :ensure nil
  :config
  (setq epa-file-encrypt-to '("jacob@tjoernholm.dk"))
  :custom
  (epa-file-select-keys 'silent))

(use-package org-crypt
  :ensure nil  ;; included with org-mode
  :after org
  :config
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  :custom
  (org-crypt-key "jacob@tjoernholm.dk"))

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Sync/org-roam")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i"    . completion-at-point)
         ("C-M-r"    . org-refile)
         ("C-M-n"    . org-forward-heading-same-level)
         ("C-M-p"    . org-backward-heading-same-level)
         ("C-M-u"    . org-up-element)
         ("C-}" . org-open-at-point)
         ("C-{" . org-mark-ring-goto))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies)
  (org-roam-setup))

(use-package swift-mode
  :ensure t)

(use-package kotlin-mode
  :ensure t)

(use-package yafolding
  :ensure t)

(use-package pr-review
  :bind ("C-M-g" . jpt-start-pr-review))

(use-package dockerfile-mode
  :ensure t)

(use-package whole-line-or-region
  :ensure t
  :init (whole-line-or-region-global-mode 1))

(use-package emacs-everywhere
  :ensure t)

(use-package elfeed
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Customizations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq custom-file "~/c/dotfiles/.emacs.d/custom.el")
(load custom-file)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Vendor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/c/dotfiles/.emacs.d/vendor")
(add-to-list 'load-path "~/c/dotfiles/.emacs.d/vendor/mmm-mode")

(load "zprint.el")
(load "vue-mode.el")
(load "mmm-mode.el")

(add-to-list 'exec-path "~/c/dotfiles/bin")
(add-to-list 'exec-path "~/.nvm/versions/node/v22.15.0/bin")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Shell integration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (setenv "SHELL" "/bin/zsh")
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Navigation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; "When several buffers visit identically-named files,
;; Emacs must give the buffers distinct names. The usual method
;; for making buffer names unique adds ‘<2>’, ‘<3>’, etc. to the end
;; of the buffer names (all but one of them).
;; The forward naming method includes part of the file's directory
;; name at the beginning of the buffer name
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)

;; ido-mode allows you to more easily navigate choices. For example,
;; when you want to switch buffers, ido presents you with a list
;; of buffers in the the mini-buffer. As you start to type a buffer's
;; name, ido will narrow down the list of buffers to match the text
;; you've typed in
;; http://www.emacswiki.org/emacs/InteractivelyDoThings
(ido-mode t)

;; This allows partial matches, e.g. "tl" will match "Tyrion Lannister"
(setq ido-enable-flex-matching t)

;; Turn this behavior off because it's annoying
(setq ido-use-filename-at-point nil)

;; Don't try to match file across all "work" directories; only match files
;; in the current directory displayed in the minibuffer
(setq ido-auto-merge-work-directories-length -1)

;; Includes buffer names of recently open files, even if they're not
;; open now
(setq ido-use-virtual-buffers t)

;; projectile everywhere!
(projectile-global-mode)

;; Open this file with f12 for convenience
(defun open-dot-emacs-file ()
  (interactive)
  (find-file "~/c/dotfiles/.emacs.d/init.el" t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; UI
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-theme 'sanityinc-tomorrow-night t)

;; These settings relate to how emacs interacts with your operating system
(setq
 ;; makes killing/yanking interact with the clipboard
 select-enable-clipboard t

 ;; I'm actually not sure what this does but it's recommended?
 select-enable-primary t

 ;; Save clipboard strings into kill ring before replacing them.
 ;; When one selects something in another program to paste it into Emacs,
 ;; but kills something in Emacs before actually pasting it,
 ;; this selection is gone unless this variable is non-nil
 save-interprogram-paste-before-kill t

 ;; Shows all options when running apropos. For more info,
 ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
 apropos-do-all t

 ;; Mouse yank commands yank at point instead of at click.
 mouse-yank-at-point t)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; no bell
(setq ring-bell-function 'ignore)

;; Eyebrowse workspace manager: https://github.com/wasamasa/eyebrowse
(eyebrowse-mode t)
(eyebrowse-setup-opinionated-keys)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Editing
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key binding to use "hippie expand" for text autocompletion
;; http://www.emacswiki.org/emacs/HippieExpand

;; Lisp-friendly hippie expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

;; comments
(defun jpt-toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(setq electric-indent-mode nil)


;; Always remove trailing whitespace before saving a file, because it
;; looks nice in diffs.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Always revert buffers to the file version. This is handy when
;; switching branches from the command line. Also, if the contents of
;; a file has changed, I am never interested in seeing the old
;; contents in the buffer.
(global-auto-revert-mode 1)

;; I've always found that highlighting the symbol at point is very
;; useful, but it causes a lot of visual noise if it happens
;; automatically. So I'm defining a function to toggle it on and off
;; and binding it to Super-.

(projectile-rails-global-mode)

(setq tags-revert-without-query 1)

(defun jpt-insert-date-heading ()
  (interactive)
  ;;(end-of-buffer)
  (insert (concat
           "\n* "
           (format-time-string "%a %d-%m-%Y %H:%M" (current-time))
           "\n\n")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Elisp editing
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Automatically load paredit when editing a lisp file
;; More at http://www.emacswiki.org/emacs/ParEdit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Clojure
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; Always enable zprint mode
(add-hook 'clojure-mode-hook 'zprint-mode)

;; A little more syntax highlighting
;; (require 'clojure-mode-extra-font-locking)

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
;; (add-hook 'clojure-mode-hook #'paredit-mode)

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
(add-to-list 'auto-mode-alist '("\\.lein-env$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojurescript-mode))

(eval-after-load 'cider
  '(progn
     (define-key clojure-mode-map (kbd "C-M-r") 'cider-switch-to-repl-buffer)
     (define-key cider-repl-mode-map (kbd "C-M-r") 'cider-switch-to-last-clojure-buffer)))

(global-prettify-symbols-mode 1)
;; I use zprint for this
;; (setq clojure-align-forms-automatically t)

(setq lsp-headerline-breadcrumb-enable nil)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; JS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-hook 'js-mode-hook 'subword-mode)
(add-hook 'js-mode-hook 'prettier-mode)
(add-hook 'html-mode-hook 'subword-mode)
(setq js-indent-level 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Ruby
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq jpt-num-lines 8)

(defun jpt-several-lines-down ()
  (interactive)
  (dotimes (_ jpt-num-lines) (next-line)))

(defun jpt-several-lines-up ()
  (interactive)
  (dotimes (_ jpt-num-lines) (previous-line)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (define-key ruby-mode-map (kbd "C-M-n") 'jpt-several-lines-down)
            (define-key ruby-mode-map (kbd "C-M-p") 'jpt-several-lines-up)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SQL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Silence compiler warnings
(defvar sql-product)
(defvar sql-prompt-regexp)
(defvar sql-prompt-cont-regexp)

(defun jpt-sql-in-region-as-csv-copy (beg end)
  (interactive "r")
  (if (region-active-p)
      (progn
        (kill-new
         (concat
          "\\copy ("
          (replace-regexp-in-string
           "[\n;]"
           " "
           (buffer-substring-no-properties beg end))
          ") TO '/tmp.csv' CSV HEADER;"))
        (deactivate-mark)
        (message "OK"))

    (message "Region is not active")))

(add-hook 'sql-interactive-mode-hook 'my-sql-interactive-mode-hook)
(defun my-sql-interactive-mode-hook ()
  "Custom interactive SQL mode behaviours. See `sql-interactive-mode-hook'."
  (when (eq sql-product 'postgres)
    ;; Allow symbol chars in database names in prompt.
    ;; Default postgres pattern was: "^\\w*=[#>] " (see `sql-product-alist').
    (setq sql-prompt-regexp "^\\(?:\\sw\\|\\s_\\)*=[#>] ")
    ;; Ditto for continuation prompt: "^\\w*[-(][#>] "
    (setq sql-prompt-cont-regexp "^\\(?:\\sw\\|\\s_\\)*[-(][#>] "))

  ;; Deal with inline prompts in query output.
  ;; Runs after `sql-interactive-remove-continuation-prompt'.
  (add-hook 'comint-preoutput-filter-functions
            'my-sql-comint-preoutput-filter :append :local)

  (define-key sql-mode-map (kbd "C-M-c") 'jpt-sql-in-region-as-csv-copy))

(defun my-sql-comint-preoutput-filter (output)
  "Filter prompts out of SQL query output. Runs after `sql-interactive-remove-continuation-prompt' in `comint-preoutput-filter-functions'."
  ;; If the entire output is simply the main prompt, return that.
  ;; (i.e. When simply typing RET at the sqli prompt.)
  (if (string-match (concat "\\`\\(" sql-prompt-regexp "\\)\\'") output)
      output
    ;; Otherwise filter all leading prompts from the output.
    ;; Store the buffer-local prompt patterns before changing buffers.
    (let ((main-prompt sql-prompt-regexp)
          (any-prompt comint-prompt-regexp) ;; see `sql-interactive-mode'
          (prefix-newline nil))
      (with-temp-buffer
        (insert output)
        (goto-char (point-min))
        (when (looking-at main-prompt)
          (setq prefix-newline t))
        (while (looking-at any-prompt)
          (replace-match ""))
        ;; Prepend a newline to the output, if necessary.
        (when prefix-newline
          (goto-char (point-min))
          (unless (looking-at "\n")
            (insert "\n")))
        ;; Return the filtered output.
        (buffer-substring-no-properties (point-min) (point-max))))))

(defadvice sql-send-string (before my-prefix-newline-to-sql-string)
  "Force all `sql-send-*' commands to include an initial newline. This is a trivial solution to single-line queries tripping up my custom output filter.  (See `my-sql-comint-preoutput-filter'.)"
  (ad-set-arg 0 (concat "\n" (ad-get-arg 0))))
(ad-activate 'sql-send-string)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; HTML
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'html-mode-hook (lambda ()
                            (tagedit-mode 0)))

(add-hook 'mhtml-mode-hook (lambda ()
                             (tagedit-mode 0)
                             (rainbow-delimiters-mode-disable)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Git
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun jpt-commit-everything ()
  (interactive)
  (shell-command "git add --all")
  (shell-command "git commit -m \"Bulk commit\""))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; YAML
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; jpt-yaml-show-path-to-point: Display the "path" to the current
;; current place in a big YAML file, up to the root.
;;
;; Example: Given the following YAML file:
;;
;; ---
;; - :id: 1                   <== PARENT
;;   :country_id: 1
;;   :car_classification_options:
;;     - van
;;     - cabriolet
;;   :vat_rate: 25
;;   :daily_rate:
;;     :default: 29500
;;     :factor: 10
;;   :max_car_age: 15
;;   :examples:              <== PARENT
;;     :postal_code: 1208
;;     :pricing:             <== PARENT
;;       :small: '200-250'
;;       :medium: '250-300'
;;       :large: '300-400'   <== POINT HERE
;;
;; The message printed when invoking the function on the last line would be:
;; id: 1 => examples => pricing

(defun jpt-yaml-indentation-level (s)
  (if (string-match "^ " s)
      (+ 1 (jpt-yaml-indentation-level (substring s 1)))
    0))

(defun jpt-yaml-current-line ()
  (buffer-substring-no-properties (point-at-bol) (point-at-eol)))

(defun jpt-yaml-clean-string (s)
  (let* ((s (replace-regexp-in-string "^[ -:]*" "" s))
         (s (replace-regexp-in-string ":$" "" s)))
    s))

(defun jpt-yaml-not-blank-p (s)
  (string-match "[^[:blank:]]" s))

(defun jpt-yaml-path-to-point ()
  (save-excursion
    (let* ((line (jpt-yaml-current-line))
           (level (jpt-yaml-indentation-level line))
           result)
      (while (> (point) (point-min))
        (beginning-of-line 0)
        (setq line (jpt-yaml-current-line))

        (let ((new-level (jpt-yaml-indentation-level line)))
          (when (and (jpt-yaml-not-blank-p line)
                     (< new-level level))

            (setq level new-level)
            (setq result (push (jpt-yaml-clean-string line) result)))))

      (mapconcat 'identity result " => "))))

(defun jpt-yaml-show-path-to-point ()
  (interactive)
  (message (jpt-yaml-path-to-point)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Gomore
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'request)

(defun gomore-translation-value (translation-key)
  (let ((body (request-response-data
               (request "https://gomore.dk/locales/2/translations"
                 :sync t
                 :params (list
                          (cons "query" translation-key)
                          (cons "format" "json"))
                 :parser 'json-read))))
    (alist-get 'value
               (aref body 0))))

(defun load-gomore ()
  (interactive)

  ;; API project
  (eyebrowse-switch-to-window-config-1)
  (find-file "~/c/g/backend/api/src/gomore_api/routes.clj")
  (add-hook 'cider-connected-hook
            (lambda ()
              (cider-run "reset")))
  (cider-jack-in-clj nil)

  ;; Web project
  (eyebrowse-switch-to-window-config-2)
  (find-file "~/c/g/backend/web/config/routes.rb")

  ;; Notes
  (eyebrowse-switch-to-window-config-3)
  (find-file "~/Sync/org-roam/20230617113329-tmp.org")

  ;; SQL
  (eyebrowse-switch-to-window-config-9)
  (find-file "~/Sync/Notes/scratch.sql")
  (setq sql-postgres-login-params
      '((user :default "gomore")
        (database :default "gomore_development")
        (server :default "localhost")
        (port :default 5432)))

  ;; Back to first workspace by default
  (eyebrowse-switch-to-window-config-1))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Org mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-journal-dir "~/Sync/org/journal")
;; (setq org-default-notes-file "~/Sync/org-roam/inbox.org")

(add-hook 'org-journal-mode-hook
	(lambda ()
	  (olivetti-mode)
	  (olivetti-set-width 80)))

(add-hook 'olivetti-mode-on-hook
	(lambda ()
	  (display-line-numbers-mode 0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Projectile
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(projectile-mode 1)
(helm-mode 1)
(helm-projectile-on)
(setq helm-ag-insert-at-point 'symbol)
(setq helm-M-x-fuzzy-match t)

(ido-vertical-mode)
(yas-global-mode 1)

(setq ad-redefinition-action 'accept)

;; Enable repeated mark pops with C-u C-SPC C-SPC C-SPC etc...
(setq set-mark-command-repeat-pop t)

;; Changes all yes/no questions to y/n type
(setq use-short-answers t)

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

;;
;; jpt-yaml-show-path-to-point: Display the "path" to the current
;; current place in a big YAML file, up to the root.
;;
;; Example: Given the following YAML file:
;;
;; ---
;; - :id: 1                   <== PARENT
;;   :country_id: 1
;;   :car_classification_options:
;;     - van
;;     - cabriolet
;;   :vat_rate: 25
;;   :daily_rate:
;;     :default: 29500
;;     :factor: 10
;;   :max_car_age: 15
;;   :examples:              <== PARENT
;;     :postal_code: 1208
;;     :pricing:             <== PARENT
;;       :small: '200-250'
;;       :medium: '250-300'
;;       :large: '300-400'   <== POINT HERE
;;
;; The message printed when invoking the function on the last line would be:
;; id: 1 => examples => pricing

(defun jpt-yaml-indentation-level (s)
  (if (string-match "^ " s)
      (+ 1 (jpt-yaml-indentation-level (substring s 1)))
    0))

(defun jpt-yaml-current-line ()
  (buffer-substring-no-properties (point-at-bol) (point-at-eol)))

(defun jpt-yaml-clean-string (s)
  (let* ((s (replace-regexp-in-string "^[ -:]*" "" s))
         (s (replace-regexp-in-string ":$" "" s)))
    s))

(defun jpt-yaml-not-blank-p (s)
  (string-match "[^[:blank:]]" s))

(defun jpt-yaml-path-to-point ()
  (save-excursion
    (let* ((line (jpt-yaml-current-line))
           (level (jpt-yaml-indentation-level line))
           result)
      (while (> (point) (point-min))
        (beginning-of-line 0)
        (setq line (jpt-yaml-current-line))

        (let ((new-level (jpt-yaml-indentation-level line)))
          (when (and (jpt-yaml-not-blank-p line)
                     (< new-level level))

            (setq level new-level)
            (setq result (push (jpt-yaml-clean-string line) result)))))

      (mapconcat 'identity result " => "))))

(defun jpt-yaml-show-path-to-point ()
  (interactive)
  (message (jpt-yaml-path-to-point)))

(defun jpt-org-dir (dir)
  (interactive)
  (setq org-agenda-files (list dir))
  (setq org-roam-directory dir)
  (setq org-default-notes-file (concat dir "/inbox.org"))
  (org-roam-db-sync))

(server-start)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Key bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(global-set-key (quote [f11]) 'org-agenda-list)
(global-set-key (quote [f12]) (quote open-dot-emacs-file))

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(global-set-key (quote [f9])
                (lambda () (interactive) (org-capture nil "t")))

(global-set-key (kbd "M-J") 'windmove-left)
(global-set-key (kbd "M-K") 'windmove-down)
(global-set-key (kbd "M-I") 'windmove-up)
(global-set-key (kbd "M-L") 'windmove-right)

(global-set-key (kbd "C-M-0") 'maximize-window)
(global-set-key (kbd "C-M-9") 'balance-windows)


(global-set-key (kbd "M-P") 'projectile-ag)
(global-set-key (kbd "M-U") 'projectile-find-file)

(global-set-key (kbd "M-B") 'projectile-switch-to-buffer)

(global-set-key (kbd "M-O") 'helm-find-files)

(global-set-key (kbd "C-M-l") 'goto-line)

(global-set-key (kbd "M-!") 'delete-other-windows)

(global-set-key (kbd "M-@") (lambda () (interactive)
                              (split-window-below)
                              (balance-windows)))

(global-set-key (kbd "M-#") (lambda () (interactive)
                              (split-window-right)
                              (balance-windows)))

(global-set-key (kbd "M-k") (lambda () (interactive)
                              (delete-window)
                              (balance-windows)))

(global-set-key (kbd "M-*") 'jpt-isearch-forward-word-at-point)

(global-set-key (kbd "M-[") 'eyebrowse-prev-window-config)
(global-set-key (kbd "M-]") 'eyebrowse-next-window-config)

(global-unset-key (kbd "C-z"))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (quote [f5]) 'jpt-commit-everything)

(global-set-key (kbd "M-M") 'mc/edit-lines)

(global-set-key (kbd "C-M-o") 'zoom-window-zoom)

(global-set-key (kbd "C-M-y") 'helm-show-kill-ring)

(global-set-key (kbd "M-H") 'auto-highlight-symbol-mode)

(global-set-key (kbd "C-M-j") 'helm-imenu)

(global-set-key (quote [f7]) 'toggle-truncate-lines)
(global-set-key (quote [f8]) 'jpt-insert-date-heading)

(global-set-key (kbd "C-S-k") 'kill-current-buffer)

(define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map)

(global-set-key (quote [f6]) 'org-journal-new-entry)

(global-set-key (kbd "C-c g") 'code-review-start)

(global-set-key (kbd "C-M-t") (lambda () (interactive)
                                (message "%s" (gomore-translation-value (current-word)))))

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-;") 'jpt-toggle-comment-on-line)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-RET") 'bookmark-jump)
(global-set-key (kbd "C-x C-o") 'browse-url-at-point)
(global-set-key (kbd "M-p") (lambda () (interactive) (previous-line 10)))
(global-set-key (kbd "M-n") (lambda () (interactive) (next-line 10)))
(global-set-key (kbd "C-c o h")
                (lambda ()
                  (interactive)
                  (jpt-org-dir "~/Sync/org-roam/home")))

(global-set-key (kbd "C-c o w")
                (lambda ()
                  (interactive)
                  (jpt-org-dir "~/Sync/org-roam/work")))

(defun get-x-clipboard-content ()
  (when (display-graphic-p)
    (let ((clipboard-content (gui-get-selection 'CLIPBOARD 'UTF8_STRING)))
      (if clipboard-content
          (substring-no-properties clipboard-content)
        ""))))

(defun jpt-start-pr-review ()
  (interactive)
  (pr-review (get-x-clipboard-content)))

;; Add variant of ag search without test code
(defun jpt-helm-projectile-ag-exclude-test ()
  "Run helm-projectile-ag but exclude the test/ directory."
  (interactive)
  (let ((helm-ag-base-command "ag --ignore=test/ --ignore=spec/ --nocolor --nogroup"))
    (helm-projectile-ag)))

(global-set-key (kbd "C-M-S-p") 'jpt-helm-projectile-ag-exclude-test)

;; Org mode
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "pink" :weight bold :height 1.0))
        ("DONE" . (:foreground "green" :weight bold :height 1.0))
        ("IN-PROGRESS" . (:foreground "blue" :weight bold :height 1.0))))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
         "* TODO %?\nDEADLINE: %t\n%i\n%a")))

;; mu4e setup
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")

(require 'mu4e)
(setq send-mail-function 'smtpmail-send-it)    ; should not be modified
(setq smtpmail-smtp-server "smtp.gmail.com") ; host running SMTP server
(setq smtpmail-smtp-service 587)               ; SMTP service port number
(setq smtpmail-stream-type 'starttls)          ; type of SMTP connections to use

;; Mail folders:
(setq mu4e-drafts-folder "/[Gmail]/Drafts"
      mu4e-sent-folder   "/[Gmail]/Sent Mail"
      mu4e-trash-folder  "/[Gmail]/Trash"
      mu4e-refile-folder "/[Gmail]/All Mail")

;; The command used to get your emails (adapt this line, see section 2.3):
(setq mu4e-get-mail-command "mbsync --config ~/.emacs.d/.mbsyncrc gomore-gmail-channel")

;; Further customization:
(setq ;mu4e-html2text-command "w3m -T text/html" ; how to hanfle html-formatted emails
      mu4e-update-interval 300                  ; seconds between each mail retrieval
      mu4e-headers-auto-update t                ; avoid to type `g' to update
      mu4e-view-show-images t                   ; show images in the view buffer
      mu4e-compose-signature-auto-include nil   ; I don't want a message signature
      mu4e-use-fancy-chars t                    ; allow fancy icons for mail threads
      mu4e-attachment-dir "~/Downloads"         ; save attachments to Downloads
      mu4e-confirm-quit nil                     ; don't ask for confirmation when quitting
      user-mail-address "jacob@gomore.com"
      user-full-name "Jacob Tjørnholm"
      mu4e-index-cleanup nil      ;; don't do a full cleanup check
      mu4e-index-lazy-check t     ;; don't consider up-to-date dirs
      mu4e-view-fields '(:from :subject :date)) ;; minimal fields, hide :to :cc :maildir :mailing-list :tags

;; Prefer text/plain over HTML when both are available
;; (setq mm-discouraged-alternatives '("text/html" "text/richtext"))

;; Modern Emacs uses shr (Simple HTML Renderer) for HTML emails
;; Configure it for better rendering
(setq shr-use-colors nil)  ; Don't use HTML colors
(setq shr-max-image-proportion 0.6)  ; Limit image size

;; Hide To and CC fields in message view using gnus settings
(setq gnus-visible-headers "^From:\\|^Subject:\\|^Date:")
(setq gnus-ignored-headers "^^Maildir:\\|References:\\|^Xref:")

;; (setq gnus-visible-headers
;;       "^From:\\|^Subject:\\|^Date:\\|^Maildir:\\|^Mailing-List:\\|^Tags:")

;; Toggle function to show/hide all headers
(defun mu4e-view-toggle-headers ()
  "Toggle between showing minimal headers and all headers."
  (interactive)
  (if (string= gnus-visible-headers ".*")
      ;; Currently showing all, switch to minimal
      (progn
        (setq gnus-visible-headers "^From:\\|^Subject:\\|^Date:")
        (message "Headers: minimal"))
    ;; Currently minimal, switch to all
    (progn
      (setq gnus-visible-headers ".*")
      (message "Headers: all")))
  (when (derived-mode-p 'mu4e-view-mode)
    (mu4e-view-refresh)))

;; Bind it to 'h' in mu4e-view-mode
(add-hook 'mu4e-view-mode-hook
          (lambda ()
            (local-set-key (kbd "h") 'mu4e-view-toggle-headers)))

;; Do not reply to yourself:
(setq mu4e-compose-reply-ignore-address '("no-?reply" "jacob@gomore.com"))

;; Do not use auto-fill-mode for emails:
(defun auto-fill-mode-off ()
  (auto-fill-mode 0))
(add-hook 'mu4e-compose-mode-hook 'auto-fill-mode-off)

(setq shr-color-visible-luminance-min 80)

(setq mail-user-agent 'mu4e-user-agent)
(set-variable 'read-mail-command 'mu4e)

(setq gnus-unbuttonized-mime-types nil)

(keymap-set mu4e-view-mode-map (kbd "K")
            (lambda ()
              (interactive)
              (gnus-article-jump-to-part 1)
              (gnus-article-press-button)
              (gnus-article-press-button)))

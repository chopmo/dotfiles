;;; Load path
;;; =========
(setq load-path (append (list "~/.emacs.d"
                              "~/.emacs.d/lib"
                              "~/.emacs.d/org2blog"
                              "~/.emacs.d/lib/twittering-mode-2.0.0") load-path))

(load "env")

(require 'org-install)
(require 'org-latex)

(require 'thrift-mode)

(require 'rspec-mode)
(global-set-key '[f7] 'rspec-verify)
(global-set-key (kbd "C-M-S-r") '(lambda () (interactive) (call-interactively (key-binding "\C-c,r"))))
(global-set-key [(meta x)] 'execute-extended-command)

(require 'pivotal-tracker)
(require 'autopair)

;;; Load ELPA
;;; =========
(require 'package)
(package-initialize)

(require 'scss-mode)
(require 'markdown-mode)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))


;;; UTF-8 encoding
;;; ==============
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;; Ruby support
;;; ============
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(add-hook 'ruby-mode-hook
          '(lambda ()
                                        ;(inf-ruby-keys)
             ;; Undo ruby-mode shortcut overwrites
             (define-key ruby-mode-map "\e\C-p" nil)
             (define-key ruby-mode-map "\e\C-n" nil)
             (define-key ruby-mode-map (kbd "M-C-h") nil)))


(require 'color-theme-ir-black)
(color-theme-ir-black)

(require 'twittering-mode)
(load "twitter-filter.el")
(setq twittering-icon-mode nil)
(setq twittering-timer-interval 300)         ; Update your timeline each 300 seconds (5 minutes)
(setq twittering-url-show-status nil)        ; Keeps the echo area from showing all the http processes
(setq twittering-use-master-password t)
(setq twittering-number-of-tweets-on-retrieval 50)
(setq twittering-status-format "%i %s,  %@:\n%FILL[  ]{%T %R}\n ")

                                        ; Now choose color-theme-solarized-light
                                        ; Now choose color-theme-solarized-dark

                                        ; Scala support
(add-hook 'scala-mode-hook
          (lambda ()
            (setq imenu-create-index-function 'scala-imenu-create-index)))


(require 'rvm)
(add-to-list 'load-path "~/.emacs.d/lib/rdebug")
(require 'rdebug)

(require 'yari)
(global-set-key (kbd "M-C-y") 'yari)

                                        ; (load "js2.el")

(require 'sunrise-commander)

;;; Support for a few other formats
;;; ===============================
                                        ; (autoload 'haml-mode "haml-mode" "" t)
(autoload 'sass-mode "sass-mode" "" t)

(require 'haml-mode)

(autoload 'yaml-mode "yaml-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(require 'aes)
(aes-enable-auto-decryption)

(require 'epa-file)
(epa-file-enable)

(load "ido-init.el")
(load "init-scala.el")
(load "dired-init.el")

                                        ; (load "init-org.el")

                                        ; Rinari
;; (add-to-list 'load-path "~/.emacs.d/lib/rinari")
;; (require 'rinari)

                                        ; (require 'find-file-in-project)
(setq ffip-patterns '("*.html" "*.org" "*.txt" "*.md" "*.el" "*.clj" "*.py" "*.rb" "*.js" "*.pl"
                      "*.sh" "*.erl" "*.hs" "*.ml" "*.haml"))

(setq ffip-limit 2000)

(global-set-key (kbd "M-C-S-p") 'find-file-in-project)

(global-set-key '[S-f7] 'compile)
(global-set-key '[F7] 'recompile)

(global-set-key (kbd "C-M-]") '(lambda () (interactive) (indent-region 0 (point-max))))

;; (global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-/") 'dabbrev-expand)

;;; Rails support
;;; =============
                                        ; Let's see if I'll need it

                                        ; (setq load-path (cons "~/.emacs.d/rails" load-path)) 
                                        ; (require 'rails)
;; Make rails-core recognize Rails 2.0 style views
;; (add-to-list 'rails-templates-list "html.erb" t)

                                        ; This was not a very nice thing to enable globally!!
;; (remove-hook 'write-file-hooks 'untabify-before-write)


(defun open-rails-project (root-dir)
  (interactive "D")
  (let ((root-dir (if (string-match "/$" root-dir) root-dir (concat root-dir "/")))
        (paths '("app/models/*.rb"
                 "app/controllers/*.rb"
                 "app/helpers/*.rb"
                 "app/mailers/*.rb"
                 "app/views/*"
                 "config/routes.rb"
                 "config/database.yml"
                 "db/schema.rb"
                 "config/locales/*.yml"
                 "spec/acceptance/*.rb" ; This may be a bit project-specific...
                 "Gemfile"
                 )))
    (dolist (p paths)
      (find-file (concat root-dir p) t))))


;;; Visual aids
;;; ===========
;; Adapted from http://www.emacswiki.org/emacs/hl-line%2b.el
(defun flash-current-line (&optional arg)
  (global-hl-line-mode 1)
  (run-at-time 0.2 nil #'(lambda () (global-hl-line-mode 0))))

(defadvice move-beginning-of-line (before flash-if-at-column-zero)
  (if (= (point) (point-at-bol))
      (flash-current-line)))

(ad-activate 'move-beginning-of-line)


                                        ; Enhance HAML mode to support creating tags without reaching for the
                                        ; percent sign. Very simple. 
;; (defun enhanced-space ()
;;   (interactive)
;;   (if (eq major-mode 'haml-mode)
;;       (save-excursion
;;         (backward-word)
;;         (insert "%")))
;;   (insert " "))
;; (global-set-key (quote [33554464]) (quote enhanced-space))



;;; Remove toolbar and scrollbars if running in a GUI
;;; =================================================
(if window-system
    (progn
      (tool-bar-mode 0)
      (scroll-bar-mode -1)))


;;; Load a few external files
;;; =========================
(load "light-symbol")
(load "utils.el")
(require 'ack)

;;; Key bindings
;;; ============
(add-hook 'dired-mode-hook
          '(lambda ()
             (local-unset-key "\C-\M-n")
             (local-unset-key "\C-\M-p")
             (local-unset-key "\C-o")
             (local-set-key "" 'dired-up-directory)
             (local-set-key "\C-j" 'dired-find-alternate-file)
             (local-set-key "o" 'dired-display-file)
             (local-set-key "W" 'wdired-change-to-wdired-mode)))

(add-hook 'rinari-minor-mode-hook
          '(lambda()
             (local-set-key (kbd "C-M-=") 'rinari-insert-erb-skeleton)
             (local-set-key (kbd "C-M-'") '(lambda () (interactive) (rinari-insert-erb-skeleton t)))))

(global-set-key "u" 'browse-url-at-point)
(global-set-key "g" (quote ack))
(global-set-key (kbd "M-s M-s") (lambda () (interactive) (save-some-buffers t)))
(global-set-key (kbd "M-s M-h") 'shell)
(global-set-key (kbd "M-o M-r") 'open-rails-project)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-M-j") 'previous-buffer)
(global-set-key (kbd "C-M-l") 'next-buffer)

;; Leaving the rest commented out until I know if I'll miss them
;; Just playing with macros here...this could also be written:
;; (global-set-key (quote [C-tab]) (lambda nil (interactive) (other-window 1)))

;; (defmacro def-window-switcher (reverse)
;;   `(lambda () (interactive) (other-window ,(if reverse -1 1))))

;; (global-set-key (quote [C-tab]) (def-window-switcher nil))
;; (global-set-key (quote [S-C-tab]) (def-window-switcher t))

                                        ; (global-set-key (quote [backtab]) (quote hippie-expand))
                                        ; (global-set-key "" (quote uncomment-region))

(global-set-key (quote [f11]) (quote open-dot-emacs-file))
                                        ; (global-set-key (quote [S-f11]) 'open-local-config-file)
                                        ; (global-set-key [?\M-#] 'query-replace-regexp)
(global-set-key [f6] 'next-error)
(global-set-key [S-f6] 'previous-error)
                                        ; (global-set-key [?\C-c ?g] 'goto-line)
(global-set-key [?\C-c ?v] 'revert-buffer)

                                        ; (global-set-key [S-backspace] '(lambda () (interactive) (delete-backward-char 1)))
                                        ; (global-set-key (quote [backtab]) (quote lisp-complete-symbol))

(global-set-key "f" (quote fill-region))
                                        ; (global-set-key "p" (quote fill-paragraph))

(global-set-key "\C-o" 'other-window)
(global-set-key (kbd "S-C-o") '(lambda () (interactive) (other-window -1)))
(global-set-key "\C-\M-o" 'other-frame)

(global-set-key "\C-t" 'ido-goto-symbol)
(global-set-key "A" 'apropos)
(global-set-key (kbd "M-k") 'bury-buffer)
(global-set-key (kbd "M-C-k") 'kill-current-buffer)
(global-set-key (kbd "M-C-S-k") 'delete-window)

                                        ; Use meta+shift+[j/k/l/i] to navigate between windows
(global-set-key (kbd "M-L") 'windmove-right)
(global-set-key (kbd "M-J") 'windmove-left)
(global-set-key (kbd "M-I") 'windmove-up)
(global-set-key (kbd "M-K") 'windmove-down)

(global-set-key (kbd "M-C-g") 'magit-status)
(global-set-key (kbd "M-r") '(lambda () (interactive) (revert-buffer nil t)))

(global-set-key (kbd "C-M-O") 'dired-open)
;;; Faster point movement
;;; =====================
(global-set-key "\M-\C-p"
                '(lambda () (interactive) (previous-line 5)))

(global-set-key "\M-\C-n"
                '(lambda () (interactive) (next-line 5)))


;;; Pager improvements
;;; ==================
(require 'pager)
(global-set-key "\C-v" 'pager-page-down)
(global-set-key "\M-v" 'pager-page-up)
(global-set-key "\M-N" 'pager-row-down)
(global-set-key "\M-P" 'pager-row-up)

;;; Aliases
;;; =======
(defalias 'tmopen (lambda () (interactive)
                    (eshell-command (concat "mate " buffer-file-name))))


(defalias 'pydebug (lambda () (interactive)
                     (insert "import pdb; pdb.set_trace() # __PYDEBUG__")
                     (save-buffer)))

(defalias 'rbdebug (lambda () (interactive)
                     (insert "require 'debugger'; debugger # __RBDEBUG__")
                     (save-buffer)))

(defun touch ()
  (interactive)
  (eshell-command (concat "touch " buffer-file-name)))

(global-set-key (kbd "M-C-t") 'touch)

(defun three-up ()
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-horizontally)
  (balance-windows)
  (windmove-right))

(global-set-key (kbd "M-C-0") 'delete-window)
(global-set-key (kbd "M-C-1") 'delete-other-windows)
(global-set-key (kbd "M-C-2") 'split-window-vertically)
(global-set-key (kbd "M-C-3") 'split-window-horizontally)

;;; Load and customize Ido
;;; ======================
(require 'ido)
(ido-mode 1)

                                        ; Use ido with imenu to quickly jump to methods in current buffer.
                                        ; See http://www.emacswiki.org/cgi-bin/wiki/ImenuMode
(require 'imenu)
(defun ido-goto-symbol ()
  "Will update the imenu index
   and then use ido to select a
   symbol to navigate to"
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
        (symbol-names '()))
    (flet ((addsymbols (symbol-list)
                       (when (listp symbol-list)
                         (dolist (symbol symbol-list)
                           (let ((name nil) (position nil))
                             (cond
                              ((and (listp symbol) (imenu--subalist-p symbol))
                               (addsymbols symbol))

                              ((listp symbol)
                               (setq name (car symbol))
                               (setq position (cdr symbol)))

                              ((stringp symbol)
                               (setq name symbol)
                               (setq position (get-text-property 1 'org-imenu-marker symbol))))

                             (unless (or (null position) (null name))
                               (add-to-list 'symbol-names name)
                               (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
           (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))

(setq
 ido-max-prospects 6
 ido-confirm-unique-completion t
 ido-max-directory-size 100000)
;;; Misc customizations
;;; ===================
(setq dabbrev-case-fold-search nil)
(setq debug-on-error nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)

                                        ; Disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

                                        ; Improve the way buffer names are made unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

                                        ; Enable syntax highlighting by default
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

                                        ; Disable autosave and backup
(setq auto-save-default nil)
(setq make-backup-files nil)

                                        ; Force to use spaces for tabs and to be 3 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 3)

                                        ; Remove menu bar
                                        ; (menu-bar-mode 0) ; not needed on mac, it's there anyway

                                        ; Enable transient mark mode
(transient-mark-mode 1)
(column-number-mode 1)
(display-time-mode t)
(blink-cursor-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)
(require 'paren) (show-paren-mode t)
(setq message-log-max 512)

(setq-default truncate-partial-width-windows t)
(setq query-replace-highlight t)
(setq search-highlight t)
(setq kill-whole-line t)

(autoload 'linum-mode "linum" "Show line numbers" t)

                                        ; Mac keys
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'meta)

;;; Color theme
;;; ===========
                                        ; (require 'color-theme)
                                        ; (require 'color-theme-solarized)
                                        ; (color-theme-initialize)
                                        ; (color-theme-dark-laptop)
                                        ; (color-theme-solarized-light)



;;; Git integration
;;; ===============
                                        ; (require 'egg)

;;; Load local customizations for this machine
;;; ==========================================
(let ((local-config-filename (concat "~/.emacs.d/local/" (system-name) ".el")))
  (if (file-exists-p local-config-filename)
      (load local-config-filename)))

;; (defun html2haml ()
;;   (interactive)
;;   (dired-do-shell-command "html2haml ? `echo ? | sed 's/erb/haml/'`")
;;   (dired-do-redisplay))

;;; Load YAS
;;; ========
(add-to-list 'load-path
             "~/.emacs.d/yasnippet")
(require 'yasnippet)
(setq yas/prompt-functions '( yas/ido-prompt
                              yas/completing-prompt))
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet/snippets")
(yas/load-directory "~/.emacs.d/yasnippets-rails/rails-snippets")
;; said shoulda snippets
(yas/load-directory "~/.emacs.d/yasnippets-shoulda")
; (yas/load-directory "~/.emacs.d/rspec-snippets")

;;; A few orgmode tweaks
;;; ====================
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)


                                        ; Auto revert files
(setf global-auto-revert-non-file-buffers t)
(global-auto-revert-mode t)


                                        ; Coffee mode
(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))


(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)


(setq send-mail-function 'mailclient-send-it)
(setq message-send-mail-function 'message-send-mail-with-mailclient)

(require 'org2blog)
(require 'netrc)

(setq blog (netrc-machine (netrc-parse "~/.netrc") "wordpress" t))
(setq fullofstars-blog (netrc-machine (netrc-parse "~/.netrc") "fullofstars" t))

(setq org2blog/wp-blog-alist
      '(("wordpress"
         :url "http://chopmode.wordpress.com/xmlrpc.php"
         :username (netrc-get blog "login")
         :password (netrc-get blog "password"))
        ("fullofstars"
         :url "http://fullofstars.chopmo.dk/xmlrpc.php"
         :username (netrc-get fullofstars-blog "login")
         :password (netrc-get fullofstars-blog "password"))))


(setq org2blog/wp-confirm-post t)
(setq org2blog/wp-use-sourcecode-shortcode nil)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

; perspective next/prev on M-C-S-n/p
;; (require 'perspective)
;; (persp-mode 1)
;; (global-set-key (kbd "C-;") 'persp-switch)


; GRB: cycle through selective-display levels
;; (setq selective-display-level 0)
;; (setq selective-display-increment 2)
;; (setq max-selective-display-level 8)

;; (defun jpt-print-selective-display-level ()
;;   (interactive)
;;   (message ( "Selective display level: " selective-display-level)))

;; (defun next-selective-display ()
;;   "Switch to the next selective display level"
;;   (interactive)
;;   (if (< selective-display-level max-selective-display-level)
;;       (setq selective-display-level
;;             (+ selective-display-increment
;;                selective-display-level))

;;     (set-selective-display selective-display-level)
;;     (jpt-print-selective-display-level)))

;; (global-set-key (quote [M-right]) 'next-selective-display)

;; (defun next-selective-display ()
;;   "Switch to the next selective display level"
;;   (if (>= selective-display-level max-selective-display-level)
;;       (setq selective-display-level 0)
;;     (setq selective-display-level
;;           (+ selective-display-increment
;;              selective-display-level)))
;;   (interactive)
;;   (set-selective-display selective-display-level))
;; (global-set-key "\M-c" 'switch-selective-display)

(global-set-key (kbd "C-M-l") '(lambda () (interactive)
                                 (indent-rigidly (region-beginning) (region-end) 2)))

(global-set-key (kbd "C-M-j") '(lambda () (interactive)
                                 (indent-rigidly (region-beginning) (region-end) -2)))

(defun jpt-setup-windows ()
  (interactive)
  (switch-to-buffer "*scratch*")
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-horizontally)
  (balance-windows)
                                        ; (shell)
  (other-window 2)
  (split-window)
  (other-window -1)
  (setq grb-temporary-window (nth 1 (window-list)))
  (setq jpt-magit-window (nth 2 (window-list))))

(setq special-display-regexps
      '("^\\*Completions\\*$"
        "^\\*Ido Completions\\*$"
        "^\\*magit"
        "^\\*ack\\*$"
        "^\\*Help\\*$"
        "^\\*grep\\*$"
        "^\\*Apropos\\*$"
        "^\\*elisp macroexpansion\\*$"
        "^\\*local variables\\*$"
        "^\\*Compile-Log\\*$"
        "^\\*Quail Completions\\*$"
        "^\\*Occur\\*$"
        "^\\*frequencies\\*$"
        "^\\*compilation\\*$"
        "^\\*Locate\\*$"
        "^\\*Colors\\*$"
        "^\\*tumme-display-image\\*$"
        "^\\*SLIME Description\\*$"
        "^\\*.* output\\*$"                  ; tex compilation buffer
        "^\\*TeX Help\\*$"
        "^\\*Shell Command Output\\*$"
        "^\\*Async Shell Command\\*$"
        "^\\*Backtrace\\*$"))


(defun jpt-try-window (window)
  (if (window-live-p window)
      window
    (first (window-list))))

(defun jpt-window-for-buffer (buffer)
  (if (string-match "\\*magit" (buffer-name buffer))
      (jpt-try-window jpt-magit-window)
    (jpt-try-window grb-temporary-window)))

(defun grb-special-display (buffer &optional data)
  (let ((window (jpt-window-for-buffer buffer)))
    (with-selected-window window
      (switch-to-buffer buffer)
      window)))

;; (setq special-display-function #'grb-special-display)

;; (jpt-setup-windows)                     


(defun jpt-tabs-to-spaces ()
  (interactive)
  (save-excursion
    (replace-regexp "\t" "   " nil 0 (point-max))
    (delete-trailing-whitespace)))

(setq org-mobile-directory "~/Dropbox/mobileorg")


;; Nasty hack: Remove confirmation dialog to kill associated buffer
;; when deleting files or dirs in dired.
;;
;; Original version is in dired-x.el
;; (defun dired-clean-up-after-deletion (fn)
;;   (save-excursion (and (cdr dired-subdir-alist)
;;                        (dired-goto-subdir fn)
;;                        (dired-kill-subdir)))

;;   (if dired-clean-up-buffers-too
;;       (progn
;;         (let ((buf (get-file-buffer fn)))
;;           (save-excursion
;;             (kill-buffer buf)))
;;         (let ((buf-list (dired-buffers-for-dir (expand-file-name fn)))
;;               (buf nil))
;;           (while buf-list
;;             (save-excursion (kill-buffer (car buf-list)))
;;             (setq buf-list (cdr buf-list)))))))


(add-to-list 'load-path "~/.emacs.d/lib/slime")  ; your SLIME directory
(setq inferior-lisp-program "lein repl") ; your Lisp system
(require 'slime)
(slime-setup)
;; WIP for a hack day

(provide 'list-pull-requests)



[

 (setq list-pull-requests-github-response
             (ghub-get "/search/issues"
                       '((q . "is:open is:pr archived:false repo:gomore/gomore-web repo:gomore/api-doc repo:gomore/api repo:gomore/migrations repo:gomore/Dockerfiles repo:gomore/cloudformation -draft:true"))
                       :unpaginate t
                       :headers '(("Accept" . "application/vnd.github.json"))
                       :auth 'list-pull-requests
                       :host "api.github.com"
                       :callback nil
                       :errorback nil))
]


(pp (mapcar (lambda (pr) (string-join (list "Title: " (alist-get 'title pr)
                                       "URL: " (alist-get 'html_url pr)
                                       )))
            (alist-get 'items github-response)))

(string-join (list  "a" "b"))

(with-current-buffer (get-buffer-create "*Pull requests*")
  (save-excursion
    (erase-buffer)
    (mapc (lambda (pr)
            (let ((username (alist-get 'login (alist-get 'user pr)))
                  (title (alist-get 'title pr))
                  (url (alist-get 'html_url pr)))
              (insert
               (format "[%15s] %20s: %s\n" username title url))))
          (alist-get 'items list-pull-requests-github-response))))

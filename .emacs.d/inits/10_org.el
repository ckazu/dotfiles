;;; org
(require 'org-install)
(global-set-key (kbd "C-c l") 'org-store-link)
(setq org-directory "~/Dropbox/memos/")
(setq org-default-notes-file
      (concat org-directory "note.org"))

;;; org-remember
(org-remember-insinuate)
(setq org-remember-templates
      '(("Todo" ?t "** TODO %?\n   %t\n   %i" nil "Inbox")
        ("Bug" ?b "** TODO %?\n   %t   :bug:\n   %i" nil "Inbox")
        ("Idea" ?i "** %?\n   %t\n   %i" nil "New Ideas")
        ("Memo" ?m "** %?\n   %t\n   %i" nil "Memo")
        ))

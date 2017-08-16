;;; migemo
;; (auto-install-from-url "https://raw.github.com/gist/457761/539882a79ec11bc9b6e1ac417cdafe0e198e245f/migemo.el")

(require 'migemo)
(setq migemo-command "/usr/local/bin/cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
;; (setq migemo-use-pattern-alist t)
(load-library "migemo")
 
(migemo-init)

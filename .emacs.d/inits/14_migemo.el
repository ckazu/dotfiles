(require 'migemo)
(setq migemo-command "migemo")
(setq migemo-options '("-t" "emacs"))
(setq migemo-dictionary "/usr/share/migemo/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-use-pattern-alist t)

(migemo-init)

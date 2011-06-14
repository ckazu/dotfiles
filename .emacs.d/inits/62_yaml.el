;;; YAML
;; (install-elisp "http://tweedle-dee.org/svn/emacs.d/site-lisp/yaml-mode.el")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

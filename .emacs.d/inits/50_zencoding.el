;;; zen-coding
;; (install-elisp "https://github.com/rooney/zencoding/raw/master/zencoding-mode.el")
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)

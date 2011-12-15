;;; init.el

;; load-path
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/auto-install")
(add-to-list 'load-path "~/.emacs.d/elpa")

;;; auto-install
;; $ cd ~/.emacs.d/auto-install
;; $ wget http://www.emacswiki.org/emacs/download/auto-install.el
;; $ emacs --batch -Q -f batch-byte-compile auto-install.el
(require 'auto-install)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; (setq init-loader-show-log-after-init nil)  ; 起動時にログを表示しない

;;; init-loader
;; (install-elisp "http://svn.coderepos.org/share/lang/elisp/init-loader/init-loader.el")
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

;;; ELPA
;; (install-elisp "http://tromey.com/elpa/package-install.el")
;; (when
;;     (load
;;      (expand-file-name "~/.emacs.d/elpa/package.el"))
;;   (package-initialize))

;;; package
;; (auto-install-from-url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el")
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

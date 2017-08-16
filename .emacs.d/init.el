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

;;; package
;; (auto-install-from-url "http://repo.or.cz/w/emacs.git/blob_plain/HEAD:/lisp/emacs-lisp/package.el")
;; (auto-install-from-url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el")
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;; ELPA
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; Avoid to write `package-selected-packages` in init.el
;; (load (setq custom-file (expand-file-name "custom.el" user-emacs-directory)))

;;(custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(package-selected-packages
;;   (quote
;;    (auto-highlight-symbol slim-mode yaml-mode rainbow-mode markdown-toc csharp-mode))))
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; )

(require 'multi-scratch)

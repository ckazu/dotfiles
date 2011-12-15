;;; SCSS-mode
;;; (auto-install-from-url "https://raw.github.com/antonj/scss-mode/master/scss-mode.el")
(autoload 'scss-mode "scss-mode")
(setq scss-compile-at-save nil)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

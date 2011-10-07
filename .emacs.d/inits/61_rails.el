;;; Rinari
;; git clone git://github.com/eschulte/rinari.git
;; cd rinari
;; git submodule init
;; git submodule update
(add-to-list 'load-path "~/.emacs.d/site-lisp/rails/rinari")
(require 'rinari)

;;; rails
;; (defun try-complete-abbrev (old)
;;   (if (expand-abbrev) t nil))
;; (setq hippie-expand-try-functions-list
;;       '(try-complete-abbrev
;;         try-complete-file-name
;;         try-expand-dabbrev
;;         ))
;; (setq rails-use-mongrel t)

;; (require 'cl)
;; (require 'rails)
;; (define-key rails-minor-mode-map "\C-c\C-p" 'rails-lib:run-primary-switch)
;; (define-key rails-minor-mode-map "\C-c\C-n" 'rails-lib:run-secondary-switch)

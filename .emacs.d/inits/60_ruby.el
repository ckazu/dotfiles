;;; ruby
;; sudo apt-get install ruby-mode
(add-to-list 'load-path "~/.emacs.d/site-lisp/ruby")

;;; inf-ruby
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda () (inf-ruby-keys)))

(setq ruby-insert-encoding-magic-comment nil)

;;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;;; rubydb
(autoload 'rubydb "rubydb3x"
  "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)

;;; ruby-block
;; (auto-install-from-emacswiki "ruby-block.el")
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)    ; nothing | minibuffer | overlay | t <- (minibuffer and overlay)

;; ;; ri-emacs
;; (setq ri-ruby-script "~/.emacs.d/ruby/ri-emacs.rb")
;; (autoload 'ri "~/.emacs.d/ruby/ri-ruby.el" nil t)
;; (add-hook 'ruby-mode-hook (lambda ()
;;                             (local-set-key "\M-r" 'ri)
;;                             (local-set-key "\M-c" 'ri-ruby-complete-symbol)
;;                                         ;(local-set-key "\M-g" 'ri-ruby-show-args)
;;                             ))

;; for ruby
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)
(add-hook
 'ruby-mode-hook
 '(lambda ()
    (if (not (null buffer-file-name)) (flymake-mode))
    (define-key ruby-mode-map "\C-cd" 'credmp/flymake-display-err-minibuf)))

;; ;; auto-complete-ruby
;; (when (require 'auto-complete nil t)
;;   (global-auto-complete-mode t)
;;   (setq ac-dwim nil)
;;   (set-face-background 'ac-selection-face "steelblue")
;; ;;  (set-face-background 'ac-menu-face "skyblue")
;;   (setq ac-auto-start t)
;;   (global-set-key "\M-/" 'ac-start)
;;   (setq ac-sources '(ac-source-abbrev ac-source-words-in-buffer))
;;   (add-hook 'ruby-mode-hook
;;             (lambda ()
;;               (require 'rcodetools)
;;               (require 'auto-complete-ruby)
;;               (make-local-variable 'ac-omni-completion-sources)
;;               (setq ac-omni-completion-sources '(("\\.\\=" . (ac-source-rcodetools)))))))

;;; rspec-mode
;;; (auto-install-from-url "https://raw.github.com/pezra/rspec-mode/master/rspec-mode.el")
;; (require 'rspec-mode)

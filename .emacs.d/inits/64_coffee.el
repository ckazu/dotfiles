;; coffee
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;; flymake
(add-hook 'coffee-mode-hook 'flymake-coffee-load)

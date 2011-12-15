;;; smartchr
;; (install-elisp "https://github.com/imakado/emacs-smartchr/raw/master/smartchr.el")
(require 'smartchr)
(defun my-smartchr-setting ()
  (local-set-key (kbd "=") (smartchr '("=" " = " "== " "=> ")))
  (local-set-key (kbd "+") (smartchr '("+" "+ " "++" "+= ")))
  (local-set-key (kbd "-") (smartchr '("-" "- " "--" "-= " "-> ")))
  (local-set-key (kbd ">") (smartchr '(">" "=> " "-> " ">> ")))
  (local-set-key (kbd "[") (smartchr '("[" "[]" "[:]")))
  )
(add-hook 'ruby-mode-hook 'my-smartchr-setting)
(add-hook 'rinari-mode-hook 'my-smartchr-setting)
(add-hook 'javascript-mode-hook 'my-smartchr-setting)
(add-hook 'coffee-mode-hook 'my-smartchr-setting)

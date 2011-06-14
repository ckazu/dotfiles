;;; text-adjust
;; (install-elisp "http://taiyaki.org/elisp/text-adjust/src/text-adjust.el")
;; (install-elisp "http://taiyaki.org/elisp/mell/src/mell.el")

(require 'text-adjust)
;; org-mode, text-mode, ansys-mode のとき自動的には保存する際に実行
(defun text-adjust-space-before-save-if-needed ()
  (when (memq major-mode
              '(org-mode text-mode yatex-mode))
    (text-adjust-space-buffer)))
(defalias 'spacer 'text-adjust-space-buffer)
(add-hook 'before-save-hook 'text-adjust-space-before-save-if-needed)

(global-set-key (kbd "C-c C-b s") 'text-adjust-space-buffer)

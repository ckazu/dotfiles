;;; anything
;; (auto-install-batch "anything")
(require 'anything-startup)

;;; moccur
;; (install-elisp-from-emacswiki "color-moccur.el")
;; (install-elisp "http://svn.coderepos.org/share/lang/elisp/anything-c-moccur/trunk/anything-c-moccur.el")
(require 'color-moccur)

;;; moccur-edit
;; (install-elisp "http://www.bookshelf.jp/elc/moccur-edit.el")
(require 'moccur-edit)

;;; anything-c-moccur
(require 'anything-c-moccur)
(setq moccur-split-word t)
(setq anything-c-moccur-anything-idle-delay 0.1)
(setq anything-c-moccur-higligt-info-line-flag t)
(setq anything-c-moccur-enable-auto-look-flag t)
(setq anything-c-moccur-enable-initial-pattern nil)

;;; split-root
;; (install-elisp "http://nschum.de/src/emacs/split-root/split-root.el")
(require 'split-root)
(defun anything-display-function--split-root (buf)
  (let ((parcent 40.0))
    (set-window-buffer (split-root-window (truncate (* (frame-height) (/ parcent 100.0)))) buf)))
(setq anything-display-function 'anything-display-function--split-root)

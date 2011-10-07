;; keybindings
(global-set-key (kbd "C-h")    'backward-delete-char) ; C-h を backspace に
(global-set-key (kbd "C-x g")  'goto-line)            ; 指定行番号へ移動
(global-set-key (kbd "C-j")    'newline)              ; 単純改行
(global-set-key (kbd "C-m")    'newline-and-indent)   ; 改行時に自動インデント
(global-set-key (kbd "M-<RET>") 'ns-toggle-fullscreen); fullscreen toggle

;; for tab
(setq-default tab-width 2)
(setq tab-stop-list
      '(2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
(setq-default indent-tabs-mode nil)     ; タブ文字は半角スペースに
(setq-default indicate-empty-lines t)   ; ファイルの最終行を以降を明示する
(setq indent-line-function 'indent-relative-maybe)

;; for major-mode
(define-key zencoding-mode-keymap (kbd "<C-return>") nil)
(define-key zencoding-mode-keymap (kbd "<S-return>") 'zencoding-expand-line)

;; anything
(define-key global-map (kbd "C-;")   'anything)
(define-key global-map (kbd "C-s")   'anything-c-moccur-occur-by-moccur) ;; search を c-moccur と置き換え
(define-key global-map (kbd "C-S-s") 'anything-c-moccur-dmoccur)
(anything-complete-shell-history-setup-key (kbd "C-o"))                  ;; shell の履歴を取得する
(global-set-key (kbd "M-y") 'anything-show-kill-ring)                    ;; kill ring history


;;; key-chord
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/key-chord.el")
(require 'key-chord)
(setq key-chord-two-keys-delay 0.04)
(key-chord-mode 1)

(key-chord-define-global "fj" 'dabbrev-expand)       ; 動的略語展開
(key-chord-define-global "dk" 'anything)
(key-chord-define-global "xo" 'other-window)
(key-chord-define-global "f`" 'whitespace-cleanup)
(key-chord-define-global "f\\" 'indent-region)

(key-chord-define-global ";r" 'org-remember)
(key-chord-define-global ";s" 'anything-c-moccur-occur-by-moccur)
(key-chord-define-global ";;" 'anything)
;; 補完
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        ))

;; misc
(defalias 'yes-or-no-p 'y-or-n-p)       ; yes を短縮形で良いように

;; initial settings
(setq inhibit-startup-message t)            ; スタートページ非表示
(setq ring-bell-function 'ignore)           ; ベルを鳴らさない
(setq column-number-mode t)                 ; ステータスに行番号＆列番号表示
(setq truncate-lines nil)                   ; 折り返し
(setq truncate-partial-width-windows nil)   ; 分割時にもきちんと折り返す

;; Window settings
(if window-system
    (progn
      (set-frame-parameter nil 'alpha 85)       ; 透明度
      (menu-bar-mode t)                         ; メニューバー表示
      (tool-bar-mode nil)                       ; ツールバー非表示
      (set-scroll-bar-mode 'right)              ; スクロールバー表示
      (setq line-spacing 0.2)                   ; 行間
      (setq ns-pop-up-frames nil)               ; 複数の emacs を開かない
      (set-frame-font "Ricty-18")
      ;; fullscreen
      ;; (auto-install-from-emacswiki "fullscreen.el")
      ;; (require 'fullscreen)                     ; 起動時にフルスクリーンにする
      ;; (fullscreen)
))
;; for time on status line
(progn
  (setq display-time-string-forms
        '((format "%s/%s/%s %s %s:%s %s" year month day dayname 24-hours minutes load))))
(display-time)

;;; linum
;; 行番号を表示
(global-linum-mode t)
(setq linum-format "%4d ")

;;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)
(setq cua-auto-tabify-rectangles nil)  ;; Don't tabify after rectangle commands
(transient-mark-mode 1)                ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t)    ;; Standard Windows behaviour

;; ;; revive.el
;; (autoload 'save-current-configuration "revive" "Save status" t)
;; (autoload 'resume "revive" "Resume Emacs" t)
;; (autoload 'wipe "revive" "Wipe emacs" t)

;; ;; 前回の状態を復元する
;; (resume)

;; coloring
;; (list-faces-display)
(set-foreground-color                                  "#efe") ; 文字色
(set-background-color                                  "#000c00") ; 背景色
(set-cursor-color                                      "#ccc") ; カーソル色
(set-face-foreground 'font-lock-constant-face          "#FFBF7F") ; 定数 (this, self なども)
(set-face-foreground 'font-lock-comment-delimiter-face "#999") ; コメントデリミタ
(set-face-foreground 'font-lock-comment-face           "#999") ; コメント
(set-face-foreground 'font-lock-keyword-face           "#FF7F7F") ; キーワード
(set-face-foreground 'font-lock-function-name-face     "#BF7FFF") ; 関数名
(set-face-foreground 'font-lock-type-face              "#FFFF7F") ; クラス
(set-face-foreground 'font-lock-string-face            "#7FFF7F") ; 文字列
(set-face-foreground 'font-lock-variable-name-face     "#7F7FFF") ; 変数
(set-face-foreground 'fringe                           "#666666") ; fringe (折り返し記号などが出る部分)
(set-face-foreground 'mode-line-inactive               "#333333") ; モードライン文字 (非アクティブ)
(set-face-foreground 'modeline                         "#CCCCCC") ; モードライン文字

(set-face-background 'fringe                           "#282828") ; fringe
(set-face-background 'modeline                         "#333") ; モードライン背景
(set-face-background 'mode-line-inactive               "#CCC") ; モードライン背景 (非アクティブ)
(set-face-background 'region                           "#66c") ; リージョン

;; linum （行番号）
(set-face-foreground 'linum "#000")
(set-face-background 'linum "#99c")
;; flymake （エラー表示）
(set-face-background 'flymake-errline "#900")
(set-face-underline  'flymake-errline "#f00")

;; coloring for spacing
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '( ("　"    0 my-face-b-1 append)    ; 全角スペース
      ("\t"    0 my-face-b-2 append)    ; タブ文字
      (" "     0 my-face-b-3 append)    ; 半角スペース
      ("[ ]+$" 0 my-face-u-1 append)    ; 文末の半角スペース
      ("=>"    0 my-face-b-4 append)
      )))
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-b-3 'my-face-b-3)
(defvar my-face-b-4 'my-face-b-4)
(defvar my-face-u-1 'my-face-u-1)
(defface my-face-b-1 '((t (:background "#666"))) nil)
(defface my-face-b-2 '((t (:background "#cc0"))) nil)
(defface my-face-b-3 '((t (:background "#111"))) nil)
(defface my-face-b-4 '((t (:foreground "#f66"))) nil)
(defface my-face-u-1 '((t (:foreground "#0cc" :underline t))) nil)
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
                              (if font-lock-mode nil
                                (font-lock-mode t))))

;; ;; color-theme
;; (add-to-list 'load-path "~/.emacs.d/color-theme")
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;; ;;     (color-theme-hober)))
;; ;;     (color-theme-arjen)))
;; ;;     (color-theme-robin-hood)))
;;      (color-theme-billw)))


;;;(init-loader-load "~/.emacs.d/inits")

;;;対応する括弧を強調


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(show-paren-mode t)

(set-face-background 'show-paren-match-face "#0000FF") ;背景色: 青
(set-face-underline 'show-paren-match-face "#FFFF00") ;下線色: イエロー
(set-face-foreground 'show-paren-match-face "#FF00FF") ;文字色: 白
(set-face-foreground 'font-lock-variable-name-face "brightcyan") ;変数名 


(custom-set-faces
 '(font-lock-builtin-face((t(:foreground "yellow"))))
 '(font-lock-comment-face((t(:foreground "brightblue"))))
 '(font-lock-function-name-face((t(:foreground "brightred"))))
 '(font-lock-string-face ((t(:foreground "magenta"))))
 )


;(set-face-foreground 'bold' "#FFFFFF")　;文字色 白
(set-face-foreground 'mode-line "black")
(set-face-background 'mode-line "gray")
(set-face-background 'mode-line-inactive "gray30")


(setq show-paren-delay 0) ; 表示までの秒数：0秒
(setq show-paren-style 'expression) ;カッコ内強調の有効化

;;; *.~とかのバックアップファイルを作らない

(setq make-backup-files nil)

;;; .#*とかのバックアップファイルを作らない

(setq auto-save-default nil)

;; 行番号を表示します

(global-linum-mode t)

;; 色をつける

(global-font-lock-mode t)
(add-hook 'font-lock-mode-hook
          '(lambda ()
             (set-face-foreground 'bold "#FFFFFF")
             ))

;;; バックアップファイルを作らない

(setq backup-inhibited t)

;;;補完時に大文字少文字を区別しない

(setq completion-ignore-case t)

;;;スクロールを1行ずつにする

(setq scroll-step 1)

;;;画面右端で折り返さない

(setq-default truncate-lines t)
(setq truncate-partial-width-window t)

;;;現在の関数名をモードラインに表示

(which-function-mode 1)

;;;タブをスペース4字

(setq-default tab-width 4 indent-tabs-mode nil)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(setq el-get-dir (locate-user-emacs-file "lisp"))

(el-get-bundle rjsx-mode)

(add-to-list 'auto-mode-alist '(".*\\.js\\'". rjsx-mode))
(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq js-indent-level 2)
            (setq js2-strict-missing-semi-warning nil)))

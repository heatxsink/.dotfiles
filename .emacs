(add-to-list 'load-path "~/.emacs_modules")

(require 'linum)
(global-linum-mode 1)
(setq linum-format "%6d ")
(setq linum-format (lambda (line) (propertize (format (let ((w (length (number-to-string (count-lines (point-min) (point-max)))))) (concat "%" (number-to-string w) "d ")) line) 'face 'linum)))

;; TODO LIST
;(add-to-list 'load-path "~/emacs/lisp/") ;my lisp dir
;(autoload 'todo-list-mode "todo-list-mode") ;load when needed
 
;a simple function that opens the file,
;and switches to todo-list-mode.
;(defun open-todo-list ()
;  (interactive)
;  (find-file "~/TODO")
;  (todo-list-mode))
 
;then bind to control-f12 so i can call it with one keystroke
;this works well for me because i also bind calendar to f12
;(global-set-key [C-f12] 'open-todo-list)

;; OSX Specific stuff Here
(tool-bar-mode 0)

;; Set position and size of default and new frames. 
(setq default-frame-alist '((top . 0) (left . 75) (width . 150) (height . 50)))   
(setq initial-frame-alist '((top . 0) (left . 75) (width . 150) (height . 50))) 

;; Face madness
(global-font-lock-mode t)

(setq font-lock-maximum-decoration t)
(transient-mark-mode t)
(line-number-mode t)
(column-number-mode t)

(setq inhibit-startup-message t) 
(setq-default indent-tabs-mode nil)
(global-hl-line-mode 1)
(setq standard-indent 4)
(mouse-wheel-mode t)
(setq make-backup-files nil)
(setq auto-fill-mode 1)
(set-face-background 'highlight "gray23")
(setq default-frame-alist
      '(
	(cursor-color . "Firebrick")
        (cursor-type . box)
        (foreground-color . "White")
        (background-color . "Black")
        (vertical-scroll-bars . right)))


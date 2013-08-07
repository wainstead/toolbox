;; (defun set-background-color (color-name)
;;   "Set the background color of the selected frame to COLOR-NAME.
;; When called interactively, prompt for the name of the color to use.
;; To get the frame's current background color, use `frame-parameters'."
;;   (interactive (list (read-color "Background color: ")))
;;   (shell-command (format "/bin/echo 'Modifying frame parameters' >> /Users/swain/.emacs.shellbuffers/colorchanges\n"))
;;     (modify-frame-parameters (selected-frame)
;; 			   (list (cons 'background-color color-name)))
;;   (shell-command (format "/bin/echo 'Setting face...' >> /Users/swain/.emacs.shellbuffers/colorchanges\n"))
;;   (or window-system
;;       (face-set-after-frame-default (selected-frame)))
;;   (shell-command (format "/bin/echo 'done.' >> /Users/swain/.emacs.shellbuffers/colorchanges\n"))
;; )


;; seed our random number generator: current datetime plus Emacs's
;; process ID
(random t)

(defun sw-make-random-hex-color-string ()
  "Return a string in the form of #FFFFFF. Choose the number for
   #xffffff randomly using Emacs Lisp's builtin function (random)."
  ;; this probably isn't the problem because: it never trips up on
  ;; set-foreground-color and it would, wouldn't it?
  (format "#%06x" (random #xffffff))
  )


(setq flag t)
(setq counter 0)
(while flag
    (sleep-for 0.25)
    (setq bg-color (sw-make-random-hex-color-string))
    (set-background-color bg-color)
    (message (format "%s: loops" counter))
    (setq counter (+ counter 1))
    ;;(if (> counter 10) (setq flag nil))
)

;;; timed-edit-mode.el -- Timed edit mode
;;; Commentary:
;;; Defines timed edit mode which allows capturing time information with each newline.

;;; Code:

;;; TODO: Make time format a parameter
;;; TODO: Make a shortcut for temporarily enabling/disabling it (or maybe just let the user enable-disable the minor mode by their own keybinding



(defun timed-edit-mode-newline ()
  "Insert a newline, but before the newline add the timing information."
  (interactive)
  (newline-and-indent)
  (comment-dwim nil)
  (insert (current-time-string))
  (move-end-of-line nil)
  (newline-and-indent)
  (set-transient-map
   (let ((map (make-sparse-keymap)))
     (define-key map (kbd "RET") 'timed-edit-mode--newline-again)
     map)
   t))

(defun timed-edit-mode--newline-again()
  "Move the timed line with each repetitive newline."
  (interactive)
  (save-excursion
    (forward-line -1)
    (newline-and-indent)))
                               

(define-minor-mode timed-edit-mode
  "timed-edit-mode allows inserting a timestamp before inserting a newline."
  :lighter " Td"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "RET") 'timed-edit-mode-newline)
            map))



(provide 'timed-edit-mode)
;;; timed-edit-mode.el ends here

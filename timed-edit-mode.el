;;; timed-edit-mode.el -- Timed edit mode
;;; Commentary:
;;; Defines timed edit mode which allows capturing time information with each newline.

;;; Code:

(defun timed-edit-mode-newline ()
  "Insert a newline, but before the newline add the timing information."
  (interactive)
  (newline)
  (insert (current-time-string))
  (comment-line 1))

(define-minor-mode timed-edit-mode
  "timed-edit-mode allows inserting a timestamp before inserting a newline."
  :lighter " Timed"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map "\n" 'timed-edit-mode-newline)
            map))





(provide 'timed-edit-mode)
;;; timed-edit-mode.el ends here

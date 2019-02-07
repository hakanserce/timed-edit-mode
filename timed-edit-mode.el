;;; timed-edit-mode.el -- Timed edit mode
;;; Commentary:
;;; Defines timed edit mode which allows capturing time information with each newline.

;;; Code:

(defun timed-edit-mode-newline ()
  "Insert a newline, but before the newline add the timing information."
  (interactive)
  (newline)
  (insert (current-time-string))
  (timed-edit-mode--comment-current-line)
  (newline))

(defun timed-edit-mode--comment-current-line ()
  "Comment current line."
  (save-excursion (comment-line 1))
  (move-end-of-line 1))

(define-minor-mode timed-edit-mode
  "timed-edit-mode allows inserting a timestamp before inserting a newline."
  :lighter " Td"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "RET") 'timed-edit-mode-newline)
            map))





(provide 'timed-edit-mode)
;;; timed-edit-mode.el ends here

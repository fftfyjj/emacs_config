;;============================================================
;;comment by do what I mean,智能注释函数
;;============================================================
(defun fftf-comment-dwim (&optional arg)
"Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line,then comment current line.Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))

(provide 'fftf-comment)

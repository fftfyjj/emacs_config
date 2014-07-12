;;************************************************************
;; 设置智能的Alt W功能，能够智能的复制一行
;; Smart copy, if no region active, it simply copy the current whole line

(defun fftf-copy-dwim()
  "智能的复制功能"
  (interactive)
  (defadvice kill-line (before check-position activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode
                                c-mode c++-mode objc-mode js-mode
                                latex-mode plain-tex-mode))
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
                 (just-one-space 0)
                 (backward-char 1)))))   

  (defadvice kill-ring-save (before slick-copy activate compile)
    "When called interactively with no active region, copy a single line instead."
    (interactive (if mark-active (list (region-beginning) (region-end))
		   (message "Copied line")
		   (list (line-beginning-position)
			 (line-beginning-position 2)))))

  (defadvice kill-region (before slick-cut activate compile)
    "When called interactively with no active region, kill a single line instead."
    (interactive
     (if mark-active (list (region-beginning) (region-end))
       (list (line-beginning-position)
	     (line-beginning-position 2))))))

(provide 'fftf-copy)

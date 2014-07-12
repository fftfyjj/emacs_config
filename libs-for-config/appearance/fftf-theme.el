
;;************************************************************
;;利用主题的名字自动设置相应的主题
(defun fftf-theme-set (theme)
  (require 'color-theme)
  (load theme)
  (eval-after-load "color-theme"
    '(progn
       (color-theme-initialize)
       (funcall (nth-value 0 (read-from-string theme))))))

(provide 'fftf-theme)

(defun fftf-minibuffer-smex()
  "开启smex功能，增强M-x"
  (interactive)
;;; Smex
  (autoload 'smex "smex"
    "Smex is a M-x enhancement for Emacs, it provides a convenient interface to
your recently and most frequently used commands.")
  (defadvice smex (around space-inserts-hyphen activate compile)
    (let ((ido-cannot-complete-command 
	   `(lambda ()
	      (interactive)
	      (if (string= " " (this-command-keys))
		  (insert ?-)
		(funcall ,ido-cannot-complete-command)))))
      ad-do-it)))

(defun fftf-minibuffer-ido()
  "开启ido,并利用ido-complete-space-or-hypen插件增强ido"
  (require 'ido-complete-space-or-hyphen)
  (ido-mode t))

(provide 'fftf-minibuffer)

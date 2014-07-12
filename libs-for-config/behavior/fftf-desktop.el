

;; 空闲时自动保存desktop环境
;; (defun my-desktop-save ()
;;     (interactive)
;;     ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
;;     (if (eq (desktop-owner) (emacs-pid))
;;         (progn (desktop-save desktop-dirname)
;; 	       (message "saving the desktop..."))))
;; (add-hook 'auto-save-hook 'my-desktop-save)
(defun fftf-desktop-init()
  (setq desktop-path "~/.emacs.d/")
  (setq desktop-dirname "~/.emacs.d/")
  (setq desktop-base-file-name "emacs-desktop")
  (desktop-save-mode 1)  
  )

(defun fftf-desktop-autosave()
  "自动保存桌面环境  "
  (interactive)
  (fftf-desktop-init)
  (add-hook 'auto-save-hook 
	    (lambda() 
	      "保存桌面环境到相应文件"
	      ;; (if (eq (desktop-owner) (emacs-pid))
	      (progn (desktop-save desktop-dirname)))))
	

(provide 'fftf-desktop)





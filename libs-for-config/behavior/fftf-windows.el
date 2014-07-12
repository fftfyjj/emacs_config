;;方式1： 利用iljk键实现窗口的切换
;; 已经修改了win-switch.el的源码，实现了dvorak键盘布局时的快捷键
;; (win-switch-setup-keys-ijkl "\C-xo" "\C-x\C-o")
;; 这一段代码是专门为dvorak设置的
;;;###autoload
(defun win-switch-setup-keys-dvorak ()
  "Restore default key commands and bind global dispatch keys.
Under this setup, keys i, j, k, and l will switch windows,
respectively, up, left, down, and right, with other functionality
bound to nearby keys. The arguments DISPATCH-KEYS, if non-nil,
should be a list of keys that will be bound globally to
`win-switch-dispatch'."
  (interactive)
  (win-switch-set-keys '("c") 'up)
  (win-switch-set-keys '("t") 'down)
  (win-switch-set-keys '("h") 'left)
  (win-switch-set-keys '("n") 'right)
  (win-switch-set-keys '("r") 'next-window)
  (win-switch-set-keys '("g") 'previous-window)
  (win-switch-set-keys '("C") 'enlarge-vertically)
  (win-switch-set-keys '("T") 'shrink-vertically)
  (win-switch-set-keys '("H") 'shrink-horizontally)
  (win-switch-set-keys '("N") 'enlarge-horizontally)
  (win-switch-set-keys '(" ") 'other-frame)
  (win-switch-set-keys '("w" [return]) 'exit)
  (win-switch-set-keys '("d") 'split-horizontally)
  (win-switch-set-keys '("s") 'split-vertically) ; visual not letter mnemonic
  (win-switch-set-keys '("0") 'delete-window)
  (win-switch-set-keys '("\M-\C-g") 'emergency-exit))

(defun fftf-windows-win-switch(kblayout)
  "开启win-switch模式"
  (interactive "s请输入键盘布局")
  (cond ((equal kblayout "dvorak") (win-switch-setup-keys-dvorak))
	((equal kblayout "default") (win-switch-setup-keys))))



;; 方式2：利用数字标记窗口实现快速的窗口切换
(defun fftf-windows-window-numbering()
  "开启窗口数字标记功能"
  (defvar window-numbering-keymap
    (let ((map (make-sparse-keymap)))
      ;; \M-0用来最大化当前窗口
      ;; (define-key map "\M-0" 'select-window-0)
      (define-key map "\M-0" 'delete-window)
      (define-key map "\M-1" 'select-window-1)
      (define-key map "\M-2" 'select-window-2)
      (define-key map "\M-3" 'select-window-3)
      (define-key map "\M-4" 'select-window-4)
      (define-key map "\M-5" 'select-window-5)
      (define-key map "\M-6" 'select-window-6)
      (define-key map "\M-7" 'select-window-7)
      (define-key map "\M-8" 'select-window-8)
      ;; (define-key map "\M-9" 'select-window-9)
      (define-key map "\M-9" 'delete-other-windows)
      map))
  (require 'window-numbering)
  (window-numbering-mode 1))

;; 方式3：鼠标移动窗口上面即可以实现窗口的切换
;; (require 'follow-mouse)
;; (turn-on-follow-mouse)

(provide 'fftf-windows)

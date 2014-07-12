;; 设置字体
(require 'fftf-font)
(fftf-font-change-in-X
 "Consolas;DejaVu Sans Mono;Monospace;song it" ":pixelsize=14"
 "Microsoft Yahei;文泉驿等宽微米黑;黑体;AR PL UMing CN;Monospace" 16)

;;　设置主题
(require 'fftf-theme)
(fftf-theme-set "color-theme-blackboard")

;;　设置注释方式
(require 'fftf-comment)
;;在shortcuts中会重新绑定(fftf-comment-dwim &arg)到M-;

;; 设置桌面环境自动保存
(require 'fftf-desktop)
(fftf-desktop-autosave)

;; 设置智能复制
(require 'fftf-copy)
(fftf-copy-dwim)

;; 窗口切换
(require 'fftf-windows)
(fftf-windows-win-switch "dvorak")
(fftf-windows-window-numbering)

;; undo-tree
(require 'fftf-undo-redo)
(fftf-undo-redo-undo-tree)

;; 增强minibuffer的功能
(require 'fftf-minibuffer)
(fftf-minibuffer-smex)
(fftf-minibuffer-ido)

;; 全局配置auto-complete
(require 'fftf-auto-complete)
(fftf-auto-complete-global-config)
(fftf-auto-complete-cc-mode-async)

(provide 'global-config)

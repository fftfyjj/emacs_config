;;============================================================
;;字体设置函数，注意，**在终端中的字体不归Emacs负责**
;;============================================================
;;(qiang-set-font
;; '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New") ":pixelsize=18"
;; '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))
;;例如上面函数就能优先选用 Consolas + “雅黑”的组合。如果“雅黑”没有装的话，就使用“文泉驿等宽微米黑”，依此类推。这份字体配置不用改动就能在不同的操作系统字体环境下面使用。
;;来源： http://emacser.com/torture-emacs.htm

;;判断某个字体在系统中是否安装
(defun fftf-font-existsp (font)
  "测试字体是否安装"
  (if (null (x-list-fonts font))
      nil t))

;;辅助函数，用来产生带上 font size 信息的 font 描述文本
(defun fftf-font-make-font-specification (font-name font-size)
  "将字体简写名和字体大小转化为完整的字体描述字符串"
  (if (and (stringp font-size) 
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

;;自动设置字体函数的主体
(defun fftf-font-change-in-X (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-font-size)
  "以英文字体的列表、中文字体的列表中的字体顺序为优先级别，分别设置相应的中英文字体。参数是以,或;分割的字体名字构成的字符串。
english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (interactive "s输入以;分割的英文字体候选列表:\ns输入英文字体大小:\ns输入以;分割的中文字体候选列表:\nn输入中文字体大小(可选):")
  (require 'cl)                         ; for find if
  (let ((en-font (fftf-font-make-font-specification
                  (find-if #'fftf-font-existsp (split-string english-fonts "[,;]" t))
                  english-font-size))
        (zh-font (font-spec :family (find-if #'fftf-font-existsp (split-string chinese-fonts "[,;]" t))
                            :size chinese-font-size)))
    ;; Set the default English font
    ;; 
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute
     'default nil :font en-font)
    ;; Set Chinese font 
    ;; Do not use 'unicode charset, it will cause the english font setting invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        zh-font))))

;;加入Graphical display判断后的函数
(defun fftf-font-change (english-fonts english-font-size chinese-fonts &optional chinese-font-size)
  (if (display-graphic-p)
      (progn
	;if graphic
	;;(if (not (listp english-fonts))	
	;;    (set english-fonts (split-string english-fonts "[,;]" t)))
	(fftf-font-change-in-X english-fonts english-font-size chinese-fonts chinese-font-size))
	;else
	()))

(provide 'fftf-font)

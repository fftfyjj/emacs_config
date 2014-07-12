(defun fftf-auto-complete-global-config()
  "定义auto-complete的外观，等和mode无关的配置"
  (interactive)
  ;; (require 'auto-complete)
  (setq-default ac-sources nil)		;ac-sources全部在相应的编辑模式中自定义
  (setq ac-delay 0.1)			;设置开始completion的延迟时间，默认0.1
  (setq ac-auto-show-menu 0.6)		;Show completion menu automatically if t specified. t means always automatically showing completion menu. nil means never showing completion menu. Real number means delay time in seconds.默认0.8
  (setq ac-use-fuzzy t)			;开启use fuzzy matching.
  (setq ac-fuzzy-cursor-color "red")	;Change cursor color to specified color when fuzzy matching is started. nil means never changed. Available colors can be seen with M-x list-colors-display.默认red
  ;; (setq ac-use-comphist t) 		;Whether or not to use candidate suggestion. nil means never using it and get performance better maybe.
  (setq ac-use-quick-help t)
  (setq ac-quick-help-delay 0.1)	;Delay time to show quick help in real number seconds.默认1.5
  ;; (setq ac-menu-height 8)		;Specify an integer of lines of completion menu.默认10
  ;; (setq ac-quick-help-height 18)	;Specify an integer of lines of quick help. 默认20
  ;; (setq-default ac-modes nil) 			;默认值(emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode ts-mode sclang-mode verilog-mode qml-mode)
  (setq ac-auto-start t)		;Specify how completion will be started. t means always starting completion automatically. nil means never started automatically. An integer means completion will not be started until the value is more than a length of the completion target string. 1表示输入1个字母后开始complete
  ;; (setq ac-ignore-case 'smart)		;Specify how distinguish case. t means always ignoring case. nil means never ignoring case. smart in symbol means ignoring case only when the completion target string doesn't include upper characters.
  ;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
  (global-auto-complete-mode t)
  )


(defun fftf-auto-complete-java-mode-config()
  "配置java-mode中的auto-complete的相应设置"
  (interactive)
  )


(defun fftf-auto-complete-cc-mode()
  "利用auto-complete-clang插件配置c-mode中的auto-complete的相应设置"
  (interactive)
  (require 'auto-complete-clang)
  (setq command "echo | g++ -v -x c++ -E - 2>&1 |
                 grep -A 20 starts | grep include | grep -v search")
  (setq ac-clang-flags
        (mapcar (lambda (item)
                  (concat "-I" item))
                (split-string
                 (shell-command-to-string command))))
  ;; completion for C/C++ macros.
  (dolist (mode-hook '(c-mode-hook c++-mode-hook))
    (add-hook mode-hook
              (lambda ()
                (setq ac-sources (append '(ac-source-clang ac-source-dictionary) 'ac-sources)))))
  )
  
;; (defun fftf-auto-complete-cc-mode-with-clang()
;;   "配置c-mode中的auto-complete的相应设置"
;;   (interactive)
;;   ;; (setq ac-modes (append ac-modes '(c-mode cc-mode)))
;;   (require 'auto-complete-clang)
;;   (setq ac-clang-flags
;;       (mapcar (lambda (item)(concat "-I" item))
;;               (split-string
;; 	       "
;;  /usr/include/c++/4.8
;;  /usr/include/x86_64-linux-gnu/c++/4.8
;;  /usr/include/c++/4.8/backward
;;  /usr/lib/gcc/x86_64-linux-gnu/4.8/include
;;  /usr/local/include
;;  /usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed
;;  /usr/include/x86_64-linux-gnu
;;  /usr/include")))
;;   (setq ac-sources '(
;; 		     ac-source-clang
;; 		     ac-source-dictionary
;; 		     ))
;;   ;; (setq auto-complete-mode t)		
;;   )

(defun fftf-auto-complete-cc-mode-async()
  "利用auto-complete-clang-async配置c-mode中的auto-complete的相应设置"
  (interactive)
  (require 'auto-complete-clang-async)
  (dolist (mode-hook '(c-mode-hook c++-mode-hook))
    (add-hook mode-hook
              (lambda ()
		(setq ac-clang-complete-executable "~/.emacs.d/emacs-clang-complete-async/clang-complete")
                (setq ac-sources (append '(ac-source-clang-async ac-source-dictionary) 'ac-sources))
		(ac-clang-launch-completion-process)))))
		     
(provide 'fftf-auto-complete)

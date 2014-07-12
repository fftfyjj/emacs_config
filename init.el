(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(add-to-list 'load-path "~/.emacs.d/configs")
(add-to-list 'load-path "~/.emacs.d/libs-for-config/appearance")
(add-to-list 'load-path "~/.emacs.d/libs-for-config/behavior")
(add-to-list 'load-path "~/.emacs.d/libs-for-config/programming")
(add-to-list 'load-path "~/.emacs.d/themes")

(add-hook 'after-init-hook (lambda()
			     (require 'global-config)
			     (require 'shortcuts-config)))



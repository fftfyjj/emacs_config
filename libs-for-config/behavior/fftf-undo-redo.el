;; 利用undo-tree.el实现更直观的undo/redo模式。Emacs自带的redo虽然强，但是违背人的思维方式

(defun fftf-undo-redo-undo-tree(&optional arg)
  "利用undo-tree.el实现更直观的undo/redo模式。Emacs自带的redo虽然强，但是违背人的思维方式"
  (interactive)
  (global-undo-tree-mode 1))

(provide 'fftf-undo-redo)

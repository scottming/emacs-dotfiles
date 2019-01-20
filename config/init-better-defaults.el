;; 增强内置功能

(setq make-backup-files nil)
(setq auto-save-default nil)
(global-linum-mode t)
(global-auto-revert-mode t)

;; enable recentf-mode
(require 'recentf)
(recentf-mode 1)			
(setq recentf-max-menu-items 25)
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))
(show-paren-mode 1) ;; highlight another brackets

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

(provide 'init-better-defaults)

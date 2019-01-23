;; 视觉层配置

(blink-cursor-mode -1)

(scroll-bar-mode  -1)

;; remap newline
(electric-indent-mode -1)
(defun rebind-return-key ()
    (define-key global-map [remap newline] 'newline-and-indent))
(add-hook 'prog-mode-hook 'rebind-return-key)

;; close the start window
(setq inhibit-splash-screen t)

;; disable tool bar
(tool-bar-mode -1)

;; high line
(global-hl-line-mode t)

(provide 'init-ui)

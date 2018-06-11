;; 视觉层配置

(blink-cursor-mode -1)

(scroll-bar-mode  -1)
(electric-indent-mode -1)

;; close the start window
(setq inhibit-splash-screen t)

;; disable tool bar
(tool-bar-mode -1)

;; high line
(global-hl-line-mode t)

(provide 'init-ui)
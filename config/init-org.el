;; Org 模式相关的全部设定

;; load theme
(require 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)

;; Org Agenda
(require 'org)
(setq org-agenda-files '("~/Documents/todos"))
(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-src-fontify-natively t)

(provide 'init-org)


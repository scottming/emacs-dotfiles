;; 快捷键绑定

(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; config for counsel
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f10>") 'nodejs-repl-send-buffer)
(global-set-key (kbd "C-c p f") 'counsel-git)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(setq mac-option-modifier 'meta)

(evil-leader/set-key 
  "ff" 'find-file
  "fr" 'recentf-open-files
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "pf" 'counsel-git
  "ps" 'helm-do-ag-project-root
  "qq" 'save-buffers-kill-terminal
  "ww" 'save-buffer
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wM" 'delete-other-windows)


(evilnc-default-hotkeys)
(define-key evil-insert-state-map (kbd "C-n") 'next-line)
(define-key evil-insert-state-map (kbd "C-p") 'previous-line)
(define-key evil-normal-state-map (kbd "U") 'undo-tree-redo)
;; (define-key evil-normal-state-map (kbd ",nn") 'neotree-toggle)
(define-key evil-normal-state-map (kbd ",cc") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",cc") 'evilnc-comment-or-uncomment-lines)
(define-key evil-normal-state-map (kbd ",cu") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",cu") 'evilnc-comment-or-uncomment-lines)

(define-key evil-insert-state-map (kbd "M-w") 'copy-to-register) 
(define-key evil-insert-state-map (kbd "C-r") 'evil-paste-from-register)
(define-key evil-insert-state-map (kbd "C-y") 'yank)

(add-hook 'neotree-mode-hook
         (lambda ()
           (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
           (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
           (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
           (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(provide 'init-keybindings)

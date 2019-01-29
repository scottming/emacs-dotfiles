;;; init-evil.el -- Evil support
;;; Commentary:
;;; code:

(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  ;; Let's not bother with Evil in *every* mode...
  (dolist (mode '(ag-mode
                  flycheck-error-list-mode
                  git-rebase-mode))
    (add-to-list 'evil-emacs-state-modes mode))

  ;; Start in insert mode for small buffers
  (dolist (mode '(text-mode))
    (add-to-list 'evil-insert-state-modes mode))

  (evil-add-hjkl-bindings eww-mode-map 'emacs
    (kbd "/")       'evil-search-forward
    (kbd "n")       'evil-search-next
    (kbd "N")       'evil-search-previous)

  :bind (:map evil-normal-state-map
              ;; Don't need 'q' to start recording a macro...
              ;; I'm more familiar with Emacs' way of doing things.
              ("q" . nil)
              ;; How about avy to 't'?
              ("t" . avy-goto-char-timer)
              ;; Shame that meta keys don't work, so let's
              ;; use the 'z' prefix:
              ("z." . find-tag)
              ("z," . ha/xref-pop-marker-stack)
              ("\\" . 'evil-repeat-find-char-reverse)
              ("C-u" . 'evil-scroll-up)
              ("C-e" . 'move-end-of-line)
              ("gd" .  dumb-jump-go)
              ("C-o" . dumb-jump-back))

  ;; While I'm still getting used to Evil, I'll eschew certain
  ;; advanced features, and fall-back on my Emacs.  Setting to `nil'
  ;; falls back to Emacs defaults.
  :bind (:map evil-insert-state-map
              ("C-a" . nil)
              ("C-e" . nil)
              ("C-d" . nil)
              ("C-k" . nil)
              ("C-t" . nil)
              ("M-." . nil)
              ("M-," . nil)
              ("C-y" . 'yank)
              ("C-u" . 'evil-scroll-up)))


(use-package evil-leader
  :ensure t
  :config
  (evil-leader/set-leader ",")
  (global-evil-leader-mode)
  (evil-leader/set-key
    "ff" 'find-file
    "fr" 'recentf-open-files
    "bb" 'switch-to-buffer
    "bk" 'kill-buffer
    "bp" 'previous-buffer
    "bn" 'next-buffer
    "pf" 'counsel-git
    "ps" 'helm-do-ag-project-root
    "qq" 'evil-quit
    "ww" 'save-buffer
    "w/" 'split-window-right
    "w-" 'split-window-below
    "wM" 'delete-other-windows))


(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(provide 'init-evil)
;;; init-evil.el ends here

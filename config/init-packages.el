(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; Define a private package list
(defvar scott/packages '(
                         company 
                         swiper
                         counsel
                         rainbow-delimiters
                         ;; aggressive-indent
                         window-numbering
                         powerline
                         which-key
                         org-bullets

                         evil-nerd-commenter
                         cider
                         yasnippet)
  "Default packages")

(setq package-selected-packages scott/packages)

;; Check the packages is installed or not
(defun my/packages-installed-p ()
  (loop for pkg in scott/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))
(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg scott/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs.d/elpa/")
  (require 'use-package))

(use-package diminish
  :ensure t)

;; move the cursor to the open window
(use-package popwin
  :ensure t
  :config
  (popwin-mode 1))

(use-package neotree
  :ensure t
  :bind (("<f8>" . neotree-toggle)))

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(use-package highlight-parentheses
  :ensure t
  :init
  (add-hook 'clojure-mode-hook 'highlight-parentheses-mode)
  (add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode))
;; :config
;; (setq hl-paren-background-colors '("orangered4")))

(use-package iy-go-to-char
  :ensure t
  :bind
  ("C-`" . iy-go-to-char)
  ("<f13>" . iy-go-to-char)
  ("C-~" . iy-go-to-char-backward))

(use-package avy
  :ensure t
  :init (setq avy-background t))

(use-package expand-region
  :ensure t
  :bind ("C-@" . er/expand-region))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(use-package company
  :ensure t
  :config
  (global-company-mode t))

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :ensure)

(provide 'init-packages)

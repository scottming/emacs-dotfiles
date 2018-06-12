;; 插件管理
(require 'cl)

(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; Define a private package list
(defvar scott/packages '(
			 company
			 popwin
			 neotree
			 cider
			 monokai-theme
			 zenburn-theme
			 hungry-delete
			 swiper
			 counsel
			 smartparens
			 js2-mode
			 nodejs-repl
			 org-bullets
			 evil-leader
			 evil-surround
			 evil-nerd-commenter
			 window-numbering
			 powerline
			 which-key
			 ) "Default packages")

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


(require 'popwin)
(popwin-mode 1)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; config for company
(global-company-mode t)

;; config js2-mode for js file
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(load-theme 'zenburn 1)

(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'nodejs-repl)

(require 'smartparens-config)
(add-hook 'js-node-hook #'smartparens-mode)

;; config for counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
;; (setq enable-recursive-minibuffers t)

(provide 'init-packages)

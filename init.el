(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(require 'cl)

;; Define a private package list
(defvar scott/packages '(
			 company
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

;; load neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Org Agenda
(require 'org)
(setq org-agenda-files '("~/Documents/todos"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; config for company
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; config js2-mode for js file
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(setq make-backup-files nil)

;; load nodejs-repl
(require 'nodejs-repl)

;; load theme
(require 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)
(load-theme 'zenburn 1)
(require 'hungry-delete)
(global-hungry-delete-mode)
(require 'smartparens-config)
(add-hook 'js-node-hook #'smartparens-mode)

;; config for counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
;; (setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f10>") 'nodejs-repl-send-buffer)

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))


(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-company-mode t)

;; disable cursor mode
(blink-cursor-mode -1)

;; set option key as meta key
(setq mac-option-modifier 'super)

;; disable tool bar
(tool-bar-mode -1)

;; show number line

;; close the start window
(setq inhibit-splash-screen t)

;; buffer list

;; others
(scroll-bar-mode  -1)
(electric-indent-mode -1)

;; enable highlight
(require 'org)
(setq org-src-fontify-natively t)
(global-hl-line-mode t)

;; enable recentf-mode
(require 'recentf)
(recentf-mode 1)			
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; enable linum
(global-linum-mode t)

;; others
(delete-selection-mode t)
(global-set-key [(control ?h)] 'delete-backward-char)

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
			 swiper
			 counsel
			 ;; smartparens
			 neotree 
			 rainbow-delimiters
			 aggressive-indent
			 hungry-delete
			 window-numbering
			 powerline
			 which-key
			 use-package
			 org-bullets

			 monokai-theme
			 zenburn-theme

			 evil-leader
			 evil-surround
			 evil-nerd-commenter
			 ;; evil-paredit
			 ;; evil-smartparens

			 cider
			 clojure-mode
			 yasnippet

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

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs.d/elpa/")
  (require 'use-package))

;; move the cursor to the open window
(use-package popwin
  :config
  (popwin-mode 1))

(use-package neotree
  :bind (("<f8>" . neotree-toggle)))

(use-package hungry-delete
  :config
  (global-hungry-delete-mode))


(use-package clojure-mode
  :ensure t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.boot\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode)
         ("\\.cljs\\'" . clojurescript-mode)
         ("\\.cljs\\.hl\\'" . clojurescript-mode))
  :init
  ;; (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  ;; (add-hook 'clojure-mode-hook #'smartparens-mode)       
  ;; (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  ;; (add-hook 'clojure-mode-hook #'evil-smartparens-mode)
)

;; (use-package evil-smartparens
;;   :init
;;   (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
;;   :config
;;   (sp-local-pair '(emacs-lisp-mode) "'" "'" :actions nil)
;;   (sp-local-pair '(clojure-mode) "'" "'" :actions nil)
;;   (sp-use-paredit-bindings))

;; (use-package lisp-mode
;;   :ensure nil
;;   :init
;;   (add-hook 'emacs-lisp-mode-hook #'smartparens-mode)       
;;   (add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
;;   (add-hook 'emacs-lisp-mode-hook #'evil-smartparens-mode))
;; (use-package cider
;;   :ensure t
;;   :config
;;   (setq cider-cljs-lein-repl
;;       "(do (require 'figwheel-sidecar.repl-api)
;;            (figwheel-sidecar.repl-api/start-figwheel!)
;;            (figwheel-sidecar.repl-api/cljs-repl))"))

;; (use-package evil-paredit-mode
;;   :commands evil-paredit-mode
;;   :init
;;   (add-hook 'clojure-mode-hook #'evil-paredit-mode))

;; (use-package rainbow-delimiters
;;   :commands rainbow-delimiters
;;   :init
;;   (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode))

(use-package aggressive-indent
  :ensure t
  :commands aggressive-indent
  :init
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(use-package company
  :config
  (global-company-mode t))

;; (load-theme 'zenburn t)
(load-theme 'monokai t)
;; (load-theme 'tsdh-light t)

(provide 'init-packages)

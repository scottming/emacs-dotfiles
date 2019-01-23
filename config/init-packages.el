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
                         neotree 
                         rainbow-delimiters
                         ;; aggressive-indent
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

                         cider
                         clojure-mode
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

;; move the cursor to the open window
(use-package popwin
  :config
  (popwin-mode 1))

(use-package neotree
  :bind (("<f8>" . neotree-toggle)))

(use-package hungry-delete
  :config
  (global-hungry-delete-mode))

(use-package highlight-parentheses
  :init
  (add-hook 'clojure-mode-hook 'highlight-parentheses-mode)
  (add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode))

(use-package parinfer
  :ensure t
  :config
  (parinfer-strategy-add 'default 'newline-and-indent)
  :bind
  (:map parinfer-mode-map
        ("C-," . parinfer-toggle-mode)
        ("<tab>" . parinfer-smart-tab:dwim-right)
        ("S-<tab>" . parinfer-smart-tab:dwim-left)
        ("C-i" . parinfer--reindent-sexp)
        ("C-M-i" . parinfer-auto-fix))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
             pretty-parens  ; different paren styles for different modes.
             evil           ; If you use Evil.
             lispy          ; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
             paredit        ; Introduce some paredit commands.
             smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
             smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode)))

(use-package clojure-mode
  :ensure t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.boot\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode)
         ("\\.cljs\\'" . clojurescript-mode)
         ("\\.cljs\\.hl\\'" . clojurescript-mode)))

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

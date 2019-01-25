(package-initialize)
(add-to-list 'load-path "~/.emacs.d/config")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))


(require 'init-packages)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path)


(require 'init-keybindings)
(require 'init-ui)
(require 'init-org)
(require 'init-better-defaults)

(powerline-default-theme)
(window-numbering-mode 1)
(require 'init-evil)
(require 'which-key)
(require 'init-editing-utils)
(which-key-mode)

(setq custom-file (expand-file-name "config/custome.el" user-emacs-directory))

(load-file custom-file)

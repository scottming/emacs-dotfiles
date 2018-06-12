(package-initialize)
(add-to-list 'load-path "~/.emacs.d/config")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)

;; require evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
(global-evil-leader-mode)

(require 'init-keybindings)
(require 'init-ui)
(require 'init-org)
(require 'init-better-defaults)

(powerline-default-theme)
(window-numbering-mode 1)

(require 'evil-surround)
(global-evil-surround-mode)
(setq evil-want-fine-undo t)

(require 'which-key)
(which-key-mode)

(setq custom-file (expand-file-name "config/custome.el" user-emacs-directory))

(load-file custom-file)

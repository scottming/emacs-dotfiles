(package-initialize)
(add-to-list 'load-path "~/.emacs.d/config")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-keybindings)
(require 'init-ui)
(require 'init-org)
(require 'init-better-defaults)

(setq custom-file (expand-file-name "config/custome.el" user-emacs-directory))

(load-file custom-file)

(use-package web-mode
  :ensure t
  :custom
  (web-mode-code-indent-offset 2)
  (web-mode-markup-indent-offset 2)
  (web-mode-enable-auto-pairing t))

(use-package eglot
  :ensure t
  :hook
  ((rust-mode c-mode elixir-mode) . eglot-ensure)
  :custom
  (eglot-ignored-server-capabilites '(:documentHighlightProvider))
  :config
  (add-to-list
   'eglot-server-programs
   '(elixir-mode "/Users/scottming/.vscode/extensions/jakebecker.elixir-ls-0.5.0/elixir-ls-release/language_server.sh")))

(use-package elixir-mode
  :ensure t
  :mode (("\\.eex\\'" . web-mode)
         ("\\.leex\\'" . web-mode))
  :bind
  (:map elixir-mode-map
        ("C-c C-f" . 'elixir-format)))

(bind-key "<tab>" 'company-complete-common-or-cycle company-active-map) 
(provide 'init-elixir)

(use-package python-mode
  :init (progn
          (add-hook 'python-mode-hook 'highlight-indentation-mode)
          (add-hook 'python-mode-hook 'anaconda-mode)
          (add-hook 'python-mode-hook 'eldoc-mode)
          (add-hook 'python-mode-hook 'sphinx-doc-mode))

  :config (progn
            (setq-default python-indent 4)
            (setq python-fill-docstring-style 'onetwo)

            (when (executable-find "ipython")
              (setq
               python-shell-interpreter "ipython"
               python-shell-interpreter-args ""
               python-shell-prompt-regexp "In \\[[0-9]+\\]: "
               python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
               python-shell-completion-setup-code
               "from IPython.core.completerlib import module_completion"
               python-shell-completion-module-string-code
               "';'.join(module_completion('''%s'''))\n"
               python-shell-completion-string-code
               "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))))

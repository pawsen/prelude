(setq-default indent-tabs-mode t)
(setq-default tab-width 4) ; Assuming you want your tabs to be four spaces wide
(defvaralias 'c-basic-offset 'tab-width)
;; use an indentation width of two spaces
(setq lua-indent-level 4)
(setq whitespace-toggle-options '(tabs))

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(defun my-c-mode-defaults ()
  ;; 
  ;; (setq indent-tabs-mode t )
  (setq abbrev-mode nil)
  (ggtags-mode 1)
  ;; show which function you're in
  (which-function-mode t)
	(flyspell-prog-mode)
  )
(setq my-c-mode-common-hook 'my-c-mode-defaults)

;;(add-hook 'prog-mode-hook 'my-c-mode-defaults)
(add-hook 'prog-mode-hook
          (lambda ()
            (my-c-mode-defaults)
						))

;; Example: add all prog-mode's hook to some other mode
;; (add-hook 'elisp-slime-nav-mode
;;           (lambda () (run-hooks 'prog-mode-hook)))

;; add c-default
(add-hook 'c-mode-common-hook (lambda ()
								(run-hooks 'my-c-mode-common-hook)))

;; Disable ggtags-mode for Lisp
(add-hook 'emacs-lisp-mode (lambda () (ggtags-mode -1)))
(add-hook 'lisp-mode (lambda () (ggtags-mode -1)))

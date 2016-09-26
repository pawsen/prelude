(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; start reftex
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-source-correlate-method (quote synctex))
(setq TeX-save-query nil)

;; set default citation command
(setq bibtex-completion-cite-default-command "citep")
;; dont ask for citation style, use default
(setq bibtex-completion-cite-default-as-initial-input nil)
(setq bibtex-completion-cite-prompt-for-optional-arguments nil)

(setq reftex-default-bibliography '("~/ownCloud/speciale/report/biblio/biblio.bib") )
(setq helm-bibtex-bibliography '("~/ownCloud/speciale/report/biblio/biblio.bib"))
(setq bibtex-completion-pdf-field "File") ;use the File describer in the bib file
(setq helm-bibtex-pdf-open-function
	  (lambda (fpath)
		(start-process "evince" "*helm-bibtex-evince*" "/usr/bin/evince" fpath)))
(add-hook 'TeX-mode-hook
		  (lambda() (define-key TeX-mode-map "\C-c[" 'helm-bibtex)))
;; change default behavior. Because TAB does not work. Probably because of prelude
;; https://github.com/tmalsburg/helm-bibtex#change-the-default-action
(helm-delete-action-from-source "Insert citation" helm-source-bibtex)
(helm-add-action-to-source "Insert citation" 'bibtex-completion-insert-citation helm-source-bibtex 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 ;;'(TeX-view-program-list (quote (("Okular" "okular --unique %o#src:%n%b"))))
 )



(provide '77-latex)
;;; 77-latex.el ends here

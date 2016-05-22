;; https://martinralbrecht.wordpress.com/2015/02/12/sage-development-with-emacs
;; http://tuhdo.github.io/c-ide.html


(use-package company-anaconda
  :ensure t)

(use-package company-math
  :ensure t)

(use-package company-auctex
  :ensure t)

(use-package company
  :ensure t
  :diminish company-mode
  :init (progn
          (setq company-minimum-prefix-length 2)
          (setq company-global-modes '(not sage-shell:sage-mode sage-shell-mode))
          (bind-key "C-<tab>" #'company-complete)
          (global-company-mode 1)
          )
  :config (progn
            (setq company-tooltip-limit 20) ; bigger popup window
            (setq company-idle-delay 0.5)    ; decrease delay before autocompletion popup shows
            (setq company-echo-delay 0)     ; remove annoying blinking
            (setq company-show-numbers t)   ; show numbers for easy selection

            (add-to-list 'company-backends #'company-c-headers)
            (add-to-list 'company-backends #'company-anaconda)
            (add-to-list 'company-backends #'company-math-symbols-unicode)

            (defun malb/ede-object-system-include-path ()
              "Return the system include path for the current buffer."
              (when ede-object
                (ede-system-include-path ede-object)))

            ;; company-clang can see include paths in your project. If you add something new, like an include path, to your .dir-locals.el and is editing some source file, reopen the file for the new values to take effect.
            ;;(setq company-c-headers-path-system #'malb/ede-object-system-include-path)

            (bind-key "C-n" #'company-select-next company-active-map)
            (bind-key "C-p" #'company-select-previous company-active-map)
            (bind-key "<tab>" #'company-complete company-active-map)
            (bind-key "M-?" #'company-show-doc-buffer company-active-map)
            (bind-key "M-." #'company-show-location company-active-map)
            )
  )
;; By default company-c-headers only includes two system include
;; paths: /usr/include/ and /usr/local/include/
;; Enable C++ header completion for standard libraries
;; (virker ikke)
;;(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8")


(use-package company-quickhelp
  :ensure t
  :init (company-quickhelp-mode 1))

;;; 77-company.el ends here

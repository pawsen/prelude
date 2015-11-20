;;; 00-mode-mapping.el --- auto-complete additional configuations
;;; commentary:


;; YAML
(autoload 'yaml-mode "yaml-mode")
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("jsTestDriver\\.conf$" . yaml-mode))

;; Header files
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

;; Emacs lisp
(add-to-list 'auto-mode-alist '("Carton$" . emacs-lisp-mode))

;; GMail w/ "It's all text!"
(add-to-list 'auto-mode-alist '("\\.eml\\'" . message-mode))

;; CSS
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))

;; Cucumber
(autoload 'feature-mode "feature-mode")
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

;; Adventur
(autoload 'adventur-mode "adventur-mode")
(add-to-list 'auto-mode-alist '("\\.adv$" . adventur-mode))

;; Jade and Stylus (sws = significant whitespace)
(autoload 'sws-mode "sws-mode")
(autoload 'jade-mode "jade-mode")
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; HTML
;; (add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
;; (add-to-list 'auto-mode-alist '("\\.tag$" . html-mode))
;; (add-to-list 'auto-mode-alist '("\\.vm$" . html-mode))
;; ;; (add-hook 'sgml-mode-hook
;;           (lambda ()
;;             (require 'rename-sgml-tag)
;;             (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))

;; JSP
(autoload 'crappy-jsp-mode "crappy-jsp-mode")
(add-to-list 'auto-mode-alist '("\\.jsp$" . crappy-jsp-mode))
(add-to-list 'auto-mode-alist '("\\.jspf$" . crappy-jsp-mode))

;; Ruby
(autoload 'rhtml-mode "rhtml-mode")
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.watchr$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))

;; Puppet
(autoload 'puppet-mode "puppet-mode")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; Groovy
(autoload 'groovy-mode "groovy-mode")
(add-to-list 'auto-mode-alist '("\\.groovy$" . groovy-mode))

;; Clojure
(autoload 'clojure-mode "clojure-mode")
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

;; SVG
(add-to-list 'auto-mode-alist '("\\.svg$" . image-mode))

;; For files containg both HTML, Javascript, CSS, etc
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (defun my-web-mode-hook ()
;;   "Hooks for Web mode."
;;   (setq web-mode-markup-indent-offset 2)
;;   (setq web-mode-script-padding 1)
;;   (setq web-mode-code-indent-offset 2)
;;   )
;; (add-hook 'web-mode-hook  'my-web-mode-hook)


;; JavaScript
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js2-mode))

;; Use js2-mode’s syntax checking with js. Because js2 can be a bit heavy to
;; load and unload all the time, there might be times where I prefer the
;; build-in js mode.
(add-hook 'js-mode-hook 'js2-minor-mode)
(eval-after-load "js2-mode"
  '(progn
     (setq js2-missing-semi-one-line-override t)
     (setq-default js2-basic-offset 2) ; 2 spaces for indentation
     ))

;; Configuration files
(add-to-list 'auto-mode-alist '("\\.offlineimaprc$" . conf-mode))

;; Snippets
(add-to-list 'auto-mode-alist '("yasnippet/snippets" . snippet-mode))
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

;; Buster.JS
;(autoload 'buster-mode "buster-mode")
;(setq buster-node-executable "/usr/local/bin/node")
;(add-file-find-hook-with-pattern "test\\.js$" (lambda () (buster-mode)) "require(\\(\"\\|'\\)buster")

;; ;; Markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

;; ZSH
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))

;; Highlighting in editmsg-buffer for magit
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . conf-javaprop-mode))

;; org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Apache config
(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;; arduino
;; (setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

;; Matlab
(setq auto-mode-alist
      (cons
       '("\\.m$" . octave-mode)
       auto-mode-alist))

;; OpenSCAD
;; (require 'scad)
(autoload 'scad-mode "scad-mode" "Major mode for editing SCAD code." t)

(add-to-list 'auto-mode-alist '("\\.scad$" . scad-mode))

(provide '77-mode-mapping)

;;; 77-mode-mapping ends here

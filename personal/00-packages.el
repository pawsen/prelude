(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
;; My packages
(setq prelude-packages (append '(
                                 web-mode
                                 arduino-mode
                                 scad-mode
                                 lua-mode
                                 ggtags
                                 edit-server
                                 edit-server-htmlize
                                 use-package
                                 git-timemachine
                                 company-auctex
                                 company-arduino
                                 company-c-headers
                                 highlight-indentation
                                 undo-tree
                                 helm-swoop
                                 helm-gtags
                                 helm-bibtex
                                 elpy
                                 ) prelude-packages))
;; Install my packages
(prelude-install-packages)

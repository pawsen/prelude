(require 'package)
(package-initialize)
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
                                 ) prelude-packages))
;; Install my packages
(prelude-install-packages)

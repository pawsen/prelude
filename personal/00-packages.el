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
                                 ) prelude-packages))
;; Install my packages
(prelude-install-packages)

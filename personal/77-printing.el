
;; print commands
;; ps-print-buffer

;; Print hardcopy of current buffer with page headings containing the file name and page number.
;; print-buffer

;; Print hardcopy of current buffer without page headings.
;; lpr-buffer

;; make a custom print function.
;; http://superuser.com/questions/621104/how-do-you-print-from-emacs-in-osx

;; more to come. See these pages
;; http://www.emacswiki.org/emacs/PrintingFromEmacs
;; http://www.emacswiki.org/emacs/PrintingPackage
;; http://emacs.stackexchange.com/questions/9363/how-to-specify-a-printer


;; more advanced printing menu - not really needed
(require 'printing)
(pr-update-menus t)

;; get graphical interface for printing. You can choose printer.
;; install with: apt-get install gtklp
(setq lpr-command "gtklp")
(setq ps-lpr-command "gtklp")

(provide '77-printing)
;;; 77-printing.el ends here

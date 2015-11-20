(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (menu-bar-mode 1)
  )
(defun esk-turn-off-tool-bar ()
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (menu-bar-mode 1))
;; can't do it at launch or emacsclient won't always honor it
(add-hook 'before-make-frame-hook 'esk-turn-off-tool-bar)


;;; Disable guru-mode completely
(require 'guru-mode)
(setq prelude-guru nil)
;; do not automatically cleanup file on save
(setq prelude-clean-whitespace-on-save nil)
(setq suggest-key-bindings 1)

(setq visible-bell t
	  default-directory (getenv "HOME")
	  )
(setq-default fill-column 80)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)


;;turn off aggressive auto save
(setq prelude-auto-save nil)
(setq
 backup-by-copying t      ;; don't clobber symlinks
 backup-directory-alist
 '(("." . "/tmp/emacs-backups"))    ;; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;; When popping the mark, continue popping until the cursor actually moves
;; Also, if the last command was a copy - skip past all the expand-region cruft.
(defadvice pop-to-mark-command (around ensure-new-position activate)
  (let ((p (point)))
    (when (eq last-command 'save-region-or-current-line)
      ad-do-it
      ad-do-it
      ad-do-it)
    (dotimes (i 10)
      (when (= p (point)) ad-do-it))))



;; edit server
(when (and (daemonp) (locate-library "edit-server"))
  (require 'edit-server)
  (edit-server-start))
(autoload 'edit-server-maybe-dehtmlize-buffer "edit-server-htmlize" "edit-server-htmlize" t)
(autoload 'edit-server-maybe-htmlize-buffer   "edit-server-htmlize" "edit-server-htmlize" t)
(add-hook 'edit-server-start-hook 'edit-server-maybe-dehtmlize-buffer)
(add-hook 'edit-server-done-hook  'edit-server-maybe-htmlize-buffer)

;; two ways to set custom major mode for url.
(setq edit-server-url-major-mode-alist
	  '(("studentergaarden\\.dk\\.wiki" . mediawiki-mode)))
(setq edit-server-url-major-mode-alist
	  '(("studentergaarden\\.dk\\.w" . mediawiki-mode)))

(add-hook 'edit-server-start-hook
          (lambda ()
            (when (string-match "studentergaarden.dk/wiki/" (buffer-name))
              (markdown-mode))))

;; ;; File encoding
;; (require 'un-define "un-define" t)
;; (set-buffer-file-coding-system 'utf-8 'utf-8-unix)
;; (set-default buffer-file-coding-system 'utf-8-unix)
;; (set-default-coding-systems 'utf-8-unix)
;; (prefer-coding-system 'utf-8-unix)
;; (set-default buffer-file-coding-system 'utf-8-unix)

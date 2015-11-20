;; -*- coding: utf-8 -*-
;; Show the matching paren when pressing %. COOL
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defun my-insert-coding (&optional arg)
  "Insert coding in the top of the script."
  (interactive)
  (save-excursion ; save current buffer and point.
    (goto-char 1) ; goto top of document
	;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Specifying-File-Variables.html
    (insert "-*- coding: utf-8; tab-width: 4; indent-tabs-mode: t; c-basic-offset: 4 -*-\n")
    (goto-char 1)
    ;; insert comment - because some comments needs to be terminated, I use
    ;; (comment-region) instead of (comment-insert-comment-function). See also
    ;; (comment-dwim)
    (let ((start (line-beginning-position))
          (end (line-end-position)))
      (comment-region start end))
    (end-of-line)
    ))


(defun my-insert-python ()
  "Insert coding and python in the top of the script."
  (interactive)
  (my-insert-coding)
  (save-excursion ; save current buffer and point.
    (goto-line 2) ; insert python exp after coding
    (insert "#!/usr/bin/python2\n"))
  )

;; Functions from emacs-starter-kit
(defun my-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\|NOCOMMIT\\|NOTE\\)"
          1 font-lock-warning-face t))))
(add-hook 'prog-mode-hook 'my-add-watchwords)


;; Code to toggle languages
(defun ispell-toggle-dictionary()
  (interactive)
  ;; ispell-current-dictionary is not a valid call any more.
  (let* ((dic ispell-current-dictionary)
         (change (if (string= dic "danish") "english" "danish")))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)
    ))


(provide '77-defun)
;;; 77-defun ends here

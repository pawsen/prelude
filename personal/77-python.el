

(elpy-enable)
;; elpy can either use jedi or rope. If both are available, it chooses rope.
(setq elpy-rpc-backend "jedi")
;; use ipython3 if available
(when (executable-find "ipython")
  (elpy-use-ipython "ipython3")
  (setq elpy-rpc-python-command "python3")
  (setq python-shell-interpreter "ipython3" python-shell-interpreter-args "--simple-prompt --pprint")
  (setq python-shell-completion-native "nil")
  )


(defun python-add-breakpoint ()
  "Add a break point"
  (interactive)
  (newline-and-indent)
  (insert "import ipdb; ipdb.set_trace()")
  (highlight-lines-matching-regexp "^[ ]*import ipdb; ipdb.set_trace()"))
(global-unset-key (kbd "C-c C-b"))
(define-key python-mode-map (kbd "C-c i") 'python-add-breakpoint)

(defun ipdb-cleanup ()
    (interactive)
    (save-excursion
      (replace-regexp ".*ipdb.set_trace().*\n" "" nil (point-min) (point-max))
      ;; (save-buffer)
      ))

(defun annotate-pdb ()
  (highlight-lines-matching-regexp "import ipdb")
  (highlight-lines-matching-regexp "ipdb.set_trace()"))
(add-hook 'python-mode-hook 'annotate-pdb)

(defun python-interactive ()
  "Enter the interactive Python environment"
  (interactive)
  (progn
    (insert "!import code; code.interact(local=vars())")
    (move-end-of-line 1)
    (comint-send-input)))
(global-set-key (kbd "C-c i") 'python-interactive)



;; use helm for searching in history
(define-key comint-mode-map (kbd "M-r") 'helm-comint-input-ring)

;; Don't use tab for yasnippets, use shift-tab.
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)

;; save comint history.
;; comint is the shell that runs the inferior python interpreter.
(defun comint-write-history-on-exit (process event)
  "Write comint history of PROCESS when EVENT happened to a file
specified in buffer local var
'comint-input-ring-file-name' (defined in
turn-on-comint-history)."
  (comint-write-input-ring)
  (let ((buf (process-buffer process)))
    (when (buffer-live-p buf)
      (with-current-buffer buf
        (insert (format "\nProcess %s %s" process event))))))

(defun turn-on-comint-history ()
  "Setup comint history.

When comint process started set buffer local var
'comint-input-ring-file-name', so that a file name is specified
to write and read from comint history.

That 'comint-input-ring-file-name' is buffer local is determined
by the 4th argument to 'add-hook' below.  And localness is
important, because otherwise 'comint-write-input-ring' will find
mentioned var nil."

  (let ((process (get-buffer-process (current-buffer))))
    (when process
      (setq comint-input-ring-file-name
            (format "~/.emacs.d/inferior-%s-history"
                    (process-name process)))
      (comint-read-input-ring)
      (set-process-sentinel process
                            #'comint-write-history-on-exit))))

;;The history will be saved calling 'comint-send-eof' (usually C-c C-d).
(add-hook 'inferior-python-mode-hook 'turn-on-comint-history)
;; save also with 'kill-this-buffer'
(add-hook 'kill-buffer-hook 'comint-write-input-ring)

;; When Emacs itself is killed, kill-buffer-hook is not run on individual
;;buffers. We can circumvent this problem by adding a hook to kill-emacs-hook
;;that traverses the list of all buffers and writes the input ring (if it is
;;available) of each buffer to a file.
(defun mapc-buffers (fn)
  (mapc (lambda (buffer)
          (with-current-buffer buffer
            (funcall fn)))
        (buffer-list)))

(defun comint-write-input-ring-all-buffers ()
  (mapc-buffers 'comint-write-input-ring))

(add-hook 'kill-emacs-hook 'comint-write-input-ring-all-buffers)

;; Make FlyCheck less pedantic(it uses flake8 as standard)
;; https://flake8.readthedocs.io/en/2.0/config.html
;; https://flake8.readthedocs.io/en/2.0/warnings.html#error-codes
;; The flake8 configuration file is the place where you setup the preferences
;; emacs ~/.config/flake8
;; [flake8]
;; ignore = E221,E501,E203,E202,E272,E251,E211,E222,E701
;; max-line-length = 160
;; exclude = tests/*
;; max-complexity = 10

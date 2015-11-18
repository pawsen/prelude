;; -*- coding: utf-8 -*-
;;; For forskellige modifier-keys, se
;; http://www.gnu.org/s/libtool/manual/emacs/Modifier-Keys.html


(when window-system (global-unset-key "\C-z"))
(define-key undo-tree-map (kbd "C-z") 'undo-tree-undo)
(define-key undo-tree-map (kbd "C-S-z") 'undo-tree-redo)

;; kill-ring menu
(global-set-key "\C-cy" '(lambda ()
                           (interactive)
                           (popup-menu 'yank-menu)))


;; Open tags in another buffer
(global-set-key (kbd "M-:") 'my-goto-tag-other-window)
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
;; easy spell check
(global-set-key (kbd "C-S-<f10>") 'ispell-word)
(global-set-key (kbd "<f10>") 'flyspell-mode)
(global-set-key (kbd "S-<f10>") 'ispell-toggle-dictionary)
(global-set-key (kbd "C-<f10>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "M-<f10>") 'flyspell-check-next-highlighted-word)
(global-set-key [H-f10]  'flyspell-buffer)
; Turn off the menu bar
(global-set-key [f12] 'kill-buffer)
(global-set-key [C-tab] "\C-q\t"); insert tab

(global-set-key [f9] 'my-compile-func)
(global-set-key [C-S-f9] 'my-compile-clean-func)
(global-set-key [S-f9] 'my-compile-upload-func) ;; til ardiono
(global-set-key [H-f8] 'humble-gud) ;; start debugging
(global-set-key [C-S-f8] 'compile)
;; (global-set-key [S-f7] 'my-compile-package-func)
(global-set-key [M-f9] 'next-error)
(global-set-key [C-f9] 'previous-error)

(global-set-key [f5] 'gud-step) ; go into function
(global-set-key [C-f] 'gud-up) ; stack up/down
(global-set-key [S-f5] 'gud-down)
(global-set-key [f6] 'gud-next) ; step over
(global-set-key [H-f6] 'gud-stepi)
(global-set-key [C-f6] 'gud-jump)
(global-set-key [f7] 'gud-until) ; run until next break-point
(global-set-key [C-f7] 'gud-finish) ; finish and return from


;; Disable several ido kbds
(require'ido)
(defun ido-my-keys ()
"Add my keybindings for ido."
(define-key ido-file-dir-completion-map [(meta ?b)] 'backward-word)
(define-key ido-file-dir-completion-map [(meta ?d)] 'kill-word)
(define-key ido-file-dir-completion-map [(meta ?f)] 'forward-word)
(define-key ido-file-dir-completion-map "\C-x\C-f" nil)
(define-key ido-common-completion-map "\C-a" 'move-beginning-of-line)
(define-key ido-common-completion-map "\C-e" 'move-end-of-line)
(define-key ido-common-completion-map "\C-f" 'forward-char))
(add-hook 'ido-setup-hook 'ido-my-keys)
;;; Unbinding keys
(global-unset-key (kbd "C-x C-p")) ; used to mark page
(global-unset-key (kbd "C-x C-n")) ; used to set-goal-column
(global-unset-key (kbd "C-x 0")) ; used to delete-window
(global-unset-key (kbd "C-x 1")) ; used to delete-other-windows
(global-unset-key (kbd "C-x 2")) ; used to split-window-vertically
(global-unset-key (kbd "C-x 3")) ; used to split-window-horizontally
 ;; Help command
(global-set-key (kbd "<f1>") 'help-command)
;; Back killing
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(define-key key-translation-map [?\C-h] [?\C-?])
;; Vim like open previous/next line
(global-set-key (kbd "C-o") 'prelude-smart-open-line)
(global-set-key (kbd "C-M-o") 'prelude-smart-open-line-above)
;; Window switching
(define-key prelude-mode-map (kbd "M-0") 'delete-window)
(define-key prelude-mode-map (kbd "M-1") 'delete-other-windows)
(define-key prelude-mode-map (kbd "M-2") 'split-window-vertically)
(define-key prelude-mode-map (kbd "M-3") 'split-window-horizontally)
(define-key prelude-mode-map (kbd "M-o") 'other-window)
(define-key prelude-mode-map (kbd "M-O") (lambda () (interactive) (other-window -1)))
(define-key prelude-mode-map (kbd "M-k") 'kill-this-buffer)
(define-key prelude-mode-map (kbd "s-0") 'balance-windows)
(define-key prelude-mode-map (kbd "C-x o") 'ace-window)
;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-M-%") 'query-replace)
(global-set-key (kbd "M-r") 'highlight-symbol-query-replace)
(prelude-require-packages
'(expand-region highlight-symbol multiple-cursors smart-shift))
;; Expand region
(require 'expand-region)
(global-set-key (kbd "M-h") 'er/expand-region)
;;; Highlight symbols
(require 'highlight-symbol)
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)
;;; Multiple Cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "S-<down>") 'mc/mark-next-lines)
(global-set-key (kbd "S-<up>") 'mc/mark-previous-lines)
(global-set-key (kbd "C-*") 'mc/mark-all-symbols-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-symbol-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-symbol-like-this)
(require 'smart-shift)
(global-set-key (kbd "M-[") 'smart-shift-left)
(global-set-key (kbd "M-]") 'smart-shift-right)


;; ;; (global-set-key "\M-g" 'goto-line) ;;Meta-g for goto linie nummer
(provide 'bindings)

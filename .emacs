;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(show-paren-mode t)
(windmove-default-keybindings)

(setq speedbar-show-unknown-files t)
(setq calendar-latitude -34.598261)
(setq calendar-longitude -58.444414)


(global-set-key [f5] 'revert-buffer)
(global-set-key [f6] 'toggle-truncate-lines)
(global-set-key [f8] 'eshell)
(global-set-key [f9] 'magit-log-buffer-file)
(global-set-key [S-f9] 'ediff-revision)

;; python

(add-hook 'python-mode-hook (lambda () (hs-minor-mode t) (git-gutter-mode t)))
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


(ido-mode t)
(projectile-mode)

;; javascript
(require 'js2-mode)
;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
			   
(add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))


(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;(load (expand-file-name "~/quicklisp/slime-helper.el"))

(defun my-dired-find-file-this-window ()
  "In Dired, visit this file or directory in this window."
  (interactive)
  (find-file (dired-get-file-for-visit)))
(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map [mouse-2] 'my-dired-find-file-this-window)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-listing-switches "-alh --group-directories-first")
 '(inferior-lisp-program "/usr/bin/sbcl" t)
 '(initial-buffer-choice "~/RAR")
 '(org-agenda-files (quote ("~/Dropbox/RAR/bills-2018-09.org")))
 '(package-selected-packages
   (quote
    (markdown-mode slime xref-js2 js2-mode jedi git-gutter-fringe projectile-ripgrep projectile magit php-mode)))
 '(speedbar-tag-hierarchy-method (quote (speedbar-sort-tag-hierarchy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

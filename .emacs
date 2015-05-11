(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-dictionary-directories (quote ("~/Radovi/Org/Dict")))
 '(ac-dictionary-files nil)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(custom-enabled-themes (quote (Deviant)))
 '(custom-safe-themes
   (quote
    ("fe20c1ea61a2836a5cea69963865b5b8df8c480ccaf3f11ad7f2e1f543f6c274" "7c4aebe99e804e7b41f34e8e2366cadd61c07977e72e4a0ee9498000a95c5d86" default)))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(dired-dwim-target t)
 '(dired-find-subdir nil)
 '(global-auto-revert-mode t)
 '(grep-command "grep -nHir -e ")
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files
   (quote
    ("~/Radovi/Org/Admin/TODO.org" "~/Radovi/Org/Wikidev/Projects/CultureMars.org" "~/Radovi/Org/Wikidev/Projects/Dodo.org" "~/Radovi/Org/Wikidev/Projects/AppDevWithPixijs.org")))
 '(org-directory "~/Radovi/Org")
 '(org-export-headline-levels 5)
 '(org-link-frame-setup
   (quote
    ((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news)
     (file . find-file)
     (wl . wl-other-frame))))
 '(org-refile-use-outline-path (quote file))
 '(org-src-fontify-natively t)
 '(smooth-scroll-margin 4)
 '(tool-bar-mode nil)
 '(yas-indent-line (quote auto)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "outline" :slant normal :weight normal :height 113 :width normal))))
 '(js2-error ((t nil))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MANUAL SETTINGS                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; includes
(load "~/Radovi/Org/Dict/my_emacs_abbrev.el")

(setq global-auto-revert-mode t)
(global-set-key (kbd "C-z") 'undo)

; Set cursor color
;; (set-cursor-color "#cccccc")

;; variables
(setq default-directory "~/Radovi/Org" )
(setq bookmark-save-flag 1)
(setq smooth-scroll-margin 4)
(setq make-backup-files nil)
(tool-bar-mode -1)
(setq fci-rule-column 80)

;; GLOBAL KEYBINDINGS

;; tab
(global-set-key "\C-j" 'newline-and-indent)

;; auto-load major mods
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))

;; auto-load minor modes
(global-visual-line-mode 1)
;; (electric-pair-mode t)
(ido-mode t)
(setq ido-enable-flex-matching 1)

;; marmelade, melpa package REPOSITORIES
(require 'package)
(add-to-list 'package-archives 
	     '("marmalade" .
	       "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; DIRED
(require 'dired+)
(setq dired-listing-switches "-aBhl  --group-directories-first")

;; NEOTREE
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; YASNIPPET
;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(yas-global-mode 1)

;; AUTO-COMPLETE
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start 3)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

;; split vertically when vising new buffer
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; flymake
;; (add-hook 'find-file-hook 'flymake-find-file-hook)

;; HIPPIE
(global-set-key "\M- " 'hippie-expand)
;; completing the name of the file in the buffer. 
;; (fset 'my-complete-file-name
;;       (make-hippie-expand-function '(try-complete-file-name-partially
;; 				     try-complete-file-name)))
;; (global-set-key "\M-\\" 'my-complete-file-name)

;;;;;;;;;;;;;;;;
;; JAVASCRIPT ;;
;;;;;;;;;;;;;;;;
;; nodejs/rhino REPL
(require 'js-comint)
(setq inferior-js-program-command "/usr/bin/node")
;; (setq inferior-js-program-command "/usr/bin/rhino")

;; supress nodejs output garbage codes
(setenv "NODE_NO_READLINE" "1")

(add-hook 'js2-mode-hook '(lambda ()
			    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
			    (local-set-key "\C-cb" 'js-send-buffer)
			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
			    (local-set-key "\C-cl" 'js-load-file-and-go)
			    ))

(add-hook 'js2-minor-mode-hook '(lambda ()
				  (local-set-key "\C-x\C-e" 'js-send-last-sexp)
				  (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
				  (local-set-key "\C-cb" 'js-send-buffer)
				  (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
				  (local-set-key "\C-cl" 'js-load-file-and-go)
				  ))

;; JS2-MODE hooks
(add-hook 'js2-mode-hook 'auto-complete-mode)
(add-hook 'js2-mode-hook '(lambda() (setq ac-auto-start 4)))
;; (add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'js2-mode-hook 'yas-minor-mode)
(add-hook 'js2-mode-hook 'linum-mode)
;; (require 'flymake-jslint)
;; (add-hook 'js2-mode-hook
;; 	  (lambda () (flymake-mode t)))
(js2r-add-keybindings-with-prefix "C-c C-m")
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(add-hook 'js2-mode-hook 'fci-mode)
(add-hook 'js2-mode-hook 'electric-pair-mode)
(add-hook 'js2-mode-hook (lambda ()
			    (local-set-key "\C-c\C-u" 'comment-or-uncomment-region)
			    ))

;; TERN mode
;; (add-to-list 'ac-modes 'tern-mode)
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
;; ;; tern + auto-complete
;; (eval-after-load 'tern
;;   '(progn
;;      (require 'tern-auto-complete)
;;      (tern-ac-setup)))
;; (add-hook 'tern-mode-hook '(lambda() (setq ac-auto-start 3)))
;; (add-hook 'tern-mode-hook (lambda ()
;; 			    (local-set-key "\C-c\C-y" 'tern-ac-complete)
;; 			    ))

;; jQuery-doc
;; (require 'jquery-doc)
;; (add-hook 'js2-mode-hook 'jquery-doc-setup)

;; HTML
(add-hook 'html-mode-hook 'auto-complete-mode)
(add-hook 'html-mode-hook 'yas-minor-mode)
(add-hook 'html-mode-hook '(lambda() (setq ac-auto-start 4)))

;; WEB-MODE
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (add-hook 'web-mode-hook 'yas-minor-mode)

;;;;;;;;;;;;;;
;; LUA-MODE ;;
;;;;;;;;;;;;;;
(add-hook 'lua-mode-hook 'auto-complete-mode)
(add-hook 'lua-mode-hook '(lambda() (setq ac-auto-start 4)))
(add-hook 'lua-mode-hook 'yas-minor-mode)
(add-hook 'lua-mode-hook 'linum-mode)
(add-hook 'lua-mode-hook 'fci-mode)
(add-hook 'lua-mode-hook 'electric-pair-mode)
(add-hook 'lua-mode-hook (lambda ()
			    (local-set-key "\C-c\C-u" 'comment-or-uncomment-region)
			    ))
;;;;;;;;;;;;;;
;; ORG-MODE ;;
;;;;;;;;;;;;;;
(require 'org-install)
(require 'org)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.wiki$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
;; (define-key global-map "\C-cy" 'org-cycle-agenda-files)
(setq org-log-done 'time)

;; highlight src syntax
(setq org-src-fontify-natively t)

;; hooks for minor mods
(add-hook 'org-mode-hook 'auto-complete-mode)
(add-hook 'org-mode-hook '(lambda ()
			    (setq-local ac-auto-start nil)
			    (define-key ac-mode-map (kbd "M-/") 'auto-complete)			    
			    ))

(add-hook 'text-mode-hook 'auto-complete-mode)
(add-hook 'text-mode-hook '(lambda ()
			     (setq-local ac-auto-start nil)
			     (define-key ac-mode-map (kbd "M-/") 'auto-complete)			    
			     ))

;; remember mode
(define-key global-map "\C-cc" 'org-capture)
;; file OR file+headline OR file+datetree
(setq org-capture-templates
      '(
	("f" "Filo & Human" entry (file "~/Radovi/Org/Remember/ideje.org")
	 "* %?\n  %i\n  %a\n  %U")
	("g" "Game Stud & Design" entry (file "~/Radovi/Org/Remember/ideas&quotes.org")
	 "* %?\n  %i\n  %a\n  %U")
	("b" "Blog" entry (file "~/Radovi/Org/Remember/blog.org")
	 "* %?\n  %i\n  %a\n  %U")
	))

; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
;;;;;;;;;;;;
;; MACROS ;;
;;;;;;;;;;;;
;; place the cursor at the end of the camelCase tag (without non-word characters) and run macro in order to add the tag to the org-mode dictionary (auto-complete dictionary)
;; used to add tag with non-word characters to the org-mode auto-complete dictionary; mark the tag and run the macro
(fset 'hshtg-macro
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217826 67108896 134217830 134217847 24 6 126 47 82 97 100 111 118 105 return 79 114 103 return 68 105 99 116 return 111 114 103 45 109 111 100 101 return 134217790 134217790 25 return 24 19 24 107 return 24 19] 0 "%d")) arg)))
(put 'erase-buffer 'disabled nil)

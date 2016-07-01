(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-dictionary-directories (quote ("~/Radovi/Org/Dict")))
 '(ac-dictionary-files nil)
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes (quote ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "fe20c1ea61a2836a5cea69963865b5b8df8c480ccaf3f11ad7f2e1f543f6c274" "7c4aebe99e804e7b41f34e8e2366cadd61c07977e72e4a0ee9498000a95c5d86" default)))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(desktop-path (quote ("~/.emacs.d/" "~" "~/.emacs.d/desktop")))
 '(dired-dwim-target t)
 '(dired-find-subdir nil)
 '(fci-rule-color "#073642")
 '(global-auto-revert-mode t)
 '(grep-command "grep -nHir -e ")
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files (quote ("~/Radovi/Org/todo.org")))
 '(org-directory "~/Radovi/Org")
 '(org-export-headline-levels 5)
 '(org-link-frame-setup (quote ((vm . vm-visit-folder-other-frame) (vm-imap . vm-visit-imap-folder-other-frame) (gnus . org-gnus-no-new-news) (file . find-file) (wl . wl-other-frame))))
 '(org-refile-use-outline-path (quote file))
 '(org-src-fontify-natively t)
 '(safe-local-variable-values (quote ((require-final-newline))))
 '(sentence-end-double-space nil)
 '(smooth-scroll-margin 12)
 '(smooth-scrolling-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#dc322f") (40 . "#cb4b16") (60 . "#b58900") (80 . "#859900") (100 . "#2aa198") (120 . "#268bd2") (140 . "#d33682") (160 . "#6c71c4") (180 . "#dc322f") (200 . "#cb4b16") (220 . "#b58900") (240 . "#859900") (260 . "#2aa198") (280 . "#268bd2") (300 . "#d33682") (320 . "#6c71c4") (340 . "#dc322f") (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(yas-indent-line (quote auto)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "outline" :slant normal :weight normal :height 96 :width normal))))
 '(js2-error ((t nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MANUAL SETTINGS                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; LOADS
(load "~/Radovi/Org/Dict/my_emacs_abbrev.el")

;; VARIABLES
(setq default-directory "~/Radovi/Org" )
(setq bookmark-save-flag 1)
(setq make-backup-files nil)
(tool-bar-mode -1)
(setq fci-rule-column 80)
(setq global-auto-revert-mode t)

;; tabs&indents
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;; (setq indent-line-function 'insert-tab)
;; (setq tab-stop-list (number-sequence 4 200 4))

;; switch windows with your shift key by pressing S-<left>, S-<right>, S-<up>, S-<down>
(windmove-default-keybindings)
;; "undo" (and “redo”) changes in the window configuration with the key commands ‘C-c 
(winner-mode 1)

;; (set-cursor-color "#cccccc")

;; split vertically when vising new buffer
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; GLOBAL KEYBINDINGS
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-i") 'imenu)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; tab
(global-set-key "\C-j" 'newline-and-indent)

;;;;;;;;;;;;;;
;; MODES    ;;
;;;;;;;;;;;;;;

;; auto-load major mods
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))

;; auto-load minor modes
(global-visual-line-mode 1)
;; (electric-pair-mode t)

(setq ido-everywhere t)
(setq ido-enable-flex-matching 1)
(ido-mode t)

;; marmelade, melpa package REPOSITORIES
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(desktop-save-mode 1)

;; MOVETEXT is extracted from Basic edit toolkit.
;; It allows you to move the current line using M-up / M-down
;; if a region is marked, it will move the region instead.

(require 'move-text)
(move-text-default-bindings)

;; HELM
(require 'helm)
(require 'helm-config)
(helm-mode t)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

;; You have to bind helm-M-x to M-x manually. Otherwise, you still get Helm completion, but using the vanilla M-x that does not provides the above features like showing key bindings and TAB to open built-in documentation.
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; (global-set-key (kbd "C-x c o") 'helm-occur)
(global-set-key (kbd "M-s o") 'helm-occur)
(global-set-key (kbd "M-g s") 'helm-do-grep)

;; Dired
(require 'dired+)
(setq dired-listing-switches "-aBhl  --group-directories-first")

;; Neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Yasnippet
;; should be loaded before auto complete so that they can work together
;; (require 'yasnippet)
;; (yas-global-mode 1)
;; (yas-reload-all)

;; Auto-complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start 3)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

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
;; COMMANDS   ;;
;;;;;;;;;;;;;;;;
(transient-mark-mode 1)
(defun select-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))

(global-set-key "\C-c\C-i" 'select-current-line)

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(defun duplicate-line-or-region (&optional n)
  "Duplicate current line, or region if active.
With argument N, make N copies.
With negative N, comment out original line and use the absolute value."
  (interactive "*p")
  (let ((use-region (use-region-p)))
    (save-excursion
      (let ((text (if use-region        ;Get region if active, otherwise line
                      (buffer-substring (region-beginning) (region-end))
                    (prog1 (thing-at-point 'line)
                      (end-of-line)
                      (if (< 0 (forward-line 1)) ;Go to beginning of next line, or make a new one
                          (newline))))))
        (dotimes (i (abs (or n 1)))     ;Insert N times, or once if not specified
          (insert text))))
    (if use-region nil                  ;Only if we're working with a line (not a region)
      (let ((pos (- (point) (line-beginning-position)))) ;Save column
        (if (> 0 n)                             ;Comment out original with negative arg
            (comment-region (line-beginning-position) (line-end-position)))
        (forward-line 1)
        (forward-char pos)))))

(global-set-key [?\C-c ?d] 'duplicate-line-or-region)

;;;;;;;;;;;;;;;;
;; PYTHON     ;;
;;;;;;;;;;;;;;;;
(require 'python-environment)

(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'elpy-mode)
(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'python-mode-hook 'electric-pair-mode)

(add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)

(add-hook 'python-mode-hook (lambda ()
                              (local-set-key "\C-c\C-u" 'comment-or-uncomment-region-or-line)
                              (local-set-key "\C-cr" 'pyrogue)
                              (setq-local ac-auto-start nil)
                              ;; (define-key ac-mode-map (kbd "M-/") 'auto-complete)
                              (local-set-key "\M-/" 'jedi:complete)
                              (setq-local resize-mini-windows nil)
                              ))

(require 'ein)
;;;;;;;;;;;;;;;;
;; JAVASCRIPT ;;
;;;;;;;;;;;;;;;;

;; nodejs/rhino REPL | js-comint.el is a comint mode for emacs which allows you to run a compatible javascript repl
;; when paired with Steve Yegge's js2-mode it becomes a useful way of testing non-html-centric javascript code while editing it. 
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
                (local-set-key "\C-c\C-c" 'comment-or-uncomment-region-or-line)
			    ))

(add-hook 'js2-minor-mode-hook '(lambda ()
				  (local-set-key "\C-x\C-e" 'js-send-last-sexp)
				  (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
				  (local-set-key "\C-cb" 'js-send-buffer)
				  (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
				  (local-set-key "\C-cl" 'js-load-file-and-go)
                  (local-set-key "\C-c\C-c" 'comment-or-uncomment-region-or-line)
				  ))

;; JS2-MODE hooks
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode) ;; An attempt at context sensitive auto-completion for Javascript in Emacs using js2-mode's parser and Skewer-mode
(setq js2-highlight-level 3)

(add-hook 'js2-mode-hook 'show-paren-mode)
(add-hook 'js2-mode-hook 'electric-pair-mode)

(add-hook 'js2-mode-hook 'auto-complete-mode)
(add-hook 'js2-mode-hook '(lambda() (setq ac-auto-start 4)))

(add-hook 'js2-mode-hook 'yas-minor-mode)

(add-hook 'js2-mode-hook 'linum-mode)


;; (require 'flymake-jslint)
;; (add-hook 'js2-mode-hook
;; 	  (lambda () (flymake-mode t)))

;; ESLINT
;; http://www.flycheck.org/en/latest/user/quickstart.html#flycheck-quickstart
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
          '(javascript-jshint)))

;; use eslint with js2-mode
(flycheck-add-mode 'javascript-eslint 'js2-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; JS2-REFACTOR
;; This is a collection of small refactoring functions to further the idea of a JavaScript IDE in Emacs that started with js2-mode.
(require 'js2-refactor)
(add-hook 'js2-mode-hook 'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

;; graphically indicate the location of the fill column by drawing a thin line
;; (add-hook 'js2-mode-hook 'fci-mode)

(add-hook 'js2-mode-hook (lambda ()
			   (local-set-key "\C-c\C-u" 'comment-or-uncomment-region)
			   ))

;; ;; CSS
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))
(add-hook 'css-mode-hook (lambda ()
                           (local-set-key "\C-c\C-u" 'comment-or-uncomment-region)
                           (local-set-key "\C-c\C-c" 'comment-or-uncomment-region-or-line)
                           ))


;; ;; GLSL mode
;; ;; (add-hook 'glsl-mode-hook 'auto-complete-mode)
;; ;; (add-hook 'glsl-mode-hook '(lambda() (setq ac-auto-start 4)))
;; ;; (add-hook 'glsl-mode-hook (lambda ()
;; ;; 			    (local-set-key "\C-c\C-u" 'comment-or-uncomment-region)
;; ;; 			    ))


;; ;; TERN mode
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

;; ;; jQuery-doc
;; ;; (require 'jquery-doc)
;; ;; (add-hook 'js2-mode-hook 'jquery-doc-setup)

;; ;; HTML
(add-hook 'html-mode-hook 'auto-complete-mode)
(add-hook 'html-mode-hook 'yas-minor-mode)
(add-hook 'html-mode-hook '(lambda() (setq ac-auto-start 4)))

;; ;; WEB-MODE
;; ;; (require 'web-mode)
;; ;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; ;; (add-hook 'web-mode-hook 'yas-minor-mode)

;;;;;;;;;;;;;;
;; LUA-MODE ;;
;;;;;;;;;;;;;;

(add-hook 'lua-mode-hook 'auto-complete-mode)
(add-hook 'lua-mode-hook 'hs-minor-mode)
(add-hook 'lua-mode-hook 'imenu-add-menubar-index)
(add-hook 'lua-mode-hook '(lambda() (setq ac-auto-start 4)))
(add-hook 'lua-mode-hook 'yas-minor-mode)
(add-hook 'lua-mode-hook 'linum-mode)
;; (add-hook 'lua-mode-hook 'fci-mode)
(add-hook 'lua-mode-hook 'electric-pair-mode)
(add-hook 'lua-mode-hook (lambda ()
                           (local-set-key "\C-c\C-u" 'comment-or-uncomment-region)
                           (local-set-key "\C-c\C-c" 'comment-or-uncomment-region-or-line)
                           ))

(require 'flymake-lua)
(add-hook 'lua-mode-hook 'flymake-lua-load)

(add-hook 'lua-mode-hook '(lambda ()
			    (local-set-key "\C-x\C-e" 'lua-send-defun)
			    (local-set-key "\C-\M-x" 'lua-send-region)
			    (local-set-key "\C-cb" 'lua-send-buffer)
			    (local-set-key "\M-g\M-n" 'flymake-goto-next-error)
			    (local-set-key "\M-g\M-p" 'flymake-goto-prev-error)
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
	("f" "Filozofija & humanistika" entry (file "~/Radovi/Org/Wikith/Journal/remember.org")
	 "* FILOZOFEM\n%U\n*%f*\n%i\n\n###\n\n%?")
	("g" "Game dev & design" entry (file "~/Radovi/Org/Wikidev/Journal/remember.org")
	 "* ENTRY\n%U\n*%f*\n%i\n\n###\n\n%?")
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

;; for inserting lua related keywords into the dictionary file
(fset 'lelua
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217826 67108896 134217830 134217847 24 6 126 47 82 97 100 111 118 105 return 79 114 103 return 68 105 99 116 return 108 117 97 45 109 111 100 101 return 134217790 134217790 25 return 24 19 24 107 return 134217848 97 99 45 99 108 101 97 114 tab return] 0 "%d")) arg)))

(fset 'pare
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217832 14 134217765 17 10 return return 33 return] 0 "%d")) arg)))


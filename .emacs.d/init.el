(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package) (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package gruvbox-theme
  :ensure t
  :config (load-theme 'gruvbox t))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 1))

(use-package general)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package treemacs)

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-diagnostics-provider :none)
  (setq lsp-headerline-breadcrumb-enable-diagnostics nil)
  :config
  (lsp-enable-which-key-integration t))

(use-package python
  :ensure t
  :hook (python-mode . lsp)
  :custom
  (python-shell-interpreter "python3"))

(use-package lua-mode)

;; When in programming mode, treat underscores as part of words
(add-hook 'prog-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

(use-package undo-tree
  :ensure t
  :after evil
  :diminish
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1))

;; Indent with 4 spaces
;; https://www.emacswiki.org/emacs/IndentingC
(add-hook 'prog-mode-hook #'(lambda () (setq-default c-basic-offset 4
							 tab-width 4
							 indent-tabs-mode nil)))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Development")
    (setq projectile-project-search-path '("~/Development")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(general-define-key
 :keymaps 'evil-normal-state-map
 "C-u" 'evil-scroll-up)

;; Window movements are easier if you don't have to let go of control
(general-define-key
 :keymaps 'evil-window-map
 "C-h" 'evil-window-left
 "C-j" 'evil-window-down
 "C-k" 'evil-window-up
 "C-l" 'evil-window-right)

;; Note - run M-x all-the-icons-install-fonts on new machine
(use-package all-the-icons)
(use-package doom-modeline
  :init (doom-modeline-mode 1))


;; ------------------------- DON'T TOUCH ------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(treemacs-projectile projectile projectile-mode lua-mode treemacs-evil treemacs lsp-mode evil-collection evil general which-key firecode-theme gruvbox-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; --------------------------------------------------------------------

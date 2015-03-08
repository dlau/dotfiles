;;misc

(setq make-backup-files nil)

;; packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(require-package 'evil)

(require-package 'helm)

(require-package 'projectile)
(projectile-global-mode)

(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(require-package 'evil-leader)
(evil-leader/set-key
    "s" 'helm-projectile-ag
    "r" 'projectile-replace
    "p" 'helm-projectile-switch-project
    "b" 'helm-projectile-switch-to-buffer
    "h" 'helm-projectile
    "f" 'helm-projectile-find-file)
(global-evil-leader-mode)

(require-package 'evil-surround)
(global-evil-surround-mode 1)

;(eval-after-load "color-theme-sanityinc-tomorrow"
  ;(load-theme 'color-theme-tomorrow-blue t)
;)
(require-package 'color-theme)
(color-theme-initialize)
(require-package 'color-theme-sanityinc-tomorrow)

(require 'color-theme-sanityinc-tomorrow)
(color-theme-sanityinc-tomorrow--define-theme night)

(evil-mode 1)

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (color-theme-sanityinc-tomorrow color-theme evil-surround evil-leader projectile helm evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

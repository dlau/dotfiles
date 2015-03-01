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

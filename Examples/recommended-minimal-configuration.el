;;; recommended-minimal-configuration.el --- Provides minimal recommended configuration

;; Homepage: https://github.com/89453728/Learning-Lisp.git
;; Version: 0
;; Package-Requires: ((use-package "0.1") (which-key "0.1"))

;;; Commentary:
;; This are recommended bare-minimal configuration. Keep in mind that
;; depends on `use-package' by jwiegley. More over on
;; https://github.com/jwiegley/use-package

;;; Code:

(require 'use-package)
(require 'which-key)

;; Relative line number.
;; Only enabled for programming major modes.
(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Visual line mode shows a line wrapped if the line is longer than
;; window size. you will see a visual indication that the line has
;; been wrapped.
(use-package simple
  :diminish visual-line-mode global-visual-line-mode
  :config
  (global-visual-line-mode 1))

;; `show-paren-mode' hightlight the matching paren
(show-paren-mode)

;; Change `yes or no' dialog to `y or n'.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Enables `which-key-mode' that helps you to know which key have you
;; available once you start a key chore.
(use-package which-key
  :diminish
  :config (which-key-mode))

;; Enables `recentf' package to keep track of recent visited files.
(use-package recentf
  :config
  (recentf-mode 1)
  (setq recentf-max-menu-items 100)
  (setq recentf-max-saved-items 100))

(provide 'recommended-minimal-configuration)

;;; recommended-minimal-configuration.el ends here

;;; packages.el --- gavin layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: ubuntu <ubuntu@yellowtao>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `gavin-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `gavin/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `gavin/pre-init-PACKAGE' and/or
;;   `gavin/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst gavin-packages
  '(
    youdao-dictionary
    company
    yasnippet
    )
  "The list of Lisp packages required by the gavin layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun gavin/init-youdao-dictionary()
  (use-package youdao-dictionary
    :init
    :defer t
    ))

;; add verilog keywords to company-keywords-backends
(defun gavin/post-init-company()
  (add-hook 'verilog-mode-hook 'company-mode)
  (require 'verilog-mode)
  (require 'company-keywords)
  (add-to-list 'company-keywords-alist (cons 'verilog-mode verilog-keywords))
  (let ((map company-active-map))
    (define-key map (kbd "M-n")   nil)
    (define-key map (kbd "M-p")   nil)
    (define-key map (kbd "C-n")   'company-select-next)
    (define-key map (kbd "C-p")   'company-select-previous)))

(defun gavin/post-init-yasnippet()
  (with-eval-after-load 'yasnippet
    (define-key yas-minor-mode-map (kbd "<tab>") nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)
    (define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)))

;;; packages.el ends here

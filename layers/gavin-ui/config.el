;; enable the cursor blink
(blink-cursor-mode t)

;; hilight perl builfin function name
(font-lock-add-keywords 'perl-mode '(("\\<print\\(f\\)?\\>" . font-lock-builtin-face)
                                     ("\\<open\\>" . font-lock-builtin-face)
                                     ("\\<close\\>" . font-lock-builtin-face)
                                     ("\\<\\(or\\)\\>" . font-lock-keyword-face))) 

;; add org TODO keywords
(setq org-todo-keywords
      '((sequence "TODO" "LEARNING" "|" "DONE" "REPORT")))

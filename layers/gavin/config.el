;; org related kbd
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-switchb)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)

;; set org-agenda files path
(setq org-agenda-files '("~/Documents/Agenda/"))
;; display the holiday anniversaries, etc in the agenda view
(setq org-agenda-include-diary t)

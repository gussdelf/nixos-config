;;; config.el -*- lexical-binding: t; -*-

(setq user-full-name "Gustavo de Lima Freitas"
      user-mail-address "gussdelf@gmail.com")

(setq org-directory "~/Docs/org/")

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package! theme-magic
  :commands theme-magic-from-emacs
  :config
  (defadvice! theme-magic--auto-extract-16-doom-colors ()
    :override #'theme-magic--auto-extract-16-colors
    (list
     (face-attribute 'default :background)
     (doom-color 'error)
     (doom-color 'success)
     (doom-color 'type)
     (doom-color 'keywords)
     (doom-color 'constants)
     (doom-color 'functions)
     (face-attribute 'default :foreground)
     (face-attribute 'shadow :foreground)
     (doom-blend 'base8 'error 0.1)
     (doom-blend 'base8 'success 0.1)
     (doom-blend 'base8 'type 0.1)
     (doom-blend 'base8 'keywords 0.1)
     (doom-blend 'base8 'constants 0.1)
     (doom-blend 'base8 'functions 0.1)
     (face-attribute 'default :foreground))))

(use-package! screenshot
  :defer t)

(require 'dash)

(defmacro pretty-magit (WORD ICON PROPS &optional NO-PROMPT?)
  "Replace sanitized WORD with ICON, PROPS and by default add to prompts."
  `(prog1
       (add-to-list 'pretty-magit-alist
                    (list (rx bow (group ,WORD (eval (if ,NO-PROMPT? "" ":"))))
                          ,ICON ',PROPS))
     (unless ,NO-PROMPT?
       (add-to-list 'pretty-magit-prompt (concat ,WORD ": ")))))

(setq pretty-magit-alist nil)
(setq pretty-magit-prompt nil)
(pretty-magit "Feature" ?🐉 (:foreground "slate gray" :height 1.2))
(pretty-magit "Add"     ? (:foreground "#375E97" :height 1.2))
(pretty-magit "Fix"     ? (:foreground "#FB6542" :height 1.2))
(pretty-magit "Clean"   ? (:foreground "#FFBB00" :height 1.2))
(pretty-magit "Docs"    ? (:foreground "#3F681C" :height 1.2))
(pretty-magit "master"  ? (:box t :height 1.2) t)
(pretty-magit "origin"  ? (:box t :height 1.2) t)

(defun add-magit-faces ()
  "Add face properties and compose symbols for buffer from pretty-magit."
  (interactive)
  (with-silent-modifications
    (--each pretty-magit-alist
      (-let (((rgx icon props) it))
        (save-excursion
          (goto-char (point-min))
          (while (search-forward-regexp rgx nil t)
            (compose-region
             (match-beginning 1) (match-end 1) icon)
            (when props
              (add-face-text-property
               (match-beginning 1) (match-end 1) props))))))))

(advice-add 'magit-status :after 'add-magit-faces)
(advice-add 'magit-refresh-buffer :after 'add-magit-faces)

(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 18 :height 'medium)
      doom-big-font (font-spec :family "Meslo LG L Nerd Font" :size 18 :height 'medium)
      doom-variable-pitch-font (font-spec :family "Overpass Nerd Font")
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "BlexMono Nerd Font" :weight 'light))

(setq doom-theme 'doom-gruvbox)
(setq doom-gruvbox-dark-variant "hard")

(defun doom-dashboard-widget-footer ()
  (insert
   "\n"
   (+doom-dashboard--center
    (- +doom-dashboard--width 2)
    (with-temp-buffer
      (insert-text-button (or (all-the-icons-octicon "octoface" :face 'doom-dashboard-footer-icon :height 1.3 :v-adjust -0.15)
                              (propertize "github" 'face 'doom-dashboard-footer))
                          'action (lambda (_) (browse-url "https://github.com/gussdelf/"))
                          'follow-link t
                          'help-echo "Open my github page")
      (buffer-string)))
   "\n"))

(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(add-hook! '+doom-dashboard-mode-hook (hide-mode-line-mode 1)(hl-line-mode -1))
(setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))

(setq fancy-splash-image (expand-file-name "misc/splash-images/skull.svg" doom-private-dir))
(setq +doom-dashboard-banner-padding '(0 . 0))

(cond ((featurep! :ui modeline) (setq doom-modeline-major-mode-icon t
              doom-modeline-persp-name t)))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq display-line-numbers-type `relative)

(setq doom-fallback-buffer-name "Doom"
      +doom-dashboard-name "Doom")

(setq evil-normal-state-cursor `(box "orange")
      ;; evil-insert-state-cursor `(box "red")
      evil-visual-state-cursor `(hbar)
      evil-operator-state-cursor `(hbar)
      evil-replace-state-cursor `(hbar)
      evil-motion-state-cursor `(box)
      evil-emacs-state-cursor `(box))

(remove-hook 'doom-first-buffer-hook #'global-emojify-mode)

(add-hook 'magit-mode-hook #'emojify-mode)

(defun unprettify ()
  "This function just disable prettify-symbols-mode."
  (global-prettify-symbols-mode -1)
  )
(add-hook 'buffer-list-update-hook 'unprettify)

(defun my-command-error-function (data context caller)
  "Ignore the buffer-read-only, beginning-of-buffer,
end-of-buffer signals; pass the rest to the default handler."
  (when (not (memq (car data) '(buffer-read-only
                                beginning-of-buffer
                                end-of-buffer)))
    (command-error-default-function data context caller)))

(setq command-error-function #'my-command-error-function)

(setq +zen-text-scale 1.0)

(setq org-ellipsis "  ")

(add-hook 'org-mode-hook #'+org-pretty-mode)

(setq org-superstar-headline-bullets-list
      '("α" "β" "γ" "δ" "ε" "ς" "ζ" "η" "θ"))

(custom-set-faces!
  `(outline-1 :slant italic :background ,(doom-color 'bg-alt))
  `(outline-2 :slant italic :background ,(doom-color 'bg-alt))
  `(outline-3 :slant italic :background ,(doom-color 'bg-alt))
  `(outline-4 :slant italic :background ,(doom-color 'bg-alt))
  `(outline-5 :slant italic :background ,(doom-color 'bg-alt))
  `(outline-6 :slant italic :background ,(doom-color 'bg-alt))
  `(outline-7 :slant italic :background ,(doom-color 'bg-alt))
  `(outline-8 :slant italic :background ,(doom-color 'bg-alt))
  `(outline-9 :slant italic :background ,(doom-color 'bg-alt))
  `(org-block-begin-line :slant italic :weight bold :background ,(doom-color 'bg-alt))
  `(org-block-begin-line :slant italic :weight bold :background ,(doom-color 'bg-alt))
  `(org-block :background ,(doom-color 'bg-alt))
  )

(setq org-fontify-quote-and-verse-blocks t)

(add-hook! 'org-mode-hook (hl-line-mode -1))

(map! :leader
      :desc "M-x" "SPC" #'execute-extended-command
      :desc "Find file in project"  "ç"  #'projectile-find-file
      :desc "Manual-entry"  "h ç"  #'man
      (:prefix-map ("i p" . "password")
       :desc "password-generator-simple" "1" #'password-generator-simple
       :desc "password-generator-strong" "2" #'password-generator-strong
       :desc "password-generator-paranoid" "3" #'password-generator-paranoid
       :desc "password-generator-phonetic" "p" #'password-generator-phonetic
       :desc "password-generator-numeric" "n" #'password-generator-numeric
       :desc "password-generator-words" "w" #'password-generator-words
       ))
(map! :n "ç" #'evil-ex)

(sp-local-pair
 `(org-mode)
 "<<" ">>"
 :actions `(insert))
(sp-local-pair
 `(c-mode)
 "<" ">"
 :actions `(insert))

(setq-default indent-tabs-mode t
              tab-width 4)

(require 'emms-setup)
(setq emms-source-file-default-directory "~/Files/Music/")

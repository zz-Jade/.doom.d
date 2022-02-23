;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "zz-Jade"
      user-mail-address "443552678@qq.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight)
;;list of my favorite theme
;;doom-solarized-light

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/orgfile/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
(setq doom-font (font-spec :family "Sarasa Mono SC Nerd" :size 22)
      doom-variable-pitch-font (font-spec :family "Sarasa Mono SC Nerd")
      doom-unicode-font (font-spec :family "Sarasa Mono SC Nerd")
      doom-big-font (font-spec :family "Sarasa Mono SC Nerd" :size 24))
(fcitx-aggressive-setup)
(add-hook! 'org-mode-hook (company-mode -1))
(add-hook! 'org-capture-mode-hook (company-mode -1))
(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)
(eval-after-load "org"
  '(require 'ox-gfm nil t))
;; Drag-and-drop to `dired`
(setq projectile-project-search-path '("/home/jadezz/graphics"))
;; setting font
(setq default-directory "~"
      dired-dwim-target t
      fcitx-use-dbus t
      company-show-quick-access t
      grip-github-user "zz-Jade"
      grip-github-password "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"
      grip-update-after-change nil
      yas--default-user-snippets-dir "/home/jadezz/.doom.d/snippets"
      plantuml-default-exec-mode 'executable)
;;------------------------------------------------------------------------------------------------
;;org config
(use-package! org-superstar
  :hook
  (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-headline-bullets-list '("Ⓐ" "Ⓑ" "Ⓒ" "Ⓓ" "Ⓔ"))
)
;;some interesting utf-8
;;8226:dot 42:* 43:+ 45:- 10148:➤ 8211:long -
;;8747:∫ 8748:double of 8747 8749:triple of 8747
(setq org-ellipsis " ▾ "
      org-tags-column -80
      org-hide-emphasis-markers t
      org-fontify-done-headline t
      org-hide-leading-stars t
      org-pretty-entities t
      org-odd-levels-only t
      org-startup-folded t
      org-return-follows-link t
      org-startup-with-inline-images t
      org-startup-with-latex-preview t
      org-image-actual-width 500
      prettify-symbols-unprettify-at-point 'right-edge
      org-superstar-item-bullet-alist '((45 . 8729)
                                        (43 . 10148)
                                        (42 . 9702))
      org-superstar-special-todo-items t
      org-superstar-todo-bullet-alist '(("TODO" . 128339)
                                        ("DONE" . 9989)))
(setq-default prettify-symbols-alist '(("#+BEGIN_SRC" . "")
                                       ("#+END_SRC" . "")
                                       ("#+begin_src" . "")
                                       ("#+end_src" . "")
                                       ("#+TITLE:" . "")
                                       ("#+AUTHOR:" . 9999)
                                       ("#+STARTUP:" . 10140)
                                       ("=>" . "➔")))
(add-hook 'org-mode-hook 'prettify-symbols-mode)
(after! org
  (set-face-attribute 'org-level-1 nil
                      :foreground nil
                      :background nil
                      :height 1.5
                      :weight 'normal)
  (set-face-attribute 'org-level-2 nil
                      :foreground nil
                      :background nil
                      :height 1.3
                      :weight 'normal)
  (set-face-attribute 'org-level-3 nil
                      :foreground nil
                      :background nil
                      :height 1.1
                      :weight 'normal)
  (set-face-attribute 'org-level-4 nil
                      :foreground nil
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-document-title nil
                      :foreground nil
                      :background nil
                      :height 1.5
                      :weight 'bold)
  (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕"))
  (add-to-list
   'org-src-lang-modes '("plantuml" . plantuml)))
(org-babel-do-load-languages 'org-babel-load-languages
                             '((dot . t)))


(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (org-display-inline-images)
  (setq filename
        (concat
         (make-temp-name
          (concat (file-name-nondirectory (buffer-file-name))
                  "_imgs/"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
(unless (file-exists-p (file-name-directory filename))
    (make-directory (file-name-directory filename)))
; take screenshot
  (if (eq system-type 'gnu/linux)
      (call-process "import" nil nil nil filename))
                               ; insert into file if correctly taken
  (if (file-exists-p filename)
      (insert (concat "[[file:" filename "]]")))
  (org-display-inline-images))
(global-set-key (kbd "C-c s c") 'my-org-screenshot)
;;------------------------------------------------------------------------------------------------
(setq ivy-posframe-display-functions-alist
      '((swiper          . ivy-posframe-display-at-frame-center)
       (complete-symbol . ivy-posframe-display-at-point)
       (counsel-M-x     . ivy-posframe-display-at-frame-center)
       (counsel-find-file . ivy-posframe-display-at-frame-center)
       (ivy-switch-buffer . ivy-posframe-display-at-frame-center)
       (t        . ivy-posframe-display)))
(ivy-posframe-mode 1)
;;(cnfonts-mode 1)
;; (add-to-list 'load-path "~/.doom.d/lisp/emacs-application-framework")

(global-unset-key (kbd "C-x C-z"))
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))
(require 'dap-cpptools)
(setq debug-on-error t)
(defun org-mode-visual-fill ()
  (interactive)
  (display-line-numbers-mode -1)
  (visual-fill-column-mode -1)
  (setq visual-fill-column-width 60)
  (visual-fill-column-mode 1))

(add-hook! 'org-mode-hook (org-mode-visual-fill))
(setq visual-fill-column-width 90
      visual-fill-column-center-text t)
(global-visual-fill-column-mode 1)
;;(add-hook 'markdown-mode-hook #'grip-mode)
;;(add-hook 'org-mode-hook #'grip-mode)
(set-frame-parameter (selected-frame) 'alpha '(70 . 80))
(add-to-list 'default-frame-alist '(alpha . (70 . 80)))
(nyan-mode 1)
(nyan-start-animation)

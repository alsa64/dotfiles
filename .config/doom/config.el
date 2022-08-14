;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

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
;;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-nord-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


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

;; https://github.com/doomemacs/doomemacs/issues/2688
;; Disable explicit confirmation before quitting emacs
;; "Really quit emacs?"
;; Yes otherwise I wouldn't have told it to do so.
(setq confirm-kill-emacs nil)

;; deft configuration
(setq deft-directory "~/Documents/org"
      deft-extensions '("org" "txt" "md")
      deft-recursive t)
;; org mode
(setq org-directory "~/Documents/org/")

;; org-journal
(setq org-journal-dir "~/Documents/org/journal/"
      org-journal-date-prefix "#+title: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org")

;; org-roam
(setq org-roam-directory "~/Documents/org/roam/")

;; Set nano theme
(defun shaunsingh/apply-nano-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (nano-light))
    ('dark (nano-dark))))

(use-package! nano-theme
  :hook (after-init . nano-light)
  :config
  ;; If emacs has been built with system appearance detection
  ;; add a hook to change the theme to match the system
  ;; (if (boundp 'ns-system-appearance-change-functions)
  ;;     (add-hook 'ns-system-appearance-change-functions #'shaunsingh/apply-nano-theme))
  ;; Now to add some missing faces
  (custom-set-faces
   `(flyspell-incorrect ((t (:underline (:color ,nano-light-salient :style line)))))
   `(flyspell-duplicate ((t (:underline (:color ,nano-light-salient :style line)))))

   `(git-gutter:modified ((t (:foreground ,nano-light-salient))))
   `(git-gutter-fr:added ((t (:foreground ,nano-light-popout))))
   `(git-gutter-fr:modified ((t (:foreground ,nano-light-salient))))

   `(lsp-ui-doc-url:added ((t (:background ,nano-light-highlight))))
   `(lsp-ui-doc-background:modified ((t (:background ,nano-light-highlight))))

   `(vterm-color-red ((t (:foreground ,nano-light-critical))))
   `(vterm-color-blue ((t (:foreground ,nano-light-salient))))
   `(vterm-color-green ((t (:foreground ,nano-light-popout))))
   `(vterm-color-yellow ((t (:foreground ,nano-light-popout))))
   `(vterm-color-magenta ((t (:foreground ,nano-light-salient))))

   `(scroll-bar ((t (:background ,nano-light-background))))

   `(avy-lead-face-1 ((t (:foreground ,nano-light-subtle))))
   `(avy-lead-face ((t (:foreground ,nano-light-popout :weight bold))))
   `(avy-lead-face-0 ((t (:foreground ,nano-light-salient :weight bold))))))

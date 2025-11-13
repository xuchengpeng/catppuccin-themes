;;; catppuccin-themes.el --- Catppuccin themes. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(unless (require 'modus-themes nil t)
  (require-theme 'modus-themes))
(eval-when-compile (require 'subr-x))

(defgroup catppuccin-themes ()
  "Catppuccin themes."
  :group 'faces
  :group 'modus-themes
  :prefix "catppuccin-themes-"
  :tag "Catppuccin Themes")

(defconst catppuccin-themes-light-themes
  '(catppuccin-latte)
  "List of symbols with the light Catppuccin themes.")

(defconst catppuccin-themes-dark-themes
  '(catppuccin-frappe catppuccin-macchiato catppuccin-mocha)
  "List of symbols with the dark Catppuccin themes.")

(defvaralias 'catppuccin-themes-collection 'catppuccin-themes-items
  "Alias of `catppuccin-themes-items'.")

(defconst catppuccin-themes-items
  (append catppuccin-themes-light-themes catppuccin-themes-dark-themes)
  "Symbols of the Catppuccin themes.")

(defconst catppuccin-themes-common-palette-mappings
  '(
    ;; Basic values
    (bg-main base)
    (bg-dim crust)
    (fg-main text)
    (fg-dim subtext0)
    (fg-alt subtext1)
    (bg-active surface1)
    (bg-inactive surface0)
    (border overlay0)

    ;; Common accent foregrounds

    (red-warmer      red)
    (red-cooler      red)
    (red-faint       red)
    (red-intense     red)
    (green-warmer    green)
    (green-cooler    green)
    (green-faint     green)
    (green-intense   green)
    (yellow-warmer   yellow)
    (yellow-cooler   yellow)
    (yellow-faint    yellow)
    (yellow-intense  yellow)
    (blue-warmer     blue)
    (blue-cooler     blue)
    (blue-faint      blue)
    (blue-intense    blue)
    (magenta         mauve)
    (magenta-warmer  mauve)
    (magenta-cooler  mauve)
    (magenta-faint   mauve)
    (magenta-intense mauve)
    (cyan            teal)
    (cyan-warmer     teal)
    (cyan-cooler     teal)
    (cyan-faint      teal)
    (cyan-intense    teal)

    ;; Common accent backgrounds

    (bg-magenta-intense bg-mauve-intense)
    (bg-cyan-intense bg-teal-intense)
    (bg-magenta-subtle bg-mauve-subtle)
    (bg-cyan-subtle bg-teal-subtle)
    (bg-magenta-nuanced bg-mauve-nuanced)
    (bg-cyan-nuanced bg-teal-nuanced)

    ;; Graphs

    (bg-graph-red-0 bg-red-intense)
    (bg-graph-red-1 bg-red-subtle)
    (bg-graph-green-0 bg-green-intense)
    (bg-graph-green-1 bg-green-subtle)
    (bg-graph-yellow-0 bg-yellow-intense)
    (bg-graph-yellow-1 bg-yellow-subtle)
    (bg-graph-blue-0 bg-blue-intense)
    (bg-graph-blue-1 bg-blue-subtle)
    (bg-graph-magenta-0 bg-mauve-intense)
    (bg-graph-magenta-1 bg-mauve-subtle)
    (bg-graph-cyan-0 bg-teal-intense)
    (bg-graph-cyan-1 bg-teal-subtle)

    ;; Special purpose

    (bg-completion bg-sky-nuanced)
    (bg-hover highlight)
    (bg-hover-secondary surface1)
    (bg-hl-line highlight)
    (bg-region surface2)
    (fg-region text)

    (bg-mode-line-active crust)
    (fg-mode-line-active text)
    (border-mode-line-active bg-mode-line-active)
    (bg-mode-line-inactive mantle)
    (fg-mode-line-inactive overlay1)
    (border-mode-line-inactive bg-mode-line-inactive)

    (modeline-err red)
    (modeline-warning yellow)
    (modeline-info blue)

    (bg-tab-bar mantle)
    (bg-tab-current base)
    (bg-tab-other surface0)

    (fg-line-number-inactive overlay1)
    (fg-line-number-active lavender)
    (bg-line-number-inactive unspecified)
    (bg-line-number-active unspecified)

    ;; Diffs

    (bg-added bg-green-subtle)
    (bg-added-faint bg-green-nuanced)
    (bg-added-refine bg-green-intense)
    (bg-added-fringe bg-green-intense)
    (fg-added text)
    (fg-added-intense text)

    (bg-changed bg-yellow-subtle)
    (bg-changed-faint bg-yellow-nuanced)
    (bg-changed-refine bg-yellow-intense)
    (bg-changed-fringe bg-yellow-intense)
    (fg-changed text)
    (fg-changed-intense text)

    (bg-removed bg-red-subtle)
    (bg-removed-faint bg-red-nuanced)
    (bg-removed-refine bg-red-intense)
    (bg-removed-fringe bg-red-intense)
    (fg-removed text)
    (fg-removed-intense text)

    (bg-diff-context highlight)

    ;; Paren match

    (bg-paren-match bg-sky-intense)
    (bg-paren-expression bg-pink-intense)
    (underline-paren-match unspecified)

    ;; General mappings

    (cursor rosewater)
    (fringe unspecified)

    ;; Code mappings

    (builtin red)
    (comment overlay2)
    (constant peach)
    (docstring subtext0)
    (fnname blue)
    (fnname-call blue)
    (keyword mauve)
    (preprocessor yellow)
    (property blue)
    (rx-backslash red)
    (rx-construct red)
    (string green)
    (type yellow)
    (variable text)
    (variable-use text)

    ;; Link mappings

    (fg-link-visited lavender)
    (underline-link-visited lavender)

    ;; Prose mappings

    (fg-prose-code green)
    (fg-prose-macro rosewater)
    (fg-prose-verbatim pink)
    (prose-table-formula pink)
    (prose-tag blue)

    ;; Heading mappings

    (fg-heading-0 sky)
    (fg-heading-1 red)
    (fg-heading-2 peach)
    (fg-heading-3 yellow)
    (fg-heading-4 green)
    (fg-heading-5 sapphire)
    (fg-heading-6 lavender)
    (fg-heading-7 mauve)
    (fg-heading-8 maroon))
  "Common palette mappings for the Catppuccin themes.")

(defconst catppuccin-themes-with-properties
  '((catppuccin-latte catppuccin-themes "Catppuccin latte." light modus-operandi-palette catppuccin-latte-palette catppuccin-latte-palette-overrides)
    (catppuccin-frappe catppuccin-themes "Catppuccin frappe." dark modus-vivendi-palette catppuccin-frappe-palette catppuccin-frappe-palette-overrides)
    (catppuccin-macchiato catppuccin-themes "Catppuccin macchiato." dark modus-vivendi-palette catppuccin-macchiato-palette catppuccin-macchiato-palette-overrides)
    (catppuccin-mocha catppuccin-themes "Catppuccin mocha." dark modus-vivendi-palette catppuccin-mocha-palette catppuccin-mocha-palette-overrides)))

(defvar catppuccin-themes--declared-p nil)

(defun catppuccin-themes-declare-themes ()
  "Declare the Catppuccin themes."
  (unless catppuccin-themes--declared-p
    (dolist (theme catppuccin-themes-with-properties)
      (apply #'modus-themes-declare theme)
      (modus-themes-register (car theme)))
    (setq catppuccin-themes--declared-p t)))

(catppuccin-themes-declare-themes)

;;;###autoload
(define-minor-mode catppuccin-themes-take-over-modus-themes-mode
  "When enabled, all Modus themes commands consider only Catppuccin themes.
Alternatively, use the commands `catppuccin-themes-rotate',
`catppuccin-themes-select', `catppuccin-themes-load-random',
`catppuccin-themes-load-random-dark', `catppuccin-themes-load-random-light',
`catppuccin-themes-list-colors', `catppuccin-themes-list-colors-current'.
They are all designed to only consider Catppuccin themes."
  :global t
  :init-value nil)

(cl-defmethod modus-themes-get-themes (&context (catppuccin-themes-take-over-modus-themes-mode (eql t)))
  "Return list of Catppuccin themes, per `catppuccin-themes-take-over-modus-themes-mode'."
  (if-let* ((themes (modus-themes-get-all-known-themes 'catppuccin-themes))
            (sorted-a-z (sort themes #'string-lessp))
            (sorted-light-dark (modus-themes-sort sorted-a-z 'light)))
      sorted-light-dark
    catppuccin-themes-items))

;;;###autoload (autoload 'catppuccin-themes-toggle "catppuccin-themes")
(modus-themes-define-derivative-command catppuccin-themes toggle)

;;;###autoload (autoload 'catppuccin-themes-rotate "catppuccin-themes")
(modus-themes-define-derivative-command catppuccin-themes rotate)

;;;###autoload (autoload 'catppuccin-themes-select "catppuccin-themes")
(modus-themes-define-derivative-command catppuccin-themes select)

;;;###autoload (autoload 'catppuccin-themes-load-random "catppuccin-themes")
(modus-themes-define-derivative-command catppuccin-themes load-random)

;;;###autoload (autoload 'catppuccin-themes-load-random-dark "catppuccin-themes")
(modus-themes-define-derivative-command catppuccin-themes load-random-dark)

;;;###autoload (autoload 'catppuccin-themes-load-random-light "catppuccin-themes")
(modus-themes-define-derivative-command catppuccin-themes load-random-light)

;;;###autoload (autoload 'catppuccin-themes-list-colors "catppuccin-themes")
(modus-themes-define-derivative-command catppuccin-themes list-colors)

;;;###autoload (autoload 'catppuccin-themes-list-colors-current "catppuccin-themes")
(modus-themes-define-derivative-command catppuccin-themes list-colors-current)

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (add-to-list 'custom-theme-load-path dir)))

(provide 'catppuccin-themes)
;;; catppuccin-themes.el ends here

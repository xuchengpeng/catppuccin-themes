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
    (bg-dim surface0)
    (fg-main text)
    (fg-dim subtext0)
    (fg-alt subtext1)
    (bg-active surface2)
    (bg-inactive surface1)
    (border overlay0)

    ;; Special purpose

    (bg-completion bg-lavender-intense)
    (bg-hover highlight)
    (bg-hover-secondary surface1)
    (bg-hl-line highlight)
    (bg-region surface2)
    (fg-region text)

    (bg-mode-line-active crust)
    (fg-mode-line-active text)
    (border-mode-line-active crust)
    (bg-mode-line-inactive mantle)
    (fg-mode-line-inactive overlay1)
    (border-mode-line-inactive mantle)

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

    (bg-added added)
    (bg-added-faint added-refine)
    (bg-added-refine added-refine)
    (bg-added-fringe added-refine)
    (fg-added text)
    (fg-added-intense text)

    (bg-changed changed)
    (bg-changed-faint changed-refine)
    (bg-changed-refine changed-refine)
    (bg-changed-fringe changed-refine)
    (fg-changed text)
    (fg-changed-intense text)

    (bg-removed removed)
    (bg-removed-faint removed-refine)
    (bg-removed-refine removed-refine)
    (bg-removed-fringe removed-refine)
    (fg-removed text)
    (fg-removed-intense text)

    (bg-diff-context highlight)

    ;; Paren match

    (bg-paren-match bg-sky-intense)
    (bg-paren-expression bg-pink-intense)
    (underline-paren-match unspecified)

    ;; General mappings

    (cursor rosewater)
    (keybind blue)
    (name mauve)
    (identifier yellow)
    (fringe unspecified)

    (err red)
    (warning yellow)
    (info teal)

    (underline-err red)
    (underline-warning yellow)
    (underline-note green)

    (bg-prominent-err bg-red-intense)
    (fg-prominent-err text)
    (bg-prominent-warning bg-yellow-intense)
    (fg-prominent-warning text)
    (bg-prominent-note bg-sky-intense)
    (fg-prominent-note text)

    (bg-active-argument bg-yellow-intense)
    (fg-active-argument text)
    (bg-active-value bg-sky-intense)
    (fg-active-value text)

    ;; Code mappings

    (builtin red)
    (comment overlay2)
    (constant peach)
    (docstring subtext0)
    (docmarkup peach)
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

    ;; Accent mappings

    (accent-0 blue)
    (accent-1 mauve)
    (accent-2 sky)
    (accent-3 red)

    ;; Completion mappings

    (fg-completion-match-0 blue)
    (fg-completion-match-1 mauve)
    (fg-completion-match-2 sky)
    (fg-completion-match-3 red)

    ;; Date mappings

    (date-common teal)
    (date-deadline red)
    (date-deadline-subtle red)
    (date-event fg-alt)
    (date-holiday red)
    (date-holiday-other blue)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow)
    (date-weekday teal)
    (date-weekend mauve)

    ;; Link mappings

    (fg-link blue)
    (underline-link blue)
    (fg-link-symbolic sky)
    (underline-link-symbolic sky)
    (fg-link-visited lavender)
    (underline-link-visited lavender)

    ;; Mail mappings

    (mail-cite-0 blue)
    (mail-cite-1 yellow)
    (mail-cite-2 sapphire)
    (mail-cite-3 red)
    (mail-part sky)
    (mail-recipient blue)
    (mail-subject mauve)
    (mail-other sapphire)

    ;; Mark mappings

    (bg-mark-delete bg-red-intense)
    (fg-mark-delete text)
    (bg-mark-select bg-sapphire-intense)
    (fg-mark-select text)
    (bg-mark-other bg-yellow-intense)
    (fg-mark-other text)

    ;; Prompt mappings

    (fg-prompt teal)

    ;; Prose mappings

    (fg-prose-code green)
    (fg-prose-macro pink)
    (fg-prose-verbatim pink)
    (prose-done green)
    (prose-todo red)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula pink)
    (prose-tag blue)

    ;; Search mappings

    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-sky-intense)
    (bg-search-static bg-mauve-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-blue-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-intense)
    (bg-search-rx-group-3 bg-mauve-intense)

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

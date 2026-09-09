;;; catppuccin-themes.el --- Catppuccin themes. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'seq)
(eval-when-compile (require 'subr-x))

(defgroup catppuccin-themes nil
  "Catppuccin themes."
  :group 'faces)

(defcustom catppuccin-themes-to-toggle '(catppuccin-latte catppuccin-mocha)
  "Specify two themes for the `catppuccin-themes-toggle' command."
  :group 'catppuccin-themes)

(defcustom catppuccin-themes-after-load-theme-hook nil
  "Hook that runs after loading a Catppuccin theme."
  :type 'hook
  :group 'catppuccin-themes)

;;;###autoload
(defun catppuccin-themes-load-theme (theme)
  "Load THEME while disabling other themes and return THEME."
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme theme :no-confirm)
  (run-hooks 'catppuccin-themes-after-load-theme-hook)
  theme)

;;;###autoload
(defun catppuccin-themes-toggle ()
  "Toggle between the tow `catppuccin-themes-to-toggle'."
  (interactive)
  (pcase-let ((`(,one ,two) catppuccin-themes-to-toggle))
    (if (eq (car custom-enabled-themes) one)
        (catppuccin-themes-load-theme two)
      (catppuccin-themes-load-theme one))))

;;;###autoload
(defmacro catppuccin-themes-define-theme (name background-mode &optional description)
  "Define theme with NAME, BACKGROUND-MODE and optional DESCRIPTION."
  (declare (indent 0))
  (unless (memq background-mode '(light dark))
    (error "The BACKGROUND-MODE must be either `light' or `dark'"))
  (if-let* ((palette (symbol-value (intern (format "%s-palette" name)))))
      (let ((theme-exists-p (get name 'theme-feature)))
        `(progn
           ,@(unless theme-exists-p
               (list `(custom-declare-theme
                       ',name 'catppuccin-themes
                       ,(or description (format "Catppuccin %s theme." background-mode))
                       (list :kind 'color-scheme :background-mode ',background-mode :family 'catppuccin))))
           (let ,palette
             (custom-theme-set-faces
              ',name
              ;; basic faces
              `(default ((t :foreground ,text :background ,base)))
              '(bold ((t :weight bold)))
              '(italic ((t :slant italic)))
              '(bold-italic ((t :inherit (bold italic))))
              '(underline ((t :underline t)))
              `(cursor ((t :background ,rosewater)))
              `(fringe ((t :background ,base :foreground ,surface2)))
              `(menu ((t :background ,mantle :foreground ,text)))
              `(scroll-bar ((t :background ,mantle :foreground ,subtext1)))
              `(tool-bar ((t :background ,mantle :foreground ,text)))
              `(button ((t :foreground ,blue :underline t)))
              `(link ((t :foreground ,blue :underline t)))
              `(link-visited ((t :foreground ,lavender :underline t)))
              `(shadow ((t :foreground ,overlay1)))
              `(minibuffer-prompt ((t :foreground ,blue :weight bold)))
              `(minibuffer-nonselected ((t :inverse-video t)))
              `(escape-glyph ((t :foreground ,pink)))
              `(homoglyph ((t :foreground ,pink)))
              `(region ((t :background ,surface1 :extend t)))
              `(secondary-selection ((t :background ,surface1 :extend t)))
              `(trailing-whitespace ((t :background ,red)))
              `(border ((t :background ,overlay0 :foreground ,text)))
              `(vertical-border ((t :foreground ,surface1)))
              `(child-frame-border ((t :background ,overlay0 :foreground ,text)))
              `(tooltip ((t :background ,surface0 :foreground ,text)))
              `(highlight ((t :background ,surface1 :foreground ,text)))
              `(error ((t :foreground ,red :weight bold)))
              `(warning ((t :foreground ,yellow :weight bold)))
              `(success ((t :foreground ,green :weight bold)))
              `(help-argument-name ((t :foreground ,text :slant italic)))
              `(help-key-binding ((t :foreground ,blue :weight bold)))

              ;; font-lock
              `(font-lock-bracket-face ((t :foreground ,overlay2)))
              `(font-lock-builtin-face ((t :foreground ,red)))
              `(font-lock-comment-face ((t :foreground ,overlay2 :slant italic)))
              '(font-lock-comment-delimiter-face ((t :inherit font-lock-comment-face)))
              `(font-lock-constant-face ((t :foreground ,peach)))
              `(font-lock-delimiter-face ((t :foreground ,overlay2)))
              `(font-lock-escape-face ((t :foreground ,pink)))
              `(font-lock-doc-face ((t :foreground ,overlay2)))
              `(font-lock-doc-markup-face ((t :foreground ,subtext0)))
              `(font-lock-function-name-face ((t :foreground ,blue)))
              `(font-lock-function-call-face ((t :foreground ,blue)))
              `(font-lock-keyword-face ((t :foreground ,mauve)))
              `(font-lock-negation-char-face ((t :foreground ,sky)))
              `(font-lock-misc-punctuation-face ((t :foreground ,overlay2)))
              `(font-lock-number-face ((t :foreground ,peach)))
              `(font-lock-operator-face ((t :foreground ,sky)))
              `(font-lock-preprocessor-face ((t :foreground ,pink)))
              `(font-lock-property-name-face ((t :foreground ,teal)))
              `(font-lock-property-use-face ((t :foreground ,teal)))
              `(font-lock-punctuation-face ((t :foreground ,text)))
              `(font-lock-regexp-grouping-backslash ((t :foreground ,pink :weight bold)))
              `(font-lock-regexp-grouping-construct ((t :foreground ,pink :weight bold)))
              `(font-lock-string-face ((t :foreground ,green)))
              `(font-lock-type-face ((t :foreground ,yellow)))
              `(font-lock-variable-name-face ((t :foreground ,text)))
              `(font-lock-variable-use-face ((t :foreground ,text)))
              `(font-lock-warning-face ((t :foreground ,yellow)))

              ;; ansi-color
              `(ansi-color-black ((t :background ,surface1 :foreground ,surface1)))
              `(ansi-color-blue ((t :background ,blue :foreground ,blue)))
              '(ansi-color-bold ((t :inherit bold)))
              `(ansi-color-cyan ((t :background ,teal :foreground ,teal)))
              `(ansi-color-green ((t :background ,green :foreground ,green)))
              `(ansi-color-magenta ((t :background ,pink :foreground ,pink)))
              `(ansi-color-red ((t :background ,red :foreground ,red)))
              `(ansi-color-white ((t :background ,subtext0 :foreground ,subtext0)))
              `(ansi-color-yellow ((t :background ,yellow :foreground ,yellow)))
              `(ansi-color-bright-black ((t :background ,surface2 :foreground ,surface2)))
              `(ansi-color-bright-blue ((t :background ,blue :foreground ,blue)))
              `(ansi-color-bright-cyan ((t :background ,teal :foreground ,teal)))
              `(ansi-color-bright-green ((t :background ,green :foreground ,green)))
              `(ansi-color-bright-magenta ((t :background ,pink :foreground ,pink)))
              `(ansi-color-bright-red ((t :background ,red :foreground ,red)))
              `(ansi-color-bright-white ((t :background ,subtext1 :foreground ,subtext1)))
              `(ansi-color-bright-yellow ((t :background ,yellow :foreground ,yellow)))

              ;; ace-window
              `(aw-background-face ((t :foreground ,overlay2)))
              `(aw-key-face ((t :foreground ,red :weight bold)))
              `(aw-leading-char-face ((t :foreground ,red :weight bold :height 1.5)))
              `(aw-minibuffer-leading-char-face ((t :foreground ,red :weight bold)))
              `(aw-mode-line-face ((t :foreground ,blue :weight bold)))

              ;; avy
              `(avy-background-face ((t :foreground ,overlay2)))
              `(avy-goto-char-timer-face ((t :background ,red :foreground ,base)))
              `(avy-lead-face ((t :background ,red :foreground ,base :weight bold)))
              `(avy-lead-face-0 ((t  :background ,blue :foreground ,base :weight bold)))
              `(avy-lead-face-1 ((t :background ,overlay1 :foreground ,base :weight bold)))
              `(avy-lead-face-2 ((t :background ,teal :foreground ,base :weight bold)))

              ;; bookmark
              `(bookmark-face ((t :foreground ,yellow)))
              '(bookmark-menu-bookmark ((t :inherit bold)))

              ;; calendar and diary
              `(calendar-today ((t :foreground ,blue :weight bold :underline t)))
              `(calendar-weekend-header ((t :foreground ,red)))
              `(calendar-weekday-header ((t :foreground ,teal)))
              `(calendar-month-header ((t :foreground ,mauve :weight bold)))
              `(holiday ((t :foreground ,peach)))
              `(diary ((t :foreground ,yellow)))

              ;; compilation
              `(compilation-error ((t :foreground ,red :weight bold)))
              `(compilation-warning ((t :foreground ,yellow :weight bold)))
              `(compilation-info ((t :foreground ,teal)))
              `(compilation-mode-line-exit ((t :foreground ,green :weight bold)))
              `(compilation-mode-line-fail ((t :foreground ,red :weight bold)))
              `(compilation-mode-line-run ((t :foreground ,blue :weight bold)))
              `(compilation-line-number ((t :foreground ,overlay1)))
              `(compilation-column-number ((t :foreground ,overlay1)))

              ;; completions
              `(completions-annotations ((t :foreground ,overlay2 :slant italic)))
              `(completions-common-part ((t :foreground ,blue :weight bold)))
              `(completions-first-difference ((t :foreground ,peach)))
              `(completions-highlight ((t :background ,surface0)))
              `(completions-group-title ((t :foreground ,mauve :weight bold :slant italic)))
              `(completions-group-separator ((t :foreground ,overlay2 :strike-through t)))

              ;; corfu
              `(corfu-default ((t :foreground ,text :background ,mantle)))
              `(corfu-current ((t :foreground ,text :background ,surface0 :weight bold)))
              `(corfu-bar ((t :background ,surface2)))
              `(corfu-border ((t :background ,surface0)))
              `(corfu-annotations ((t :foreground ,overlay2)))
              `(corfu-deprecated ((t :foreground ,overlay2 :strike-through t)))
              `(corfu-popupinfo ((t :foreground ,text :background ,mantle)))

              ;; custom (M-x customize)
              `(custom-variable-tag ((t (:foreground ,blue :weight bold))))
              `(custom-group-tag ((t (:foreground ,blue :weight bold :height 1.2))))
              `(custom-group-tag-1 ((t (:foreground ,mauve :weight bold :height 1.2))))
              `(custom-state ((t (:foreground ,green))))
              `(custom-button ((t (:foreground ,text :background ,surface0 :box (:line-width 2 :color ,surface1 :style released-button)))))
              `(custom-button-mouse ((t (:foreground ,text :background ,surface1 :box (:line-width 2 :color ,surface1 :style released-button)))))
              `(custom-button-pressed ((t (:foreground ,text :background ,surface0 :box (:line-width 2 :color ,surface1 :style pressed-button)))))
              `(custom-changed ((t :foreground ,base :background ,yellow)))
              `(custom-comment ((t :foreground ,overlay2)))
              '(custom-comment-tag ((t :inherit custom-comment)))
              `(custom-invalid ((t :foreground ,red :strike-through t)))
              '(custom-modified ((t :inherit custom-changed)))
              '(custom-themed ((t :inherit custom-changed)))
              '(custom-rogue ((t :inherit custom-invalid)))
              `(custom-set ((t :foreground ,teal)))

              ;; diff
              `(diff-added ((t :background ,bg-added)))
              `(diff-changed ((t :background ,bg-changed)))
              '(diff-changed-unspecified ((t :inherit diff-changed)))
              `(diff-removed ((t :background ,bg-removed)))
              `(diff-indicator-added ((t :foreground ,green)))
              `(diff-indicator-changed ((t :foreground ,blue)))
              `(diff-indicator-removed ((t :foreground ,red)))
              `(diff-refine-added ((t :background ,bg-added-refine)))
              `(diff-refine-changed ((t :background ,bg-changed-refine)))
              `(diff-refine-removed ((t :background ,bg-removed-refine)))
              '(diff-context (()))
              `(diff-error ((t :foreground ,maroon :weight bold)))
              `(diff-file-header ((t :foreground ,blue :weight bold :extend t)))
              `(diff-function ((t :background ,surface1)))
              `(diff-header ((t :foreground ,blue :extend t)))
              `(diff-hunk-header ((t :foreground ,peach :background ,mantle :extend t)))
              '(diff-index ((t :slant italic)))
              `(diff-nonexistent ((t :foreground ,overlay2)))

              ;; diff-hl
              `(diff-hl-change ((t :foreground ,blue :background ,bg-changed-refine)))
              `(diff-hl-delete ((t :foreground ,red :background ,bg-removed-refine)))
              `(diff-hl-insert ((t :foreground ,green :background ,bg-added-refine)))
              `(diff-hl-reverted-hunk-highlight ((t :foreground ,base :background ,text)))

              ;; dired
              `(dired-directory ((t :foreground ,blue :weight bold)))
              `(dired-flagged ((t :foreground ,red)))
              `(dired-header ((t :foreground ,mauve :weight bold)))
              `(dired-ignored ((t :foreground ,overlay2)))
              `(dired-mark ((t :foreground ,peach :weight bold)))
              `(dired-marked ((t :foreground ,mauve :weight bold)))
              `(dired-perm-write ((t :foreground ,subtext1)))
              `(dired-symlink ((t :foreground ,sky)))
              `(dired-warning ((t :foreground ,yellow :weight bold)))
              `(dired-broken-symlink ((t :foreground ,red :weight bold)))

              ;; ediff
              `(ediff-current-diff-A ((t :background ,bg-removed :extend t)))
              `(ediff-current-diff-B ((t :background ,bg-added :extend t)))
              `(ediff-current-diff-C ((t :background ,bg-changed :extend t)))
              `(ediff-current-diff-Ancestor ((t :background ,surface0 :extend t)))
              `(ediff-fine-diff-A ((t :foreground ,text :background ,bg-removed-refine :extend t)))
              `(ediff-fine-diff-B ((t :foreground ,text :background ,bg-added-refine :extend t)))
              `(ediff-fine-diff-C ((t :foreground ,text :background ,bg-changed-refine :extend t)))
              `(ediff-fine-diff-Ancestor ((t :foreground ,text :background ,surface0 :extend t)))
              `(ediff-even-diff-A ((t :background ,surface0 :extend t)))
              `(ediff-even-diff-B ((t :background ,surface0 :extend t)))
              `(ediff-even-diff-C ((t :background ,surface0 :extend t)))
              `(ediff-even-diff-Ancestor ((t :background ,surface0 :extend t)))
              `(ediff-odd-diff-A ((t :background ,surface0 :extend t)))
              `(ediff-odd-diff-B ((t :background ,surface0 :extend t)))
              `(ediff-odd-diff-C ((t :background ,surface0 :extend t)))
              `(ediff-odd-diff-Ancestor ((t :background ,surface0 :extend t)))

              ;; eglot
              `(eglot-highlight-symbol-face ((t :background ,surface0 :weight bold)))
              `(eglot-inlay-hint-face ((t :foreground ,overlay1 :height 0.9)))
              `(eglot-diagnostic-tag-unnecessary-face ((t :foreground ,overlay2 :underline (:style wave :color ,overlay1))))
              `(eglot-diagnostic-tag-deprecated-face ((t :foreground ,overlay2 :strike-through ,overlay1)))
              `(eglot-mode-line ((t :foreground ,blue)))

              ;; elfeed
              `(elfeed-log-date-face ((t :foreground ,sky)))
              `(elfeed-log-debug-level-face ((t :foreground ,text)))
              `(elfeed-log-error-level-face ((t :foreground ,red :weight bold)))
              `(elfeed-log-warn-level-face ((t :foreground ,yellow :weight bold)))
              `(elfeed-log-info-level-face ((t :foreground ,teal)))
              `(elfeed-search-date-face ((t :foreground ,sky)))
              `(elfeed-search-feed-face ((t :foreground ,blue)))
              `(elfeed-search-filter-face ((t :foreground ,mauve :weight bold)))
              `(elfeed-search-last-update-face ((t :foreground ,subtext0)))
              `(elfeed-search-tag-face ((t :foreground ,teal)))
              `(elfeed-search-title-face ((t :foreground ,subtext1)))
              '(elfeed-search-unread-count-face (( )))
              `(elfeed-search-unread-title-face ((t :foreground ,text :weight bold)))
              `(elfeed-show-header-face ((t :foreground ,mauve)))
              `(elfeed-show-title-face ((t :foreground ,text :weight bold)))
              `(elfeed-show-author-face ((t :foreground ,text :weight bold)))
              `(elfeed-show-date-face ((t :foreground ,sky)))
              `(elfeed-show-feed-face ((t :foreground ,blue)))
              `(elfeed-show-tags-face ((t :foreground ,teal)))

              ;; elisp semantic highlighting
              '(elisp-binding-variable (( )))
              '(elisp-bound-variable (( )))
              '(elisp-charset (( )))
              '(elisp-coding (( )))
              '(elisp-completion-category (( )))
              `(elisp-condition ((t :foreground ,red)))
              '(elisp-constant (( )))
              '(elisp-face (( )))
              '(elisp-free-variable (( )))
              '(elisp-group (( )))
              '(elisp-icon (( )))
              `(elisp-major-mode-name ((t :foreground ,blue)))
              `(elisp-non-local-exit ((t :foreground ,yellow)))
              '(elisp-oclosure (( )))
              '(elisp-shadowing-variable (( )))
              `(elisp-shorthand-font-lock-face ((t :foreground ,teal)))
              '(elisp-special-variable-declaration (( )))
              `(elisp-symbol-at-mouse ((t :background ,mantle :foreground ,text)))
              '(elisp-symbol-role (( )))
              '(elisp-theme (( )))
              '(elisp-thing (( )))
              '(elisp-type (( )))
              '(elisp-unknown-call ((t :inherit font-lock-function-call-face)))
              '(elisp-widget-type (( )))

              ;; eshell
              `(eshell-prompt ((t :foreground ,blue :weight bold)))
              `(eshell-ls-archive ((t :foreground ,mauve)))
              `(eshell-ls-backup ((t :foreground ,overlay2)))
              `(eshell-ls-clutter ((t :foreground ,overlay2)))
              `(eshell-ls-directory ((t :foreground ,blue :weight bold)))
              `(eshell-ls-executable ((t :foreground ,green)))
              `(eshell-ls-missing ((t :foreground ,red)))
              `(eshell-ls-product ((t :foreground ,subtext1)))
              `(eshell-ls-readonly ((t :foreground ,overlay1)))
              `(eshell-ls-special ((t :foreground ,peach :weight bold)))
              `(eshell-ls-symlink ((t :foreground ,sky)))
              `(eshell-ls-unreadable ((t :foreground ,overlay2)))

              ;; flymake
              `(flymake-error ((t :underline (:style wave :color ,red))))
              `(flymake-warning ((t :underline (:style wave :color ,yellow))))
              `(flymake-note ((t :underline (:style wave :color ,teal))))

              ;; flyspell
              `(flyspell-duplicate ((t :underline (:style wave :color ,yellow))))
              `(flyspell-incorrect ((t :underline (:style wave :color ,red))))

              ;; hi-lock (M-x highlight-regexp)
              '(hi-aquamarine ((((class color) (min-colors 88) (background light))
                                :background "white" :foreground "#227f9f" :inverse-video t)
                               (((class color) (min-colors 88) (background dark))
                                :background "black" :foreground "#66cbdc" :inverse-video t)))
              '(hi-black-b ((t :inverse-video t)))
              `(hi-black-hb ((t :background ,base :foreground ,subtext1 :inverse-video t)))
              '(hi-blue ((((class color) (min-colors 88) (background light))
                          :background "white" :foreground "#3366dd" :inverse-video t)
                         (((class color) (min-colors 88) (background dark))
                          :background "black" :foreground "#aaccff" :inverse-video t)))
              '(hi-blue-b ((t :inherit (bold hi-blue))))
              '(hi-green ((((class color) (min-colors 88) (background light))
                           :background "white" :foreground "#008a00" :inverse-video t)
                          (((class color) (min-colors 88) (background dark))
                           :background "black" :foreground "#66dd66" :inverse-video t)))
              '(hi-green-b ((t :inherit (bold hi-green))))
              '(hi-pink ((((class color) (min-colors 88) (background light))
                          :background "white" :foreground "#bd30aa" :inverse-video t)
                         (((class color) (min-colors 88) (background dark))
                          :background "black" :foreground "#ff88ee" :inverse-video t)))
              '(hi-red-b ((((class color) (min-colors 88) (background light))
                           :background "white" :foreground "#dd0000" :inverse-video t)
                          (((class color) (min-colors 88) (background dark))
                           :background "black" :foreground "#f06666" :inverse-video t)))
              '(hi-salmon ((((class color) (min-colors 88) (background light))
                            :background "white" :foreground "#af4f6f" :inverse-video t)
                           (((class color) (min-colors 88) (background dark))
                            :background "black" :foreground "#e08a50" :inverse-video t)))
              '(hi-yellow ((((class color) (min-colors 88) (background light))
                            :background "white" :foreground "#af6f00" :inverse-video t)
                           (((class color) (min-colors 88) (background dark))
                            :background "black" :foreground "#faea00" :inverse-video t)))

              ;; hl-line
              `(hl-line ((t :background ,cursor-line :extend t)))

              ;; icomplete
              `(icomplete-first-match ((t :foreground ,green :weight bold)))
              `(icomplete-selected-match ((t :background ,surface0)))

              ;; ido
              `(ido-first-match ((t :foreground ,green :weight bold)))
              `(ido-only-match ((t :foreground ,teal :weight bold)))
              `(ido-subdir ((t :foreground ,blue)))
              `(ido-incomplete-regexp ((t :foreground ,red)))
              `(ido-indicator ((t :foreground ,base :background ,red)))
              `(ido-virtual ((t :foreground ,overlay2)))

              ;; isearch
              `(isearch ((t :foreground ,base :background ,red :weight bold)))
              `(isearch-fail ((t :foreground ,base :background ,red)))
              `(isearch-group-1 ((t :foreground ,base :background ,blue)))
              `(isearch-group-2 ((t :foreground ,base :background ,teal)))
              `(lazy-highlight ((t :foreground ,text :background ,surface2)))
              `(match ((t :foreground ,base :background ,red)))
              `(query-replace ((t :foreground ,base :background ,peach :weight bold)))

              ;; line-number
              `(line-number ((t :background ,base :foreground ,overlay1)))
              `(line-number-current-line ((t :background ,base :foreground ,lavender :weight bold)))
              `(line-number-major-tick ((t :background ,base :foreground ,subtext0)))
              `(line-number-minor-tick ((t :background ,base :foreground ,overlay0)))

              ;; message
              `(message-cited-text-1 ((t :foreground ,teal)))
              `(message-cited-text-2 ((t :foreground ,green)))
              `(message-cited-text-3 ((t :foreground ,overlay2)))
              `(message-cited-text-4 ((t :foreground ,overlay1)))
              `(message-header-cc ((t :foreground ,blue)))
              `(message-header-name ((t :foreground ,mauve)))
              `(message-header-newsgroups ((t :foreground ,teal :weight bold)))
              `(message-header-to ((t :foreground ,blue :weight bold)))
              `(message-header-other ((t :foreground ,subtext1)))
              `(message-header-subject ((t :foreground ,text :weight bold)))
              `(message-header-xheader ((t :foreground ,overlay1)))
              `(message-mml ((t :foreground ,green)))
              `(message-separator ((t :foreground ,overlay2)))

              ;; mode-line / header-line
              `(mode-line ((t :foreground ,text :background ,crust :box ,crust)))
              '(mode-line-buffer-id ((t :weight bold)))
              '(mode-line-active ((t :inherit mode-line)))
              `(mode-line-inactive ((t :foreground ,overlay1 :background ,mantle :box ,mantle)))
              '(mode-line-emphasis ((t :slant italic)))
              `(mode-line-highlight ((t :foreground ,text :background ,surface0 :box ,text)))
              '(header-line ((t :inherit mode-line)))
              '(header-line-active ((t :inherit mode-line-active)))
              '(header-line-inactive ((t :inherit mode-line-inactive)))
              '(header-line-highlight ((t :inherit mode-line-highlight)))

              ;; multiple-cursors
              `(mc/cursor-bar-face ((t :foreground ,text :background ,base :height 1)))
              '(mc/cursor-face ((t :inverse-video t)))
              '(mc/region-face ((t :inherit region)))

              ;; orderless
              `(orderless-match-face-0 ((t :foreground ,blue :weight bold)))
              `(orderless-match-face-1 ((t :foreground ,mauve :weight bold)))
              `(orderless-match-face-2 ((t :foreground ,teal :weight bold)))
              `(orderless-match-face-3 ((t :foreground ,peach :weight bold)))

              ;; org
              `(org-agenda-calendar-daterange ((t :foreground ,subtext1)))
              `(org-agenda-calendar-event ((t :foreground ,subtext1)))
              '(org-agenda-calendar-sexp ((t :inherit (bold org-agenda-calendar-event))))
              '(org-agenda-clocking ((t :inherit secondary-selection)))
              `(org-agenda-column-dateline ((t :background ,mantle)))
              `(org-agenda-current-time ((t :foreground ,blue)))
              `(org-agenda-date ((t :foreground ,sky)))
              `(org-agenda-date-today ((t :foreground ,sky :underline t)))
              `(org-agenda-date-weekend ((t :foreground ,mauve)))
              `(org-agenda-date-weekend-today ((t :foreground ,mauve :underline t)))
              '(org-agenda-diary ((t :inherit org-agenda-calendar-sexp)))
              '(org-agenda-dimmed-todo-face ((t :inherit shadow)))
              `(org-agenda-done ((t :foreground ,green)))
              `(org-agenda-filter-category ((t :inherit bold :foreground ,maroon)))
              `(org-agenda-filter-effort ((t :inherit bold :foreground ,maroon)))
              `(org-agenda-filter-regexp ((t :inherit bold :foreground ,maroon)))
              `(org-agenda-filter-tags ((t :inherit bold :foreground ,maroon)))
              `(org-agenda-restriction-lock ((t :background ,mantle :foreground ,subtext1)))
              `(org-agenda-structure ((t :foreground ,subtext0 :weight bold)))
              `(org-agenda-structure-filter ((t :inherit org-agenda-structure :foreground ,yellow)))
              '(org-agenda-structure-secondary ((t :inherit font-lock-doc-face)))
              `(org-archived ((t :foreground ,overlay2)))
              `(org-block ((t :background ,mantle :extend t)))
              `(org-block-begin-line ((t :background ,mantle :foreground ,overlay2 :extend t :slant italic)))
              '(org-block-end-line ((t :inherit org-block-begin-line)))
              `(org-checkbox ((t :foreground ,blue :weight bold)))
              `(org-checkbox-statistics-done ((t :foreground ,green)))
              `(org-checkbox-statistics-todo ((t :foreground ,peach)))
              '(org-clock-overlay ((t :inherit secondary-selection)))
              `(org-code ((t :foreground ,teal)))
              `(org-column ((t :background ,mantle)))
              `(org-column-title ((t :background ,mantle :weight bold :underline t)))
              `(org-date ((t :foreground ,sky :underline t)))
              `(org-date-selected ((t :foreground ,sky :inverse-video t)))
              `(org-dispatcher-highlight ((t :background ,mantle :foreground ,text :weight bold)))
              `(org-document-info ((t :foreground ,subtext1)))
              `(org-document-info-keyword ((t :foreground ,overlay2)))
              `(org-document-title ((t :foreground ,text :weight bold)))
              `(org-done ((t :foreground ,green :weight bold)))
              `(org-drawer ((t :foreground ,overlay2)))
              `(org-ellipsis ((t :foreground ,overlay2 :underline nil)))
              `(org-footnote ((t :foreground ,teal)))
              `(org-formula ((t :foreground ,peach)))
              '(org-headline-done ((t :inherit org-done)))
              '(org-headline-todo ((t :inherit org-todo)))
              `(org-hide ((t :foreground ,base)))
              '(org-indent ((t :inherit (fixed-pitch org-hide))))
              `(org-imminent-deadline ((t :foreground ,red :weight bold)))
              `(org-latex-and-related ((t :foreground ,sky)))
              `(org-level-1 ((t :inherit outline-1)))
              `(org-level-2 ((t :inherit outline-2)))
              `(org-level-3 ((t :inherit outline-3)))
              `(org-level-4 ((t :inherit outline-4)))
              `(org-level-5 ((t :inherit outline-5)))
              `(org-level-6 ((t :inherit outline-6)))
              `(org-level-7 ((t :inherit outline-7)))
              `(org-level-8 ((t :inherit outline-8)))
              `(org-link ((t :foreground ,teal :underline t)))
              '(org-list-dt ((t :inherit bold)))
              `(org-macro ((t :foreground ,mauve)))
              `(org-meta-line ((t :foreground ,overlay2)))
              '(org-mode-line-clock (( )))
              `(org-mode-line-clock-overrun ((t :foreground ,maroon :weight bold)))
              `(org-priority ((t :foreground ,peach)))
              `(org-property-value ((t :foreground ,subtext1)))
              `(org-quote ((t :foreground ,subtext1 :slant italic :extend t)))
              `(org-scheduled ((t :foreground ,green)))
              `(org-scheduled-previously ((t :foreground ,peach)))
              `(org-scheduled-today ((t :foreground ,green)))
              `(org-sexp-date ((t :foreground ,sky)))
              `(org-special-keyword ((t :foreground ,overlay2)))
              `(org-table ((t :foreground ,subtext1)))
              '(org-table-header ((t :inherit (bold org-table))))
              `(org-tag ((t :foreground ,overlay2)))
              '(org-tag-group ((t :inherit (bold org-tag))))
              '(org-target ((t :underline t)))
              `(org-time-grid ((t :foreground ,overlay1)))
              `(org-todo ((t :foreground ,peach :weight bold)))
              `(org-upcoming-deadline ((t :foreground ,red)))
              `(org-upcoming-distant-deadline ((t :foreground ,text)))
              `(org-verbatim ((t :foreground ,green)))
              '(org-verse ((t :inherit org-quote)))
              `(org-warning ((t :foreground ,yellow :weight bold)))

              ;; outline
              `(outline-1 ((t :foreground ,red :weight bold)))
              `(outline-2 ((t :foreground ,peach :weight bold)))
              `(outline-3 ((t :foreground ,yellow :weight bold)))
              `(outline-4 ((t :foreground ,green :weight bold)))
              `(outline-5 ((t :foreground ,sapphire :weight bold)))
              `(outline-6 ((t :foreground ,lavender :weight bold)))
              `(outline-7 ((t :foreground ,mauve :weight bold)))
              `(outline-8 ((t :foreground ,maroon :weight bold)))

              ;; pulse
              `(pulse-highlight-start-face ((t :background ,lavender :extend t)))

              ;; regexp-builder
              `(reb-match-0 ((t :foreground ,blue :background ,base :inverse-video t)))
              `(reb-match-1 ((t :foreground ,teal :background ,base :inverse-video t)))
              `(reb-match-2 ((t :foreground ,mauve :background ,base :inverse-video t)))
              `(reb-match-3 ((t :foreground ,peach :background ,base :inverse-video t)))
              '(reb-regexp-grouping-backslash ((t :inherit font-lock-regexp-grouping-backslash)))
              '(reb-regexp-grouping-construct ((t :inherit font-lock-regexp-grouping-construct)))

              ;; ruler-mode
              '(ruler-mode-column-number ((t :inherit ruler-mode-default)))
              `(ruler-mode-comment-column ((t :inherit ruler-mode-default :foreground ,red)))
              `(ruler-mode-current-column ((t :inherit ruler-mode-default :foreground ,text :weight bold)))
              `(ruler-mode-default ((t :background ,mantle :foreground ,subtext1)))
              `(ruler-mode-fill-column ((t :inherit ruler-mode-default :foreground ,red)))
              `(ruler-mode-fringes ((t :inherit ruler-mode-default :foreground ,sky)))
              `(ruler-mode-goal-column ((t :inherit ruler-mode-default :foreground ,blue)))
              `(ruler-mode-margins ((t :inherit ruler-mode-default :foreground ,overlay2)))
              `(ruler-mode-pad ((t :inherit ruler-mode-default :background ,base :foreground ,overlay1)))
              `(ruler-mode-tab-stop ((t :inherit ruler-mode-default :foreground ,yellow)))

              ;; shell
              `(sh-heredoc ((t :foreground ,green :slant italic)))
              `(sh-quoted-exec ((t :foreground ,peach)))

              ;; show-paren-mode
              `(show-paren-match ((t :background ,surface1 :foreground ,sky :weight bold)))
              `(show-paren-match-expression ((t :background ,surface0)))
              `(show-paren-mismatch ((t :background ,surface0 :foreground ,red :weight bold)))

              ;; speedbar
              `(speedbar-button-face ((t :foreground ,green)))
              `(speedbar-directory-face ((t :foreground ,blue :weight bold)))
              `(speedbar-file-face ((t :foreground ,text)))
              `(speedbar-highlight-face ((t :background ,surface0)))
              `(speedbar-selected-face ((t :foreground ,peach :weight bold)))
              `(speedbar-separator-face ((t :background ,mantle :foreground ,overlay2)))
              `(speedbar-tag-face ((t :foreground ,teal)))

              ;; tab-bar
              `(tab-bar ((t :foreground ,subtext1 :background ,crust)))
              `(tab-bar-tab ((t :foreground ,text :background ,base :weight bold)))
              `(tab-bar-tab-group-current ((t :foreground ,blue :background ,base :weight bold)))
              `(tab-bar-tab-group-inactive ((t :foreground ,overlay1 :background ,mantle)))
              `(tab-bar-tab-highlight ((t :background ,surface0)))
              `(tab-bar-tab-inactive ((t :foreground ,overlay1 :background ,mantle)))
              `(tab-bar-tab-ungrouped ((t :foreground ,overlay2 :background ,mantle)))

              ;; tab-line
              `(tab-line ((t :foreground ,subtext1 :background ,crust :height 0.95)))
              `(tab-line-close-highlight ((t :foreground ,maroon)))
              `(tab-line-highlight ((t :background ,surface0)))
              `(tab-line-tab ((t :foreground ,text :background ,base :weight bold)))
              `(tab-line-tab-current ((t :foreground ,text :background ,base :weight bold)))
              `(tab-line-tab-inactive ((t :foreground ,overlay1 :background ,mantle)))
              `(tab-line-tab-inactive-alternate ((t :foreground ,overlay1 :background ,mantle)))
              `(tab-line-tab-modified ((t :foreground ,yellow)))

              ;; vertico
              `(vertico-current ((t :background ,surface0 :weight bold)))

              ;; vundo
              `(vundo-default ((t :foreground ,overlay1)))
              `(vundo-node ((t :foreground ,overlay1)))
              `(vundo-stem ((t :foreground ,surface2)))
              `(vundo-branch-stem ((t :foreground ,overlay0)))
              `(vundo-highlight ((t :foreground ,blue :weight bold)))
              `(vundo-last-saved ((t :foreground ,green :weight bold)))
              `(vundo-saved ((t :foreground ,green)))

              ;; which-func-mode
              `(which-func ((t :foreground ,blue)))

              ;; which-key
              `(which-key-command-description-face ((t :foreground ,text)))
              `(which-key-group-description-face ((t :foreground ,mauve)))
              `(which-key-highlighted-command-face ((t :foreground ,peach :weight bold)))
              `(which-key-key-face ((t :foreground ,blue :weight bold)))
              `(which-key-local-map-description-face ((t :foreground ,teal)))
              `(which-key-note-face ((t :foreground ,overlay2)))
              `(which-key-separator-face ((t :foreground ,overlay2)))
              `(which-key-special-key-face ((t :foreground ,red :weight bold)))
              `(which-key-docstring-face ((t :foreground ,overlay2 :slant italic)))

              ;; whitespace-mode
              `(whitespace-big-indent ((t :background ,surface0 :foreground ,peach)))
              `(whitespace-empty ((t :background ,maroon :extend t)))
              `(whitespace-hspace ((t  :foreground ,surface1)))
              `(whitespace-indentation ((t :foreground ,surface1)))
              `(whitespace-line ((t :background ,surface0 :foreground ,red)))
              `(whitespace-newline ((t :foreground ,surface1)))
              `(whitespace-space ((t :foreground ,surface1)))
              `(whitespace-space-after-tab ((t :foreground ,surface1)))
              `(whitespace-space-before-tab ((t :foreground ,peach)))
              `(whitespace-tab ((t :foreground ,surface1)))
              `(whitespace-trailing ((t :background ,maroon)))

              ;; widget
              `(widget-button ((t :inherit bold :foreground ,lavender)))
              `(widget-button-pressed ((t :inherit widget-button :foreground ,mauve)))
              '(widget-documentation ((t :inherit font-lock-doc-face)))
              `(widget-field ((t :background ,overlay2 :foreground ,base :extend nil)))
              `(widget-inactive ((t :background ,mantle :foreground ,subtext1)))
              '(widget-single-line-field ((t :inherit widget-field)))

              ;; window-divider-mode
              `(window-divider ((t :foreground ,surface1)))
              `(window-divider-first-pixel ((t :foreground ,surface1)))
              `(window-divider-last-pixel ((t :foreground ,surface1))))
             (custom-theme-set-variables
              ',name
              `(ansi-color-names-vector [,surface1 ,red ,green ,yellow ,blue ,mauve ,sky ,subtext0])
              '(diff-font-lock-syntax nil)
              '(frame-background-mode ',background-mode))
             ,@(unless theme-exists-p
                 (list `(provide-theme ',name))))))
    (error "No palette found for `%s'" name)))

(defun catppuccin-themes--with-colors-subr (&rest body)
  "Evaluate BODY for `catppuccin-themes-with-colors'."
  (condition-case data
      (when-let* ((theme (or (car (seq-filter
                                   (lambda (th)
                                     (string-prefix-p "catppuccin-" (symbol-name th)))
                                   custom-enabled-themes))
                             (user-error "No enabled catppuccin theme could be found")))
                  (palette-symbol (intern-soft (format "%s-palette" theme)))
                  (_ (boundp palette-symbol))
                  (palette (symbol-value palette-symbol)))
        (eval
         `(let (,@palette)
            ,body)))
    (error (message "Error in catppuccin-themes-with-colors: %s" data))))

;;;###autoload
(defmacro catppuccin-themes-with-colors (&rest body)
  "Evaluate BODY with current Catppuccin theme's palette `let' bound."
  (declare (indent 0))
  `(catppuccin-themes--with-colors-subr
    (lambda () ,@body)))

;;;; Add themes from package to path

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (unless (equal dir (expand-file-name "themes/" data-directory))
      (add-to-list 'custom-theme-load-path dir))))

(provide 'catppuccin-themes)
;;; catppuccin-themes.el ends here

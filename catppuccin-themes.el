;;; catppuccin-themes.el --- Catppuccin themes. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defgroup catppuccin-themes ()
  "Catppuccin themes."
  :group 'faces)

(defconst catppuccin-themes-faces
  '(
    ;; base faces
    `(default ((,c :background ,base :foreground ,text)))
    `(bold ((,c :weight bold)))
    `(italic ((,c :slant italic)))
    `(underline ((,c :underline t)))
    `(cursor ((,c :background ,rosewater)))
    `(ffap ((,c :inherit match)))
    `(fringe ((,c :background ,base :foreground ,surface1)))
    `(help-argument-name ((,c :foreground ,yellow)))
    `(help-key-binding ((,c :background ,mantle :foreground ,blue)))
    `(highlight ((,c :background ,surface0 :foreground ,text)))
    `(info-menu-star ((,c :foreground ,red)))
    `(info-quoted-name ((,c :foreground ,subtext1)))
    `(info-string ((,c :foreground ,green)))
    `(link ((,c :foreground ,blue :underline t)))
    `(link-visited ((,c :foreground ,lavender :underline t)))
    `(match ((,c :background ,red :foreground ,mantle)))
    `(menu ((,c :background ,surface0 :inverse-video nil :foreground ,text)))
    `(minibuffer-prompt ((,c :weight normal :foreground ,subtext0)))
    `(read-multiple-choice-face ((,c :inherit completions-first-difference)))
    `(region ((,c :background ,overlay0 :foreground ,text :extend t)))
    `(scroll-bar ((,c :background ,surface0 :foreground unspecified)))
    `(secondary-selection ((,c :background ,surface0 :foreground unspecified)))
    `(shadow ((,c :foreground ,overlay0)))
    `(success ((,c :foreground ,green :weight bold)))
    `(warning ((,c :foreground ,yellow :weight bold)))
    `(error ((,c :foreground ,red :weight bold)))
    `(tooltip ((,c :background ,surface0 :foreground ,overlay2)))
    `(tool-bar ((,c :background ,surface0 :foreground unspecified)))
    `(trailing-whitespace ((,c :inherit warning)))
    `(border ((,c :background ,mantle :foreground ,text)))
    `(window-divider ((,c :foreground ,mantle)))
    `(vertical-border ((,c :foreground ,mantle)))
    `(child-frame-border ((,c :background ,mantle)))

    ;; font-lock
    `(font-lock-bracket-face ((,c :foreground ,overlay2)))
    `(font-lock-builtin-face ((,c :foreground ,red)))
    `(font-lock-comment-face ((,c :inherit (shadow italic))))
    `(font-lock-comment-delimiter-face ((,c :inherit shadow)))
    `(font-lock-constant-face ((,c :foreground ,peach)))
    `(font-lock-delimiter-face ((,c :foreground ,overlay2)))
    `(font-lock-doc-face ((,c :inherit font-lock-comment-face)))
    `(font-lock-doc-markup-face ((,c :inherit font-lock-constant-face)))
    `(font-lock-escape-face ((,c :foreground ,pink)))
    `(font-lock-function-call-face ((,c :foreground ,blue)))
    `(font-lock-function-name-face ((,c :foreground ,blue)))
    `(font-lock-keyword-face ((,c :foreground ,mauve)))
    `(font-lock-negation-char-face ((,c :foreground ,sky)))
    `(font-lock-number-face ((,c :foreground ,peach)))
    `(font-lock-operator-face ((,c :foreground ,sky)))
    `(font-lock-preprocessor-face ((,c :foreground ,yellow)))
    `(font-lock-property-name-face ((,c :foreground ,blue)))
    `(font-lock-regexp-grouping-backslash ((,c :foreground ,red)))
    `(font-lock-regexp-grouping-construct ((,c :foreground ,red)))
    `(font-lock-string-face ((,c :foreground ,green)))
    `(font-lock-type-face ((,c :foreground ,yellow)))
    `(font-lock-variable-name-face ((,c :foreground ,text)))
    `(font-lock-variable-use-face ((,c :foreground ,text)))
    `(font-lock-warning-face ((,c :foreground ,yellow)))

    ;; ansi-color
    `(ansi-color-bold ((,c :inherit bold)))
    `(ansi-color-black ((,c :background ,surface1 :foreground ,surface1)))
    `(ansi-color-red ((,c :background ,red :foreground ,red)))
    `(ansi-color-yellow ((,c :background ,yellow :foreground ,yellow)))
    `(ansi-color-green ((,c :background ,green :foreground ,green)))
    `(ansi-color-blue ((,c :background ,blue :foreground ,blue)))
    `(ansi-color-magenta ((,c :background ,pink :foreground ,pink)))
    `(ansi-color-cyan ((,c :background ,teal :foreground ,teal)))
    `(ansi-color-white ((,c :background ,subtext1 :foreground ,subtext1)))
    `(ansi-color-bright-black ((,c :background ,surface2 :foreground ,surface2)))
    `(ansi-color-bright-red ((,c :background ,red :foreground ,red)))
    `(ansi-color-bright-yellow ((,c :background ,yellow  :foreground ,yellow)))
    `(ansi-color-bright-green ((,c :background ,green :foreground ,green)))
    `(ansi-color-bright-blue ((,c :background ,blue :foreground ,blue)))
    `(ansi-color-bright-magenta ((,c :background ,pink :foreground ,pink)))
    `(ansi-color-bright-cyan ((,c :background ,teal :foreground ,teal)))
    `(ansi-color-bright-white ((,c :background ,subtext0 :foreground ,subtext0)))

    ;; ace-window
    `(aw-background-face ((,c :foreground "gray50")))
    `(aw-key-face ((,c :inherit bold :foreground ,blue)))
    `(aw-leading-char-face ((,c :inherit bold :height 1.5 :foreground ,red)))
    `(aw-minibuffer-leading-char-face ((,c :inherit aw-key-face)))
    `(aw-mode-line-face ((,c :inherit bold)))

    ;; avy
    `(avy-background-face ((,c :background ,base :foreground ,text)))
    `(avy-goto-char-timer-face ((,c :background ,surface0 :foreground ,blue)))
    `(avy-lead-face ((,c :background ,mauve :foreground ,base)))
    `(avy-lead-face-0 ((,c :background ,yellow :foreground ,base)))
    `(avy-lead-face-1 ((,c :background ,overlay0 :foreground ,base)))
    `(avy-lead-face-2 ((,c :background ,sky :foreground ,base)))

    ;; bookmark
    `(bookmark-face ((,c :inherit font-lock-constant-face)))
    `(bookmark-menu-bookmark ((,c :inherit bold)))

    ;; calendar and diary
    `(calendar-month-header ((,c :inherit bold)))
    `(calendar-today ((,c :inherit bold :underline t)))
    `(calendar-weekday-header ((,c :foreground ,sky)))
    `(calendar-weekend-header ((,c :foreground ,red)))
    `(diary ((,c :foreground ,sky)))
    `(diary-anniversary ((,c :foreground ,red)))
    `(diary-time ((,c :foreground ,sky)))
    `(holiday ((,c :foreground ,pink)))

    ;; compilation
    `(compilation-info ((,c :inherit bold :foreground ,green)))
    `(compilation-warning ((,c :inherit bold :foreground ,yellow)))
    `(compilation-error ((,c :inherit bold :foreground ,red)))
    `(compilation-line-number ((,c :inherit shadow)))
    `(compilation-column-number ((,c :inherit compilation-line-number)))
    `(compilation-mode-line-exit ((,c :inherit bold :foreground ,green)))
    `(compilation-mode-line-fail ((,c :inherit bold :foreground ,red)))
    `(compilation-mode-line-run ((,c :inherit bold :foreground ,yellow)))

    ;; completions
    `(completions-annotations ((,c :inherit font-lock-comment-face)))
    `(completions-common-part ((,c :foreground ,sky)))
    `(completions-first-difference ((,c :inherit bold)))
    `(completions-highlight ((,c :inherit (highlight bold))))

    ;; corfu
    `(corfu-default ((,c :background ,surface0)))
    `(corfu-current ((,c :background ,surface1)))
    `(corfu-bar ((,c :background ,subtext0)))
    `(corfu-border ((,c :inherit corfu-default)))
    `(corfu-annotations ((,c :inherit font-lock-comment-face)))
    `(corfu-deprecated ((,c :strike-through t)))

    ;; diff
    `(diff-added ((,c :background ,surface0 :foreground ,green)))
    `(diff-changed ((,c :background ,surface0 :foreground ,yellow)))
    `(diff-changed-unspecified ((,c :inherit diff-changed)))
    `(diff-removed ((,c :background ,surface0 :foreground ,red)))
    `(diff-indicator-added ((,c :inherit diff-added)))
    `(diff-indicator-changed ((,c :inherit diff-changed)))
    `(diff-indicator-removed ((,c :inherit diff-removed)))
    `(diff-refine-added ((,c :inherit diff-added :inverse-video t)))
    `(diff-refine-changed ((,c :inherit diff-changed :inverse-video t)))
    `(diff-refine-removed ((,c :inherit diff-removed :inverse-video t)))
    `(diff-context (()))
    `(diff-error ((,c :inherit error)))
    `(diff-file-header ((,c :inherit bold)))
    `(diff-function ((,c :background ,surface2)))
    `(diff-header ((,c :foreground ,blue)))
    `(diff-hunk-header ((,c :background ,surface2 :foreground ,text)))
    `(diff-index ((,c :slant italic)))
    `(diff-nonexistent ((,c :inherit bold)))

    ;; diff-hl
    `(diff-hl-change ((,c :foreground ,base :background ,yellow)))
    `(diff-hl-delete ((,c :foreground ,base :background ,red)))
    `(diff-hl-insert ((,c :foreground ,base :background ,green)))
    `(diff-hl-reverted-hunk-highlight ((,c :inverse-video t)))

    ;; dired
    `(dired-broken-symlink ((,c :background ,red :foreground ,text)))
    `(dired-directory ((,c :foreground ,blue)))
    `(dired-flagged ((,c :foreground ,maroon :weight bold)))
    `(dired-header ((,c :foreground ,sapphire :weight bold)))
    `(dired-ignored ((,c :inherit font-lock-comment-face)))
    `(dired-mark ((,c :inherit dired-marked)))
    `(dired-marked ((,c :weight bold)))
    `(dired-perm-write ((,c :foreground ,green)))
    `(dired-special ((,c :foreground ,yellow)))
    `(dired-symlink ((,c :foreground ,pink)))
    `(dired-warning ((,c :inherit warning)))

    ;; elfeed
    `(elfeed-log-date-face ((,c :inherit elfeed-search-date-face)))
    `(elfeed-log-debug-level-face ((,c :weight bold)))
    `(elfeed-log-info-level-face ((,c :inherit success)))
    `(elfeed-log-warn-level-face ((,c :inherit warning)))
    `(elfeed-log-error-level-face ((,c :inherit error)))
    `(elfeed-search-date-face ((,c :foreground ,subtext0)))
    `(elfeed-search-feed-face ((,c :foreground ,text :weight bold)))
    `(elfeed-search-filter-face ((,c :foreground ,green :weight bold)))
    `(elfeed-search-last-update-face ((,c :weight bold)))
    `(elfeed-search-tag-face ((,c :foreground ,green)))
    `(elfeed-search-title-face ((,c :foreground ,text)))
    `(elfeed-search-unread-count-face ((,c :foreground ,pink)))
    `(elfeed-search-unread-title-face ((,c :foreground ,red)))

    ;; eshell
    `(eshell-prompt ((,c :foreground ,blue :weight bold)))
    `(eshell-ls-archive ((,c :foreground ,mauve)))
    `(eshell-ls-backup ((,c :foreground ,yellow)))
    `(eshell-ls-clutter ((,c :foreground ,red :weight bold)))
    `(eshell-ls-directory ((,c :foreground ,blue :weight bold)))
    `(eshell-ls-executable ((,c :foreground ,green :weight bold)))
    `(eshell-ls-missing ((,c :foreground ,red :weight bold)))
    `(eshell-ls-product ((,c :foreground ,peach)))
    `(eshell-ls-readonly ((,c :foreground ,flamingo)))
    `(eshell-ls-special ((,c :foreground ,pink :weight bold)))
    `(eshell-ls-symlink ((,c :foreground ,sapphire :weight bold)))
    `(eshell-ls-unreadable ((,c :foreground ,text)))

    ;; hl-line
    `(hl-line ((,c :background ,surface0 :extend t)))

    ;; line-number
    `(line-number ((,c :inherit default :background ,base :foreground ,surface1)))
    `(line-number-current-line ((,c :inherit (bold line-number) :foreground ,lavender)))
    `(line-number-major-tick ((,c :inherit line-number :foreground ,red)))
    `(line-number-minor-tick ((,c :inherit line-number :foreground ,surface1)))

    ;; mode-line / header-line
    `(mode-line ((,c :background ,mantle :box ,mantle :foreground ,text)))
    `(mode-line-buffer-id ((,c :inherit bold)))
    `(mode-line-active ((,c :inherit mode-line)))
    `(mode-line-inactive ((,c :background ,crust :foreground ,overlay0 :box ,crust)))
    `(mode-line-emphasis ((,c :inherit bold :foreground ,blue)))
    `(mode-line-highlight ((,c :background ,surface0 :foreground ,text :box ,text)))
    `(header-line ((,c :inherit mode-line)))
    `(header-line-active ((,c :inherit mode-line-active)))
    `(header-line-inactive ((,c :inherit mode-line-inactive)))
    `(header-line-highlight ((,c :inherit mode-line-highlight)))
    )
  "Face specs for use with `catppuccin-themes-theme'.")

(defconst catppuccin-themes-custom-variables
  '(
    ;;;; ansi-colors
    `(ansi-color-names-vector [,base ,red ,green ,yellow ,blue ,pink ,teal ,text])
  )
  "Custom variables for `catppuccin-themes-theme'.")

;;; Theme macros

;;;; Instantiate a catppuccin theme

;;;###autoload
(defmacro catppuccin-themes-theme (name palette &optional overrides)
  "Bind NAME's color PALETTE. Optional OVERRIDES are appended to PALETTE."
  (declare (indent 0))
  (let* ((palette-v (symbol-value palette))
         (overrides-v (symbol-value overrides))
         (colors (mapcar #'car palette-v)))
    `(let* ((c '((class color) (min-colors 256)))
            ,@(mapcar (lambda (color)
                        (list color
                              (or (alist-get color overrides-v)
                                  (alist-get color palette-v))))
                      colors))
       (ignore c ,@colors)
       (custom-theme-set-faces ',name ,@catppuccin-themes-faces)
       (custom-theme-set-variables ',name ,@catppuccin-themes-custom-variables))))

;;;; Use theme colors

(defmacro catppuccin-themes-with-colors (&rest body)
  "Evaluate BODY with colors from current palette bound."
  (declare (indent 0))
  (let* ((theme (or (car (seq-filter
                          (lambda (th)
                            (string-prefix-p "catppuccin-" (symbol-name th)))
                          custom-enabled-themes))
                    (user-error "No enabled catppuccin theme could be found")))
         (palette-v (symbol-value (intern (format "%s-palette" theme))))
         (overrides-v (symbol-value (intern (format "%s-palette-overrides" theme))))
         (colors (mapcar #'car palette-v)))
    `(let* ((c '((class color) (min-colors 256)))
            ,@(mapcar (lambda (color)
                        (list color
                              (or (alist-get color overrides-v)
                                  (alist-get color palette-v))))
                      colors))
       (ignore c ,@colors)
       ,@body)))

;;;; Add themes from package to path

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (unless (equal dir (expand-file-name "themes/" data-directory))
      (add-to-list 'custom-theme-load-path dir))))

(provide 'catppuccin-themes)
;;; catppuccin-themes.el ends here

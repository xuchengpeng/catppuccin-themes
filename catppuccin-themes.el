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
    `(bold-italic ((,c :inherit (bold italic))))
    `(underline ((,c :underline t)))
    `(cursor ((,c :background ,rosewater)))
    `(escape-glyph ((,c :foreground ,red)))
    `(ffap ((,c :inherit match)))
    `(fringe ((,c :background unspecified :foreground ,surface1)))
    `(help-argument-name ((,c :inherit italic :foreground ,text)))
    `(help-key-binding ((,c :inherit bold :foreground ,blue)))
    `(highlight ((,c :background ,highlight :foreground ,text)))
    `(info-menu-star ((,c :foreground ,red)))
    `(info-quoted-name ((,c :foreground ,subtext1)))
    `(info-string ((,c :foreground ,green)))
    `(link ((,c :foreground ,blue :underline t)))
    `(link-visited ((,c :foreground ,lavender :underline t)))
    `(match ((,c :background ,bg-red-intense :foreground ,text)))
    `(menu ((,c :background ,highlight :foreground ,text :inverse-video nil)))
    `(minibuffer-prompt ((,c :foreground ,teal :weight normal)))
    `(minibuffer-nonselected ((,c :background ,bg-teal-intense :foreground ,text)))
    `(next-error ((,c :background ,bg-red-intense :foreground ,text :extend t)))
    `(read-multiple-choice-face ((,c :inherit completions-first-difference)))
    `(region ((,c :background ,surface1 :foreground ,text :extend t)))
    `(scroll-bar ((,c :background ,surface0 :foreground ,subtext0)))
    `(secondary-selection ((,c :background ,surface0 :foreground unspecified)))
    `(shadow ((,c :foreground ,overlay2)))
    `(success ((,c :foreground ,green)))
    `(warning ((,c :foreground ,yellow)))
    `(error ((,c :foreground ,red)))
    `(tooltip ((,c :background ,surface0 :foreground ,subtext1)))
    `(tool-bar ((,c :background ,surface0 :foreground unspecified)))
    `(trailing-whitespace ((,c :background ,bg-red-intense)))
    `(border ((,c :background ,overlay0 :foreground ,text)))
    `(vertical-border ((,c :foreground ,overlay0)))
    `(child-frame-border ((,c :background ,overlay0)))

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
    `(aw-background-face ((,c :foreground ,overlay1)))
    `(aw-key-face ((,c :inherit bold :foreground ,blue)))
    `(aw-leading-char-face ((,c :inherit bold :height 1.5 :foreground ,red)))
    `(aw-minibuffer-leading-char-face ((,c :inherit aw-key-face)))
    `(aw-mode-line-face ((,c :inherit bold)))

    ;; avy
    `(avy-background-face ((,c :background ,base :foreground ,subtext0 :extend t)))
    `(avy-goto-char-timer-face ((,c :background ,bg-sapphire-intense :foreground ,text :weight bold)))
    `(avy-lead-face ((,c :background ,bg-red-intense :foreground ,text :weight bold)))
    `(avy-lead-face-0 ((,c :background ,bg-red-intense :foreground ,text :weight bold)))
    `(avy-lead-face-1 ((,c :background ,bg-red-intense :foreground ,text :weight bold)))
    `(avy-lead-face-2 ((,c :background ,bg-red-intense :foreground ,text :weight bold)))

    ;; bookmark
    `(bookmark-face ((,c :inherit font-lock-constant-face)))
    `(bookmark-menu-bookmark ((,c :inherit bold)))

    ;; calendar and diary
    `(calendar-month-header ((,c :inherit bold)))
    `(calendar-today ((,c :inherit bold :underline t)))
    `(calendar-weekday-header ((,c :foreground ,teal)))
    `(calendar-weekend-header ((,c :foreground ,mauve)))
    `(diary ((,c :foreground ,teal)))
    `(diary-anniversary ((,c :foreground ,red)))
    `(diary-time ((,c :foreground ,teal)))
    `(holiday ((,c :foreground ,red)))

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
    `(completions-highlight ((,c :background ,highlight :weight bold)))

    ;; corfu
    `(corfu-default ((,c :background ,surface0)))
    `(corfu-current ((,c :background ,surface1)))
    `(corfu-bar ((,c :background ,subtext0)))
    `(corfu-border ((,c :background ,overlay0)))
    `(corfu-annotations ((,c :inherit font-lock-comment-face)))
    `(corfu-deprecated ((,c :strike-through t)))

    ;; diff
    `(diff-added ((,c :background ,added :foreground ,text)))
    `(diff-changed ((,c :background ,changed :foreground ,text)))
    `(diff-changed-unspecified ((,c :inherit diff-changed)))
    `(diff-removed ((,c :background ,removed :foreground ,text)))
    `(diff-indicator-added ((,c :inherit diff-added)))
    `(diff-indicator-changed ((,c :inherit diff-changed)))
    `(diff-indicator-removed ((,c :inherit diff-removed)))
    `(diff-refine-added ((,c :background ,added-refine :foreground ,text)))
    `(diff-refine-changed ((,c :background ,changed-refine :foreground ,text)))
    `(diff-refine-removed ((,c :background ,removed-refine :foreground ,text)))
    `(diff-context (()))
    `(diff-error ((,c :inherit error)))
    `(diff-file-header ((,c :inherit bold)))
    `(diff-function ((,c :background ,surface2)))
    `(diff-header ((,c :foreground ,blue)))
    `(diff-hunk-header ((,c :background ,surface2 :foreground ,text)))
    `(diff-index ((,c :inherit italic)))
    `(diff-nonexistent ((,c :inherit bold)))

    ;; diff-hl
    `(diff-hl-change ((,c :background ,changed-refine)))
    `(diff-hl-delete ((,c :background ,removed-refine)))
    `(diff-hl-insert ((,c :background ,added-refine)))
    `(diff-hl-reverted-hunk-highlight ((,c :inverse-video t)))

    ;; dired
    `(dired-broken-symlink ((,c :foreground ,red :underline t)))
    `(dired-directory ((,c :foreground ,blue)))
    `(dired-flagged ((,c :foreground ,maroon :weight bold)))
    `(dired-header ((,c :foreground ,sapphire :weight bold)))
    `(dired-ignored ((,c :inherit shadow)))
    `(dired-mark ((,c :weight bold)))
    `(dired-marked ((,c :foreground ,mauve :weight bold)))
    `(dired-perm-write ((,c :foreground ,green)))
    `(dired-special ((,c :foreground ,yellow)))
    `(dired-symlink ((,c :foreground ,pink :underline t)))
    `(dired-warning ((,c :inherit warning)))

    ;; ediff
    `(ediff-current-diff-A ((,c :background ,removed :foreground ,text)))
    `(ediff-current-diff-Ancestor ((,c :background ,surface1)))
    `(ediff-current-diff-B ((,c :background ,added :foreground ,text)))
    `(ediff-current-diff-C ((,c :background ,changed :foreground ,text)))
    `(ediff-even-diff-A ((,c :background ,highlight)))
    `(ediff-even-diff-Ancestor ((,c :background ,highlight)))
    `(ediff-even-diff-B ((,c :background ,highlight)))
    `(ediff-even-diff-C ((,c :background ,highlight)))
    `(ediff-fine-diff-A ((,c :background ,removed-refine :foreground ,text)))
    `(ediff-fine-diff-Ancestor ((,c :background ,bg-sapphire-intense :foreground ,text)))
    `(ediff-fine-diff-B ((,c :background ,added-refine :foreground ,text)))
    `(ediff-fine-diff-C ((,c :background ,changed-refine :foreground ,text)))
    `(ediff-odd-diff-A ((,c :inherit ediff-even-diff-A)))
    `(ediff-odd-diff-Ancestor ((,c :inherit ediff-even-diff-Ancestor)))
    `(ediff-odd-diff-B ((,c :inherit ediff-even-diff-B)))
    `(ediff-odd-diff-C ((,c :inherit ediff-even-diff-C)))

    ;; elfeed
    `(elfeed-log-date-face ((,c :inherit elfeed-search-date-face)))
    `(elfeed-log-debug-level-face ((,c :weight bold)))
    `(elfeed-log-info-level-face ((,c :inherit success :weight bold)))
    `(elfeed-log-warn-level-face ((,c :inherit warning :weight bold)))
    `(elfeed-log-error-level-face ((,c :inherit error :weight bold)))
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

    ;; flymake
    `(flymake-error ((,c :underline (:style wave :color ,red))))
    `(flymake-warning ((,c :underline (:style wave :color ,yellow))))
    `(flymake-note ((,c :underline (:style wave :color ,green))))

    ;; flyspell
    `(flyspell-duplicate ((,c :underline (:style wave :color ,teal))))
    `(flyspell-incorrect ((,c :underline (:style wave :color ,maroon))))

    ;; hi-lock (M-x highlight-regexp)
    `(hi-aquamarine ((,c :background ,bg-sky-intense :foreground ,text)))
    `(hi-black-b ((,c :background ,text :foreground ,base)))
    `(hi-black-hb ((,c :inherit (bold hi-black-b))))
    `(hi-blue ((,c :background ,bg-blue-intense :foreground ,text)))
    `(hi-blue-b ((,c :inherit (bold hi-blue))))
    `(hi-green ((,c :background ,bg-green-intense :foreground ,text)))
    `(hi-green-b ((,c :inherit (bold hi-green))))
    `(hi-pink ((,c :background ,bg-pink-intense :foreground ,text)))
    `(hi-red-b ((,c :background ,bg-red-intense :foreground ,text)))
    `(hi-salmon ((,c :background ,bg-peach-intense :foreground ,text)))
    `(hi-yellow ((,c :background ,bg-yellow-intense :foreground ,text)))

    ;; hl-line
    `(hl-line ((,c :background ,highlight :extend t)))

    ;; icomplete
    `(icomplete-first-match ((,c :foreground ,blue)))
    `(icomplete-selected-match ((,c :inherit match)))

    ;; ido
    `(ido-first-match ((,c :foreground ,green)))
    `(ido-incomplete-regexp ((,c :inherit warning)))
    `(ido-indicator ((,c :foreground ,text :weight bold)))
    `(ido-only-match ((,c :foreground ,green)))
    `(ido-subdir ((,c :foreground ,blue)))
    `(ido-virtual ((,c :foreground ,sapphire)))

    ;; isearch
    `(isearch ((,c :background ,bg-red-intense :foreground ,text)))
    `(isearch-fail ((,c :background ,bg-maroon-intense :foreground ,text)))
    `(isearch-group-1 ((,c :background ,bg-lavender-intense :foreground ,text)))
    `(isearch-group-2 ((,c :background ,bg-teal-intense :foreground ,text)))
    `(lazy-highlight ((,c :background ,bg-sapphire-intense :foreground ,text)))

    ;; line-number
    `(line-number ((,c :inherit default :background ,base :foreground ,overlay1)))
    `(line-number-current-line ((,c :inherit line-number :foreground ,lavender :weight bold)))
    `(line-number-major-tick ((,c :inherit line-number :foreground ,red)))
    `(line-number-minor-tick ((,c :inherit line-number :foreground ,surface1)))

    ;; markdown-mode
    `(markdown-blockquote-face ((,c :foreground ,subtext0)))
    `(markdown-bold-face ((,c :inherit bold)))
    `(markdown-code-face ((,c :background ,mantle :foreground ,text :extend t)))
    `(markdown-gfm-checkbox-face ((,c :foreground ,red)))
    `(markdown-header-face ((,c :weight bold)))
    `(markdown-header-face-1 ((,c :inherit outline-1)))
    `(markdown-header-face-2 ((,c :inherit outline-2)))
    `(markdown-header-face-3 ((,c :inherit outline-3)))
    `(markdown-header-face-4 ((,c :inherit outline-4)))
    `(markdown-header-face-5 ((,c :inherit outline-5)))
    `(markdown-header-face-6 ((,c :inherit outline-6)))
    `(markdown-highlighting-face ((,c :inherit secondary-selection)))
    `(markdown-inline-code-face ((,c :foreground ,green)))
    `(markdown-italic-face ((,c :inherit italic)))
    `(markdown-language-keyword-face ((,c :inherit shadow)))
    `(markdown-line-break-face ((,c :inherit font-lock-constant-face :underline t)))
    `(markdown-link-face ((,c :inherit link)))
    `(markdown-markup-face ((,c :inherit shadow)))
    `(markdown-metadata-key-face ((,c :inherit bold)))
    `(markdown-metadata-value-face ((,c :foreground ,green)))
    `(markdown-missing-link-face ((,c :inherit warning)))
    `(markdown-pre-face ((,c :inherit markdown-code-face)))
    `(markdown-table-face ((,c :foreground ,subtext1)))
    `(markdown-url-face ((,c :foreground ,subtext0)))

    ;; message
    `(message-cited-text-1 ((,c :foreground ,blue)))
    `(message-cited-text-2 ((,c :foreground ,yellow)))
    `(message-cited-text-3 ((,c :foreground ,teal)))
    `(message-cited-text-4 ((,c :foreground ,red)))
    `(message-header-name ((,c :foreground ,text :weight bold)))
    `(message-header-newsgroups ((,c :foreground ,mauve)))
    `(message-header-to ((,c :foreground ,lavender :weight bold)))
    `(message-header-cc ((,c :foreground ,lavender)))
    `(message-header-subject ((,c :foreground ,blue :weight bold)))
    `(message-header-xheader ((,c :foreground ,mauve)))
    `(message-header-other ((,c :foreground ,mauve)))
    `(message-mml ((,c :foreground ,teal)))
    `(message-separator ((,c :background ,mantle :foreground ,text)))

    ;; mode-line / header-line
    `(mode-line ((,c :background ,crust :foreground ,text :box ,crust)))
    `(mode-line-buffer-id ((,c :inherit bold)))
    `(mode-line-active ((,c :inherit mode-line)))
    `(mode-line-inactive ((,c :background ,mantle :foreground ,overlay1 :box ,mantle)))
    `(mode-line-emphasis ((,c :inherit bold :foreground ,blue)))
    `(mode-line-highlight ((,c :background ,surface0 :foreground ,text :box ,text)))
    `(header-line ((,c :inherit mode-line)))
    `(header-line-active ((,c :inherit mode-line-active)))
    `(header-line-inactive ((,c :inherit mode-line-inactive)))
    `(header-line-highlight ((,c :inherit mode-line-highlight)))

    ;; orderless
    `(orderless-match-face-0 ((,c :foreground ,blue :weight bold)))
    `(orderless-match-face-1 ((,c :foreground ,mauve :weight bold)))
    `(orderless-match-face-2 ((,c :foreground ,teal :weight bold)))
    `(orderless-match-face-3 ((,c :foreground ,peach :weight bold)))

    ;; org
    `(org-agenda-calendar-daterange ((,c :foreground ,subtext0)))
    `(org-agenda-calendar-event ((,c :foreground ,subtext0)))
    `(org-agenda-calendar-sexp ((,c :inherit (bold org-agenda-calendar-event))))
    `(org-agenda-clocking ((,c :inherit secondary-selection)))
    `(org-agenda-column-dateline ((,c :background ,mantle)))
    `(org-agenda-current-time ((,c :foreground ,text)))
    `(org-agenda-date ((,c :foreground ,teal :weight bold)))
    `(org-agenda-date-today ((,c :inherit org-agenda-date :underline t)))
    `(org-agenda-date-weekend ((,c :inherit org-agenda-date :foreground ,mauve)))
    `(org-agenda-date-weekend-today ((,c :inherit org-agenda-date-today :foreground ,mauve)))
    `(org-agenda-diary ((,c :inherit org-agenda-calendar-sexp)))
    `(org-agenda-dimmed-todo-face ((,c :inherit shadow)))
    `(org-agenda-done ((,c :inherit org-done)))
    `(org-agenda-filter-category ((,c :inherit bold :foreground ,maroon)))
    `(org-agenda-filter-effort ((,c :inherit bold :foreground ,maroon)))
    `(org-agenda-filter-regexp ((,c :inherit bold :foreground ,maroon)))
    `(org-agenda-filter-tags ((,c :inherit bold :foreground ,maroon)))
    `(org-agenda-restriction-lock ((,c :background ,mantle :foreground ,subtext0)))
    `(org-agenda-structure ((,c :foreground ,subtext0 :weight bold)))
    `(org-agenda-structure-filter ((,c :inherit org-agenda-structure :foreground ,yellow)))
    `(org-agenda-structure-secondary ((,c :inherit font-lock-doc-face)))
    `(org-archived ((,c :background ,mantle :foreground ,text)))
    `(org-block ((,c :background ,mantle :foreground ,text :extend t)))
    `(org-block-begin-line ((,c :inherit org-meta-line :background ,mantle :extend t)))
    `(org-block-end-line ((,c :inherit org-block-begin-line)))
    `(org-checkbox ((,c :foreground ,yellow)))
    `(org-checkbox-statistics-done ((,c :inherit org-done)))
    `(org-checkbox-statistics-todo ((,c :inherit org-todo)))
    `(org-clock-overlay ((,c :inherit secondary-selection)))
    `(org-code ((,c :foreground ,green)))
    `(org-column ((,c :background ,surface0)))
    `(org-column-title ((,c :inherit org-column :weight bold :underline t)))
    `(org-date ((,c :inherit org-agenda-date)))
    `(org-date-selected ((,c :inherit org-date :inverse-video t)))
    `(org-dispatcher-highlight ((,c :background ,mantle :foreground ,text :weight bold)))
    `(org-document-info ((,c :foreground ,sapphire)))
    `(org-document-info-keyword ((,c :inherit shadow)))
    `(org-document-title ((,c :foreground ,sky :weight bold)))
    `(org-done ((,c :foreground ,green)))
    `(org-drawer ((,c :foreground ,subtext0)))
    `(org-ellipsis ((,c :inherit shadow)))
    `(org-footnote ((,c :foreground ,mauve)))
    `(org-formula ((,c :foreground ,pink)))
    `(org-headline-done ((,c :inherit org-done)))
    `(org-headline-todo ((,c :inherit org-todo)))
    `(org-hide ((,c :foreground ,base)))
    `(org-indent ((,c :inherit org-hide)))
    `(org-imminent-deadline ((,c :foreground ,red :weight bold)))
    `(org-latex-and-related ((,c :foreground ,sapphire)))
    `(org-level-1 ((,c :inherit outline-1)))
    `(org-level-2 ((,c :inherit outline-2)))
    `(org-level-3 ((,c :inherit outline-3)))
    `(org-level-4 ((,c :inherit outline-4)))
    `(org-level-5 ((,c :inherit outline-5)))
    `(org-level-6 ((,c :inherit outline-6)))
    `(org-level-7 ((,c :inherit outline-7)))
    `(org-level-8 ((,c :inherit outline-8)))
    `(org-link ((,c :inherit link)))
    `(org-list-dt ((,c :inherit bold)))
    `(org-macro ((,c :foreground ,pink)))
    `(org-meta-line ((,c :inherit shadow)))
    `(org-mode-line-clock-overrun ((,c :inherit mode-line :foreground ,red)))
    `(org-priority ((,c :foreground ,yellow)))
    `(org-quote ((,c :inherit org-block)))
    `(org-scheduled ((,c :foreground ,green)))
    `(org-scheduled-previously ((,c :foreground ,teal)))
    `(org-scheduled-today ((,c :foreground ,green :weight bold)))
    `(org-sexp-date ((,c :foreground ,subtext0)))
    `(org-special-keyword ((,c :inherit font-lock-keyword-face)))
    `(org-table ((,c :foreground ,subtext1)))
    `(org-table-header ((,c :inherit (bold org-table))))
    `(org-tag ((,c :foreground ,blue :weight bold)))
    `(org-tag-group ((,c :inherit org-tag)))
    `(org-target ((,c :underline t)))
    `(org-time-grid ((,c :foreground ,subtext0)))
    `(org-todo ((,c :foreground ,peach)))
    `(org-upcoming-deadline ((,c :foreground ,maroon)))
    `(org-upcoming-distant-deadline ((,c :foreground ,text)))
    `(org-verbatim ((,c :foreground ,pink)))
    `(org-verse ((,c :inherit org-block)))
    `(org-warning ((,c :inherit warning)))

    ;; outline
    `(outline-1 ((,c :foreground ,red :weight bold)))
    `(outline-2 ((,c :foreground ,peach :weight bold)))
    `(outline-3 ((,c :foreground ,yellow :weight bold)))
    `(outline-4 ((,c :foreground ,green :weight bold)))
    `(outline-5 ((,c :foreground ,sapphire :weight bold)))
    `(outline-6 ((,c :foreground ,lavender :weight bold)))
    `(outline-7 ((,c :foreground ,mauve :weight bold)))
    `(outline-8 ((,c :foreground ,maroon :weight bold)))

    ;; regexp-builder
    `(reb-match-0 ((,c :background ,bg-blue-intense :foreground ,text)))
    `(reb-match-1 ((,c :background ,bg-green-intense :foreground ,text)))
    `(reb-match-2 ((,c :background ,bg-red-intense :foreground ,text)))
    `(reb-match-3 ((,c :background ,bg-mauve-intense :foreground ,text)))
    `(reb-regexp-grouping-backslash ((,c :inherit font-lock-regexp-grouping-backslash)))
    `(reb-regexp-grouping-construct ((,c :inherit font-lock-regexp-grouping-construct)))

    ;; shell
    `(sh-heredoc ((,c :inherit font-lock-string-face)))
    `(sh-quoted-exec ((,c :inherit font-lock-builtin-face)))

    ;; show-paren
    `(show-paren-match ((,c :foreground ,pink :weight bold)))
    `(show-paren-match-expression ((,c :inherit match)))
    `(show-paren-mismatch ((,c :inherit warning)))

    ;; tab-bar
    `(tab-bar ((,c :background ,mantle :foreground ,subtext0)))
    `(tab-bar-tab ((,c :background ,base :foreground ,text :weight bold)))
    `(tab-bar-tab-group-current ((,c :background ,base :foreground ,text :weight bold)))
    `(tab-bar-tab-group-inactive ((,c :background ,surface0 :foreground ,subtext0)))
    `(tab-bar-tab-highlight ((,c :background ,surface1)))
    `(tab-bar-tab-inactive ((,c :background ,surface0 :foreground ,subtext0)))
    `(tab-bar-tab-ungrouped ((,c :inherit tab-bar-tab-inactive)))

    ;; tab-line
    `(tab-line ((,c :inherit tab-bar)))
    `(tab-line-close-highlight ((,c :foreground ,peach)))
    `(tab-line-highlight ((,c :background ,surface1)))
    `(tab-line-tab ((,c :inherit tab-bar-tab)))
    `(tab-line-tab-current ((,c :inherit tab-line-tab)))
    `(tab-line-tab-inactive ((,c :inherit tab-bar-tab-inactive)))
    `(tab-line-tab-inactive-alternate ((,c :inherit tab-line-tab-inactive)))
    `(tab-line-tab-modified ((,c :foreground ,yellow)))

    ;; vertico
    `(vertico-current ((,c :background ,highlight :weight bold)))

    ;; vundo
    `(vundo-default ((,c :inherit shadow)))
    `(vundo-highlight ((,c :inherit (bold vundo-node) :foreground ,red)))
    `(vundo-last-saved ((,c :inherit (bold vundo-node) :foreground ,blue)))
    `(vundo-saved ((,c :inherit vundo-mode :foreground ,lavender)))

    ;; which-func-mode
    `(which-func ((,c :inherit font-lock-function-name-face)))

    ;; which-key
    `(which-key-command-description-face ((,c :foreground ,text)))
    `(which-key-group-description-face ((,c :foreground ,mauve)))
    `(which-key-highlighted-command-face ((,c :inherit warning :underline t)))
    `(which-key-key-face ((,c :inherit bold :foreground ,blue)))
    `(which-key-local-map-description-face ((,c :foreground ,green)))
    `(which-key-note-face ((,c :inherit shadow)))
    `(which-key-separator-face ((,c :inherit shadow)))
    `(which-key-special-key-face ((,c :inherit error)))

    ;; whitespace
    `(whitespace-big-indent ((,c :background ,bg-red-intense)))
    `(whitespace-empty ((,c :inherit warning)))
    `(whitespace-hspace ((,c :background unspecified :foreground ,subtext0)))
    `(whitespace-indentation ((,c :foreground ,surface0)))
    `(whitespace-line ((,c :underline (:style wave :color ,mauve))))
    `(whitespace-newline ((,c :inherit shadow)))
    `(whitespace-space ((,c :inherit shadow)))
    `(whitespace-space-after-tab ((,c :inherit warning)))
    `(whitespace-space-before-tab ((,c :inherit warning)))
    `(whitespace-tab ((,c :inherit whitespace-newline)))
    `(whitespace-trailing ((,c :inherit trailing-whitespace)))

    ;; window-divider-mode
    `(window-divider ((,c :foreground ,surface0)))
    `(window-divider-first-pixel ((,c :foreground ,crust)))
    `(window-divider-last-pixel ((,c :foreground ,crust)))
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
(defun catppuccin-themes-theme (name family description background-mode palette overrides)
  "Define a Catppuccin theme.
NAME is the name of the theme. FAMILY is the collection of themes it belongs to.
DESCRIPTION is its documentation string. BACKGROUND-MODE is either `dark' or `light',
in reference to the theme's background color. OVERRIDES are appended to PALETTE."
  (let* ((palette-overrides-v (append (symbol-value overrides) (symbol-value palette)))
         (colors (delete-dups (mapcar #'car palette-overrides-v)))
         (theme-exists-p (custom-theme-p name)))
    (unless theme-exists-p
      (custom-declare-theme
       name (intern (format "%s-theme" name)) description
       (list :kind 'color-scheme :background-mode background-mode :family family)))
    (eval
     `(let* ((c '((class color) (min-colors 256)))
             ,@(mapcar (lambda (color)
                         (list color (alist-get color palette-overrides-v)))
                       colors))
        (custom-theme-set-faces ',name ,@catppuccin-themes-faces)
        (custom-theme-set-variables ',name ,@catppuccin-themes-custom-variables)))
    (unless theme-exists-p
      (provide-theme name))))

;;;; Use theme colors

(defmacro catppuccin-themes-with-colors (&rest body)
  "Evaluate BODY with colors from current palette bound."
  (declare (indent 0))
  (let* ((theme (or (car (seq-filter
                          (lambda (th)
                            (when-let* ((properties (get th 'theme-properties))
                                        (family (plist-get properties :family)))
                              (eq family 'catppuccin-themes)))
                          custom-enabled-themes))
                    (user-error "No enabled catppuccin theme could be found")))
         (palette-overrides-v (append (symbol-value (intern-soft (format "%s-palette-overrides" theme)))
                                      (symbol-value (intern-soft (format "%s-palette" theme)))))
         (colors (delete-dups (mapcar #'car palette-overrides-v))))
    `(let* ((c '((class color) (min-colors 256)))
            ,@(mapcar (lambda (color)
                        (list color (alist-get color palette-overrides-v)))
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

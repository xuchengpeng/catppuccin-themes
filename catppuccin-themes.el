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
    `(secondary-selection ((,c :background ,surface0 :foreground unspecified)))
    `(shadow ((,c :foreground ,overlay0)))
    `(success ((,c :foreground ,green :weight bold)))
    `(warning ((,c :foreground ,yellow :weight bold)))
    `(error ((,c :foreground ,red :weight bold)))
    `(tooltip ((,c :background ,surface0 :foreground ,overlay2)))
    `(trailing-whitespace ((,c :inherit warning)))
    `(border ((,c :background ,mantle :foreground ,text)))
    `(window-divider ((,c :foreground ,mantle)))
    `(vertical-border ((,c :foreground ,mantle)))
    `(child-frame-border ((,c :background ,mantle)))

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

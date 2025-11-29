;;; catppuccin-latte-theme.el --- Catppuccin latte. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'catppuccin-themes)

(defconst catppuccin-latte-base-colors
  '((rosewater "#dc8a78")
    (flamingo "#dd7878")
    (pink "#ea76cb")
    (mauve "#8839ef")
    (red "#d20f39")
    (maroon "#e64553")
    (peach "#fe640b")
    (yellow "#df8e1d")
    (green "#40a02b")
    (teal "#179299")
    (sky "#04a5e5")
    (sapphire "#209fb5")
    (blue "#1e66f5")
    (lavender "#7287fd")
    (text "#4c4f69")
    (subtext1 "#5c5f77")
    (subtext0 "#6c6f85")
    (overlay2 "#7c7f93")
    (overlay1 "#8c8fa1")
    (overlay0 "#9ca0b0")
    (surface2 "#acb0be")
    (surface1 "#bcc0cc")
    (surface0 "#ccd0da")
    (base "#eff1f5")
    (mantle "#e6e9ef")
    (crust "#dce0e8"))
  "Catppuccin latte base colors.")

(defconst catppuccin-latte-palette
  (append
   (let* ((base-colors catppuccin-latte-base-colors)
          (bg-main (car (alist-get 'base base-colors)))
          (six-colors (seq-filter
                       (lambda (color)
                         (memq (car color) '(red green yellow blue mauve teal)))
                       base-colors))
          (derived-colors nil))
     (pcase-dolist (`(,name ,value) six-colors)
       (push (list (intern (format "%s-warmer" name)) (catppuccin-themes-darken (catppuccin-themes-blend value "#ff0000" 0.9) 20)) derived-colors)
       (push (list (intern (format "%s-cooler" name)) (catppuccin-themes-darken (catppuccin-themes-blend value "#0000ff" 0.9) 20)) derived-colors)
       (push (list (intern (format "%s-faint" name)) (catppuccin-themes-darken value 10)) derived-colors)
       (push (list (intern (format "%s-intense" name)) (catppuccin-themes-lighten value 5)) derived-colors)
       (push (list (intern (format "bg-%s-intense" name)) (catppuccin-themes-lighten value 35)) derived-colors)
       (push (list (intern (format "bg-%s-subtle" name)) (catppuccin-themes-lighten value 55))  derived-colors)
       (push (list (intern (format "bg-%s-nuanced" name)) (catppuccin-themes-lighten value 75)) derived-colors))
     (push (list (intern "highlight") (catppuccin-themes-darken bg-main 5)) derived-colors)
     (append
      base-colors
      derived-colors))
   catppuccin-themes-common-palette-mappings)
  "Catppuccin latte palette.")

(defcustom catppuccin-latte-palette-overrides nil
  "Overrides for `catppuccin-latte-palette'."
  :group 'catppuccin-themes
  :type 'alist)

(modus-themes-theme
 'catppuccin-latte
 'catppuccin-themes
 "Catppuccin latte."
 'light
 'modus-operandi-palette
 'catppuccin-latte-palette
 'catppuccin-latte-palette-overrides)

;;; catppuccin-latte-theme.el ends here

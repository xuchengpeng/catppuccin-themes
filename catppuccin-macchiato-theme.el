;;; catppuccin-macchiato-theme.el --- Catppuccin macchiato. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'catppuccin-themes)

(defconst catppuccin-macchiato-base-colors
  '((rosewater "#f4dbd6")
    (flamingo "#f0c6c6")
    (pink "#f5bde6")
    (mauve "#c6a0f6")
    (red "#ed8796")
    (maroon "#ee99a0")
    (peach "#f5a97f")
    (yellow "#eed49f")
    (green "#a6da95")
    (teal "#8bd5ca")
    (sky "#91d7e3")
    (sapphire "#7dc4e4")
    (blue "#8aadf4")
    (lavender "#b7bdf8")
    (text "#cad3f5")
    (subtext1 "#b8c0e0")
    (subtext0 "#a5adcb")
    (overlay2 "#939ab7")
    (overlay1 "#8087a2")
    (overlay0 "#6e738d")
    (surface2 "#5b6078")
    (surface1 "#494d64")
    (surface0 "#363a4f")
    (base "#24273a")
    (mantle "#1e2030")
    (crust "#181926"))
  "Catppuccin macchiato base colors.")

(defconst catppuccin-macchiato-palette
  (append
   (let* ((base-colors catppuccin-macchiato-base-colors)
          (bg-main (car (alist-get 'base base-colors)))
          (six-colors (seq-filter
                       (lambda (color)
                         (memq (car color) '(red green yellow blue mauve teal)))
                       base-colors))
          (derived-colors nil))
     (pcase-dolist (`(,name ,value) six-colors)
       (push (list (intern (format "%s-warmer" name)) (catppuccin-themes-lighten (catppuccin-themes-blend value "#ff0000" 0.9) 20)) derived-colors)
       (push (list (intern (format "%s-cooler" name)) (catppuccin-themes-lighten (catppuccin-themes-blend value "#0000ff" 0.9) 20)) derived-colors)
       (push (list (intern (format "%s-faint" name)) (catppuccin-themes-lighten value 10)) derived-colors)
       (push (list (intern (format "%s-intense" name)) (catppuccin-themes-darken value 5)) derived-colors)
       (push (list (intern (format "bg-%s-intense" name)) (catppuccin-themes-darken value 35)) derived-colors)
       (push (list (intern (format "bg-%s-subtle" name)) (catppuccin-themes-darken value 55))  derived-colors)
       (push (list (intern (format "bg-%s-nuanced" name)) (catppuccin-themes-darken value 75)) derived-colors))
     (push (list (intern "highlight") (catppuccin-themes-lighten bg-main 5)) derived-colors)
     (append
      base-colors
      derived-colors))
   catppuccin-themes-common-palette-mappings)
  "Catppuccin macchiato palette.")

(defcustom catppuccin-macchiato-palette-overrides nil
  "Overrides for `catppuccin-macchiato-palette'."
  :group 'catppuccin-themes
  :type 'alist)

(modus-themes-theme
 'catppuccin-macchiato
 'catppuccin-themes
 "Catppuccin macchiato."
 'dark
 'modus-vivendi-palette
 'catppuccin-macchiato-palette
 'catppuccin-macchiato-palette-overrides)

;;; catppuccin-macchiato-theme.el ends here

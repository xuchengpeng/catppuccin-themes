;;; catppuccin-mocha-theme.el --- Catppuccin mocha. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'catppuccin-themes)

(defconst catppuccin-mocha-base-colors
  '((rosewater "#f5e0dc")
    (flamingo "#f2cdcd")
    (pink "#f5c2e7")
    (mauve "#cba6f7")
    (red "#f38ba8")
    (maroon "#eba0ac")
    (peach "#fab387")
    (yellow "#f9e2af")
    (green "#a6e3a1")
    (teal "#94e2d5")
    (sky "#89dceb")
    (sapphire "#74c7ec")
    (blue "#89b4fa")
    (lavender "#b4befe")
    (text "#cdd6f4")
    (subtext1 "#bac2de")
    (subtext0 "#a6adc8")
    (overlay2 "#9399b2")
    (overlay1 "#7f849c")
    (overlay0 "#6c7086")
    (surface2 "#585b70")
    (surface1 "#45475a")
    (surface0 "#313244")
    (base "#1e1e2e")
    (mantle "#181825")
    (crust "#11111b"))
  "Catppuccin mocha base colors.")

(defconst catppuccin-mocha-palette
  (append
   (let* ((base-colors catppuccin-mocha-base-colors)
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
       (push (list (intern (format "bg-%s-intense" name)) (catppuccin-themes-darken value 30)) derived-colors)
       (push (list (intern (format "bg-%s-subtle" name)) (catppuccin-themes-darken value 50))  derived-colors)
       (push (list (intern (format "bg-%s-nuanced" name)) (catppuccin-themes-darken value 70)) derived-colors))
     (push (list (intern "highlight") (catppuccin-themes-lighten bg-main 5)) derived-colors)
     (append
      base-colors
      derived-colors))
   catppuccin-themes-common-palette-mappings)
  "Catppuccin mocha palette.")

(defcustom catppuccin-mocha-palette-overrides nil
  "Overrides for `catppuccin-mocha-palette'."
  :group 'catppuccin-themes
  :type 'alist)

(modus-themes-theme
 'catppuccin-mocha
 'catppuccin-themes
 "Catppuccin mocha."
 'dark
 'modus-vivendi-palette
 'catppuccin-mocha-palette
 'catppuccin-mocha-palette-overrides)

;;; catppuccin-mocha-theme.el ends here

;;; catppuccin-frappe-theme.el --- Catppuccin frappe. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'catppuccin-themes)

(defconst catppuccin-frappe-base-colors
  '((rosewater "#f2d5cf")
    (flamingo "#eebebe")
    (pink "#f4b8e4")
    (mauve "#ca9ee6")
    (red "#e78284")
    (maroon "#ea999c")
    (peach "#ef9f76")
    (yellow "#e5c890")
    (green "#a6d189")
    (teal "#81c8be")
    (sky "#99d1db")
    (sapphire "#85c1dc")
    (blue "#8caaee")
    (lavender "#babbf1")
    (text "#c6d0f5")
    (subtext1 "#b5bfe2")
    (subtext0 "#a5adce")
    (overlay2 "#949cbb")
    (overlay1 "#838ba7")
    (overlay0 "#737994")
    (surface2 "#626880")
    (surface1 "#51576d")
    (surface0 "#414559")
    (base "#303446")
    (mantle "#292c3c")
    (crust "#232634"))
  "Catppuccin frappe base colors.")

(defconst catppuccin-frappe-palette
  (append
   (let* ((base-colors catppuccin-frappe-base-colors)
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
  "Catppuccin frappe palette.")

(defcustom catppuccin-frappe-palette-overrides nil
  "Overrides for `catppuccin-frappe-palette'."
  :group 'catppuccin-themes
  :type 'alist)

(modus-themes-theme
 'catppuccin-frappe
 'catppuccin-themes
 "Catppuccin frappe."
 'dark
 'modus-vivendi-palette
 'catppuccin-frappe-palette
 'catppuccin-frappe-palette-overrides)

;;; catppuccin-frappe-theme.el ends here

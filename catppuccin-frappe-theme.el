;;; catppuccin-frappe-theme.el --- Catppuccin frappe. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-and-compile
  (unless (and (fboundp 'require-theme)
               load-file-name
               (equal (file-name-directory load-file-name)
                      (expand-file-name "themes/" data-directory))
               (require-theme 'catppuccin-themes t))
    (require 'catppuccin-themes))

  ;;;###theme-autoload
  (deftheme catppuccin-frappe
    "Catppuccin frappe."
    :background-mode 'dark
    :kind 'color-scheme
    :family 'catppuccin)

  (defconst catppuccin-frappe-palette
    '(;; basic
      (rosewater . "#f2d5cf")
      (flamingo . "#eebebe")
      (pink . "#f4b8e4")
      (mauve . "#ca9ee6")
      (red . "#e78284")
      (maroon . "#ea999c")
      (peach . "#ef9f76")
      (yellow . "#e5c890")
      (green . "#a6d189")
      (teal . "#81c8be")
      (sky . "#99d1db")
      (sapphire . "#85c1dc")
      (blue . "#8caaee")
      (lavender . "#babbf1")
      (text . "#c6d0f5")
      (subtext1 . "#b5bfe2")
      (subtext0 . "#a5adce")
      (overlay2 . "#949cbb")
      (overlay1 . "#838ba7")
      (overlay0 . "#737994")
      (surface2 . "#626880")
      (surface1 . "#51576d")
      (surface0 . "#414559")
      (base . "#303446")
      (mantle . "#292c3c")
      (crust . "#232634")
      ;; accent backgrounds, darken 50%
      (bg-rosewater-intense . "#796a67")
      (bg-flamingo-intense . "#775f5f")
      (bg-pink-intense . "#7a5c72")
      (bg-mauve-intense . "#654f73")
      (bg-red-intense . "#734142")
      (bg-maroon-intense . "#754c4e")
      (bg-peach-intense . "#774f3b")
      (bg-yellow-intense . "#726448")
      (bg-green-intense . "#536844")
      (bg-teal-intense . "#40645f")
      (bg-sky-intense . "#4c686d")
      (bg-sapphire-intense . "#42606e")
      (bg-blue-intense . "#465577")
      (bg-lavender-intense . "#5d5d78")
      ;; extended
      (highlight . "#3a3e4f") ; base lighten 5%
      (added . "#425336") ; green darken 60%
      (added-refine . "#637d52") ; green darken 40%
      (changed . "#5b5039") ; yellow darken 60%
      (changed-refine . "#897856") ; yellow darken 40%
      (removed . "#5c3434") ; red darken 60%
      (removed-refine . "#8a4d4f") ; red darken 40%
      )
    "Catppuccin frappe palette.")

  (defcustom catppuccin-frappe-palette-overrides nil
    "Overrides for `catppuccin-frappe-palette'."
    :group 'catppuccin-themes
    :type 'alist)

  (catppuccin-themes-theme catppuccin-frappe
                           catppuccin-frappe-palette
                           catppuccin-frappe-palette-overrides)

  (provide-theme 'catppuccin-frappe))
;;; catppuccin-frappe-theme.el ends here

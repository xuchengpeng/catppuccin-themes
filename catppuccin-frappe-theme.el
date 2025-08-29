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
      ;; extended
      (highlight . "#3a3e4f") ; base lighten 5%
      (added . "#425437") ; green darken 60%
      (added-refine . "#647d52") ; green darken 40%
      (changed . "#5c503a") ; yellow darken 60%
      (changed-refine . "#897856") ; yellow darken 40%
      (removed . "#5c3435") ; red darken 60%
      (removed-refine . "#8b4e4f") ; red darken 40%
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

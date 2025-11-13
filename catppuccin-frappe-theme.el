;;; catppuccin-frappe-theme.el --- Catppuccin frappe. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'catppuccin-themes)

(defconst catppuccin-frappe-palette
  (append
   '(;; basic
     (rosewater "#f2d5cf")
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
     (crust "#232634")
     ;; accent backgrounds
     (bg-rosewater-intense "#917f7c") ; darken 40%
     (bg-flamingo-intense "#8e7272")
     (bg-pink-intense "#926e88")
     (bg-mauve-intense "#795e8a")
     (bg-red-intense "#8a4d4f")
     (bg-maroon-intense "#8c5b5d")
     (bg-peach-intense "#8f5f46")
     (bg-yellow-intense "#897856")
     (bg-green-intense "#637d52")
     (bg-teal-intense "#4d7872")
     (bg-sky-intense "#5b7d83")
     (bg-sapphire-intense "#4f7384")
     (bg-blue-intense "#54658e")
     (bg-lavender-intense "#6f7090")
     (bg-rosewater-subtle "#6c5f5d") ; darken 55%
     (bg-flamingo-subtle "#6b5555")
     (bg-pink-subtle "#6d5266")
     (bg-mauve-subtle "#5a4767")
     (bg-red-subtle "#673a3b")
     (bg-maroon-subtle "#694446")
     (bg-peach-subtle "#6b4735")
     (bg-yellow-subtle "#675940")
     (bg-green-subtle "#4a5e3d")
     (bg-teal-subtle "#3a5955")
     (bg-sky-subtle "#445e62")
     (bg-sapphire-subtle "#3b5663")
     (bg-blue-subtle "#3f4c6b")
     (bg-lavender-subtle "#53546c")
     (bg-rosewater-nuanced "#483f3e") ; darken 70%
     (bg-flamingo-nuanced "#473939")
     (bg-pink-nuanced "#493744")
     (bg-mauve-nuanced "#3c2f45")
     (bg-red-nuanced "#452727")
     (bg-maroon-nuanced "#462d2e")
     (bg-peach-nuanced "#472f23")
     (bg-yellow-nuanced "#443c2b")
     (bg-green-nuanced "#313e29")
     (bg-teal-nuanced "#263c39")
     (bg-sky-nuanced "#2d3e41")
     (bg-sapphire-nuanced "#273942")
     (bg-blue-nuanced "#2a3347")
     (bg-lavender-nuanced "#373848")
     ;; extended
     (highlight "#3a3e4f") ; base lighten 5%
     )
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

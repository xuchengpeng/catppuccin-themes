;;; catppuccin-latte-theme.el --- Catppuccin latte. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'catppuccin-themes)

(defconst catppuccin-latte-palette
  (append
   '(;; basic
     (rosewater "#dc8a78")
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
     (crust "#dce0e8")
     ;; accent backgrounds
     (bg-rosewater-intense "#eab8ae") ; lighten 40%
     (bg-flamingo-intense "#eaaeae")
     (bg-pink-intense "#f2acdf")
     (bg-mauve-intense "#b788f5")
     (bg-red-intense "#e36f88")
     (bg-maroon-intense "#f08f97")
     (bg-peach-intense "#fea26c")
     (bg-yellow-intense "#ebbb77")
     (bg-green-intense "#8cc67f")
     (bg-teal-intense "#73bdc1")
     (bg-sky-intense "#68c9ef")
     (bg-sapphire-intense "#79c5d2")
     (bg-blue-intense "#78a3f9")
     (bg-lavender-intense "#aab7fd")
     (bg-rosewater-subtle "#efcac2") ; lighten 55%
     (bg-flamingo-subtle "#efc2c2")
     (bg-pink-subtle "#f5c1e7")
     (bg-mauve-subtle "#c9a5f7")
     (bg-red-subtle "#ea93a5")
     (bg-maroon-subtle "#f3abb1")
     (bg-peach-subtle "#feb991")
     (bg-yellow-subtle "#f0cc99")
     (bg-green-subtle "#a9d49f")
     (bg-teal-subtle "#96cdd1")
     (bg-sky-subtle "#8ed6f3")
     (bg-sapphire-subtle "#9ad3dd")
     (bg-blue-subtle "#99bafa")
     (bg-lavender-subtle "#bfc9fe")
     (bg-rosewater-nuanced "#f4dbd6") ; lighten 70%
     (bg-flamingo-nuanced "#f4d6d6")
     (bg-pink-nuanced "#f8d5ef")
     (bg-mauve-nuanced "#dbc3fa")
     (bg-red-nuanced "#f1b7c3")
     (bg-maroon-nuanced "#f7c7cb")
     (bg-peach-nuanced "#fed0b5")
     (bg-yellow-nuanced "#f5ddbb")
     (bg-green-nuanced "#c5e2bf")
     (bg-teal-nuanced "#b9dee0")
     (bg-sky-nuanced "#b3e3f7")
     (bg-sapphire-nuanced "#bce2e8")
     (bg-blue-nuanced "#bbd1fc")
     (bg-lavender-nuanced "#d4dbfe")
     ;; extended
     (highlight "#e3e4e8") ; base darken 5%
     )
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

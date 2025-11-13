;;; catppuccin-macchiato-theme.el --- Catppuccin macchiato. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'catppuccin-themes)

(defconst catppuccin-macchiato-palette
  (append
   '(;; basic
     (rosewater "#f4dbd6")
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
     (crust "#181926")
     ;; accent backgrounds
     (bg-rosewater-intense "#928380") ; darken 40%
     (bg-flamingo-intense "#907676")
     (bg-pink-intense "#93718a")
     (bg-mauve-intense "#766093")
     (bg-red-intense "#8e515a")
     (bg-maroon-intense "#8e5b60")
     (bg-peach-intense "#93654c")
     (bg-yellow-intense "#8e7f5f")
     (bg-green-intense "#638259")
     (bg-teal-intense "#537f79")
     (bg-sky-intense "#568188")
     (bg-sapphire-intense "#4a7588")
     (bg-blue-intense "#526792")
     (bg-lavender-intense "#6d7194")
     (bg-rosewater-subtle "#6d6260") ; darken 55%
     (bg-flamingo-subtle "#6b5959")
     (bg-pink-subtle "#6e5567")
     (bg-mauve-subtle "#59476e")
     (bg-red-subtle "#6a3c43")
     (bg-maroon-subtle "#6b4447")
     (bg-peach-subtle "#6e4c39")
     (bg-yellow-subtle "#6b5f47")
     (bg-green-subtle "#4a6243")
     (bg-teal-subtle "#3e5f5a")
     (bg-sky-subtle "#416066")
     (bg-sapphire-subtle "#385866")
     (bg-blue-subtle "#3e4d6d")
     (bg-lavender-subtle "#52556f")
     (bg-rosewater-nuanced "#494140") ; darken 70%
     (bg-flamingo-nuanced "#483b3b")
     (bg-pink-nuanced "#493845")
     (bg-mauve-nuanced "#3b3049")
     (bg-red-nuanced "#47282d")
     (bg-maroon-nuanced "#472d30")
     (bg-peach-nuanced "#493226")
     (bg-yellow-nuanced "#473f2f")
     (bg-green-nuanced "#31412c")
     (bg-teal-nuanced "#293f3c")
     (bg-sky-nuanced "#2b4044")
     (bg-sapphire-nuanced "#253a44")
     (bg-blue-nuanced "#293349")
     (bg-lavender-nuanced "#36384a")
     ;; extended
     (highlight "#2e3143") ; base lighten 5%
     )
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

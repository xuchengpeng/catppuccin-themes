;;; catppuccin-mocha-theme.el --- Catppuccin mocha. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'catppuccin-themes)

(defconst catppuccin-mocha-palette
  (append
   '(;; basic
     (rosewater "#f5e0dc")
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
     (crust "#11111b")
     ;; accent backgrounds
     (bg-rosewater-intense "#938684") ; darken 40%
     (bg-flamingo-intense "#917b7b")
     (bg-pink-intense "#93748a")
     (bg-mauve-intense "#796394")
     (bg-red-intense "#915364")
     (bg-maroon-intense "#8c6067")
     (bg-peach-intense "#956b51")
     (bg-yellow-intense "#958769")
     (bg-green-intense "#638860")
     (bg-teal-intense "#58877f")
     (bg-sky-intense "#52848c")
     (bg-sapphire-intense "#45778d")
     (bg-blue-intense "#526c95")
     (bg-lavender-intense "#6c7298")
     (bg-rosewater-subtle "#6e6463") ; darken 55%
     (bg-flamingo-subtle "#6c5c5c")
     (bg-pink-subtle "#6e5767")
     (bg-mauve-subtle "#5b4a6f")
     (bg-red-subtle "#6d3e4b")
     (bg-maroon-subtle "#69474d")
     (bg-peach-subtle "#70503c")
     (bg-yellow-subtle "#70654e")
     (bg-green-subtle "#4a6648")
     (bg-teal-subtle "#42655f")
     (bg-sky-subtle "#3d6369")
     (bg-sapphire-subtle "#34596a")
     (bg-blue-subtle "#3d5170")
     (bg-lavender-subtle "#515572")
     (bg-rosewater-nuanced "#494342") ; darken 70%
     (bg-flamingo-nuanced "#483d3d")
     (bg-pink-nuanced "#493a45")
     (bg-mauve-nuanced "#3c314a")
     (bg-red-nuanced "#482932")
     (bg-maroon-nuanced "#463033")
     (bg-peach-nuanced "#4b3528")
     (bg-yellow-nuanced "#4a4334")
     (bg-green-nuanced "#314430")
     (bg-teal-nuanced "#2c433f")
     (bg-sky-nuanced "#294246")
     (bg-sapphire-nuanced "#223b46")
     (bg-blue-nuanced "#29364b")
     (bg-lavender-nuanced "#36394c")
     ;; extended
     (highlight "#292938") ; base lighten 5%
     )
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

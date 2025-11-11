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
     ;; accent backgrounds, lighten 50%
     (bg-rosewater-intense "#edc4bb")
     (bg-flamingo-intense "#eebbbb")
     (bg-pink-intense "#f4bae4")
     (bg-mauve-intense "#c39cf7")
     (bg-red-intense "#e8879c")
     (bg-maroon-intense "#f2a2a9")
     (bg-peach-intense "#feb185")
     (bg-yellow-intense "#efc68e")
     (bg-green-intense "#9fcf95")
     (bg-teal-intense "#8bc8cc")
     (bg-sky-intense "#81d2f2")
     (bg-sapphire-intense "#8fcfda")
     (bg-blue-intense "#8eb2fa")
     (bg-lavender-intense "#b8c3fe")
     ;; extended
     (highlight "#e3e4e8") ; base darken 5%
     (added "#b2d9aa") ; green lighten 60%
     (added-refine "#8cc67f") ; green lighten 40%
     (changed "#f2d1a4") ; yellow lighten 60%
     (changed-refine "#ebbb77") ; yellow lighten 40%
     (removed "#ed9faf") ; red lighten 60%
     (removed-refine "#e36f88") ; red lighten 40%
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

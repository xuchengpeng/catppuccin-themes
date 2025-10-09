;;; catppuccin-mocha-theme.el --- Catppuccin mocha. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-and-compile
  (unless (and (fboundp 'require-theme)
               load-file-name
               (equal (file-name-directory load-file-name)
                      (expand-file-name "themes/" data-directory))
               (require-theme 'catppuccin-themes t))
    (require 'catppuccin-themes))

  (defconst catppuccin-mocha-palette
    '(;; basic
      (rosewater . "#f5e0dc")
      (flamingo . "#f2cdcd")
      (pink . "#f5c2e7")
      (mauve . "#cba6f7")
      (red . "#f38ba8")
      (maroon . "#eba0ac")
      (peach . "#fab387")
      (yellow . "#f9e2af")
      (green . "#a6e3a1")
      (teal . "#94e2d5")
      (sky . "#89dceb")
      (sapphire . "#74c7ec")
      (blue . "#89b4fa")
      (lavender . "#b4befe")
      (text . "#cdd6f4")
      (subtext1 . "#bac2de")
      (subtext0 . "#a6adc8")
      (overlay2 . "#9399b2")
      (overlay1 . "#7f849c")
      (overlay0 . "#6c7086")
      (surface2 . "#585b70")
      (surface1 . "#45475a")
      (surface0 . "#313244")
      (base . "#1e1e2e")
      (mantle . "#181825")
      (crust . "#11111b")
      ;; accent backgrounds, darken 50%
      (bg-rosewater-intense . "#7a706e")
      (bg-flamingo-intense . "#796666")
      (bg-pink-intense . "#7a6173")
      (bg-mauve-intense . "#65537b")
      (bg-red-intense . "#794554")
      (bg-maroon-intense . "#755056")
      (bg-peach-intense . "#7d5943")
      (bg-yellow-intense . "#7c7157")
      (bg-green-intense . "#537150")
      (bg-teal-intense . "#4a716a")
      (bg-sky-intense . "#446e75")
      (bg-sapphire-intense . "#3a6376")
      (bg-blue-intense . "#445a7d")
      (bg-lavender-intense . "#5a5f7f")
      ;; extended
      (highlight . "#292938") ; base lighten 5%
      (added . "#425a40") ; green darken 60%
      (added-refine . "#638860") ; green darken 40%
      (changed . "#635a46") ; yellow darken 60%
      (changed-refine . "#958769") ; yellow darken 40%
      (removed . "#613743") ; red darken 60%
      (removed-refine . "#915364") ; red darken 40%
      )
    "Catppuccin mocha palette.")

  (defcustom catppuccin-mocha-palette-overrides nil
    "Overrides for `catppuccin-mocha-palette'."
    :group 'catppuccin-themes
    :type 'alist)

  (catppuccin-themes-theme
    catppuccin-mocha
    catppuccin-themes
    "Catppuccin mocha."
    dark
    catppuccin-mocha-palette
    catppuccin-mocha-palette-overrides))

;;; catppuccin-mocha-theme.el ends here

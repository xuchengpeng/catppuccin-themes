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

  (defvar catppuccin-mocha-palette
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
      (crust "#11111b")
      ;; extended
      (cursor-line "#292938") ; base lighten 5%
      (bg-added "#425a40") ; green darken 60%
      (bg-added-refine "#638860") ; green darken 40%
      (bg-changed "#364864") ; blue darken 60%
      (bg-changed-refine "#526c95") ; blue darken 40%
      (bg-removed "#613743") ; red darken 60%
      (bg-removed-refine "#915364") ; red darken 40%
      )
    "Catppuccin mocha base colors.")

  (catppuccin-themes-define-theme catppuccin-mocha dark "Catppuccin mocha"))

(provide 'catppuccin-mocha-theme)
;;; catppuccin-mocha-theme.el ends here

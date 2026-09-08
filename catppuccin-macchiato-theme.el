;;; catppuccin-macchiato-theme.el --- Catppuccin macchiato. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(eval-and-compile
  (unless (and (fboundp 'require-theme)
               load-file-name
               (equal (file-name-directory load-file-name)
                      (expand-file-name "themes/" data-directory))
               (require-theme 'catppuccin-themes t))
    (require 'catppuccin-themes))

  (defvar catppuccin-macchiato-palette
    '((rosewater "#f4dbd6")
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
      ;; extended
      (cursor-line . "#2e3143") ; base lighten 5%
      (bg-added "#42573b") ; green darken 60%
      (bg-added-refine "#638259") ; green darken 40%
      (bg-changed "#374561") ; blue darken 60%
      (bg-changed-refine "#526792") ; blue darken 40%
      (bg-removed "#5e363c") ; red darken 60%
      (bg-removed-refine "#8e515a") ; red darken 40%
      )
    "Catppuccin macchiato base colors.")

  (catppuccin-themes-define-theme catppuccin-macchiato dark "Catppuccin macchiato"))

(provide 'catppuccin-macchiato-theme)
;;; catppuccin-macchiato-theme.el ends here

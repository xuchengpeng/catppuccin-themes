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

  (defvar catppuccin-frappe-palette
    '((rosewater "#f2d5cf")
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
      ;; extended
      (cursor-line "#3a3e4f") ; base lighten 5%
      (bg-added "#425336") ; green darken 60%
      (bg-added-refine "#637d52") ; green darken 40%
      (bg-changed "#38445f") ; blue darken 60%
      (bg-changed-refine "#54658e") ; blue darken 40%
      (bg-removed "#5c3434") ; red darken 60%
      (bg-removed-refine "#8a4d4f") ; red darken 40%
      )
    "Catppuccin frappe base colors.")

  (catppuccin-themes-define-theme catppuccin-frappe dark "Catppuccin frappe"))

(provide 'catppuccin-frappe-theme)
;;; catppuccin-frappe-theme.el ends here

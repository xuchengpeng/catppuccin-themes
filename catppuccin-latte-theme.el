;;; catppuccin-latte-theme.el --- Catppuccin latte. -*- lexical-binding: t -*-
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
  (deftheme catppuccin-latte
    "Catppuccin latte."
    :background-mode 'light
    :kind 'color-scheme
    :family 'catppuccin)

  (defconst catppuccin-latte-palette
    '(;; basic
      (rosewater . "#dc8a78")
      (flamingo . "#dd7878")
      (pink . "#ea76cb")
      (mauve . "#8839ef")
      (red . "#d20f39")
      (maroon . "#e64553")
      (peach . "#fe640b")
      (yellow . "#df8e1d")
      (green . "#40a02b")
      (teal . "#179299")
      (sky . "#04a5e5")
      (sapphire . "#209fb5")
      (blue . "#1e66f5")
      (lavender . "#7287fd")
      (text . "#4c4f69")
      (subtext1 . "#5c5f77")
      (subtext0 . "#6c6f85")
      (overlay2 . "#7c7f93")
      (overlay1 . "#8c8fa1")
      (overlay0 . "#9ca0b0")
      (surface2 . "#acb0be")
      (surface1 . "#bcc0cc")
      (surface0 . "#ccd0da")
      (base . "#eff1f5")
      (mantle . "#e6e9ef")
      (crust . "#dce0e8")
      ;; extended
      (highlight . "#e3e4e8") ; base darken 5%
      )
    "Catppuccin latte palette.")

  (defcustom catppuccin-latte-palette-overrides nil
    "Overrides for `catppuccin-latte-palette'."
    :group 'catppuccin-themes
    :type 'alist)

  (catppuccin-themes-theme catppuccin-latte
                           catppuccin-latte-palette
                           catppuccin-latte-palette-overrides)

  (provide-theme 'catppuccin-latte))
;;; catppuccin-latte-theme.el ends here

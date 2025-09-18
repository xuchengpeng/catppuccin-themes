# catppuccin-themes

[![Last commit](https://img.shields.io/github/last-commit/xuchengpeng/catppuccin-themes?style=flat-square)](https://github.com/xuchengpeng/catppuccin-themes/pulse)
[![License](https://img.shields.io/github/license/xuchengpeng/catppuccin-themes?style=flat-square)](https://github.com/xuchengpeng/catppuccin-themes/blob/main/LICENSE)
[![Repo size](https://img.shields.io/github/repo-size/xuchengpeng/catppuccin-themes?style=flat-square)](https://github.com/xuchengpeng/catppuccin-themes)
[![Made for Emacs](https://img.shields.io/badge/Made_for-Emacs-blueviolet.svg?style=flat-square)](https://www.gnu.org/software/emacs/)

## Install

Load the theme in your configuration:

``` emacs-lisp
(use-package catppuccin-themes
  :vc (:url "https://github.com/xuchengpeng/catppuccin-themes")
  :config
  (load-theme 'catppuccin-mocha :no-confirm))
```

## Customize

1. Add plugin support, for example:
   ``` emacs-lisp
   (defun +catppuccin-themes-custom-faces (&rest _)
    (catppuccin-themes-with-colors
      (custom-set-faces
       `(echo-bar-red-face ((,c :foreground ,red)))
       `(echo-bar-green-face ((,c :foreground ,green)))
       `(echo-bar-yellow-face ((,c :foreground ,yellow)))
       `(echo-bar-blue-face ((,c :foreground ,blue)))
       `(echo-bar-magenta-face ((,c :foreground ,mauve)))
       `(echo-bar-cyan-face ((,c :foreground ,teal)))
       `(echo-bar-gray-face ((,c :foreground ,overlay2))))))
   (add-hook 'enable-theme-functions #'+catppuccin-themes-custom-faces)
   ```

2. Change color palettes by customize `catppuccin-<style>-palette-overrides`, style is an choice with `latte`, `frappe`, `macchiato` or `mocha`:
   ``` emacs-lisp
   (setq catppuccin-latte-palette-overrides
         '((blue . "#2e7de9")
           (sky . "#007197")))
   ```


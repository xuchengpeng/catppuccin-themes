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
  :init
  (catppuccin-themes-take-over-modus-themes-mode 1)
  :config
  (modus-themes-load-theme 'catppuccin-latte))
```

## Customize

1. Add plugin support, evaluate the code with a function after loading catppuccin-themes, for example:
   ``` emacs-lisp
   (defun +catppuccin-themes-custom-faces (&rest _)
    (modus-themes-with-colors
      (custom-set-faces
       `(echo-bar-red-face ((,c :foreground ,red)))
       `(echo-bar-green-face ((,c :foreground ,green)))
       `(echo-bar-yellow-face ((,c :foreground ,yellow)))
       `(echo-bar-blue-face ((,c :foreground ,blue)))
       `(echo-bar-magenta-face ((,c :foreground ,mauve)))
       `(echo-bar-cyan-face ((,c :foreground ,teal)))
       `(echo-bar-gray-face ((,c :foreground ,overlay2))))))
   (add-hook 'modus-themes-after-load-theme-hook #'+catppuccin-themes-custom-faces)
   ```

2. Change color palettes by customize `catppuccin-<style>-palette-overrides`, style is an choice with `latte`, `frappe`, `macchiato` or `mocha`:
   ``` emacs-lisp
   (setq catppuccin-latte-palette-overrides
         '((blue . "#2e7de9")
           (sky . "#007197")))
   ```


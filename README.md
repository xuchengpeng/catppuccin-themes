# catppuccin-themes

[![Last commit](https://img.shields.io/github/last-commit/xuchengpeng/catppuccin-themes?style=flat-square)](https://github.com/xuchengpeng/catppuccin-themes/pulse)
[![License](https://img.shields.io/github/license/xuchengpeng/catppuccin-themes?style=flat-square)](https://github.com/xuchengpeng/catppuccin-themes/blob/main/LICENSE)
[![Repo size](https://img.shields.io/github/repo-size/xuchengpeng/catppuccin-themes?style=flat-square)](https://github.com/xuchengpeng/catppuccin-themes)
[![Made for Emacs](https://img.shields.io/badge/Made_for-Emacs-blueviolet.svg?style=flat-square)](https://www.gnu.org/software/emacs/)

Load the theme in your configuration:

``` emacs-lisp
(use-package catppuccin-themes
  :vc (:url "https://github.com/xuchengpeng/catppuccin-themes")
  :config
  (catppuccin-themes-load-theme 'catppuccin-latte)
  (keymap-global-set "<f5>" #'catppuccin-themes-toggle))
```

To add support for faces of other packages or your own faces, for example:

``` emacs-lisp
(defun +themes-custom-faces (&rest _)
  (catppuccin-themes-with-colors
    (custom-set-faces
     `(echo-bar-red-face ((t :foreground ,red)))
     `(echo-bar-green-face ((t :foreground ,green)))
     `(echo-bar-yellow-face ((t :foreground ,yellow)))
     `(echo-bar-blue-face ((t :foreground ,blue)))
     `(echo-bar-magenta-face ((t :foreground ,mauve)))
     `(echo-bar-cyan-face ((t :foreground ,sky)))
     `(echo-bar-gray-face ((t :foreground ,subtext0))))))
(add-hook 'catppuccin-themes-after-load-theme-hook #'+themes-custom-faces)
```

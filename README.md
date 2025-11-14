# catppuccin-themes

[![Last commit](https://img.shields.io/github/last-commit/xuchengpeng/catppuccin-themes?style=flat-square)](https://github.com/xuchengpeng/catppuccin-themes/pulse)
[![License](https://img.shields.io/github/license/xuchengpeng/catppuccin-themes?style=flat-square)](https://github.com/xuchengpeng/catppuccin-themes/blob/main/LICENSE)
[![Repo size](https://img.shields.io/github/repo-size/xuchengpeng/catppuccin-themes?style=flat-square)](https://github.com/xuchengpeng/catppuccin-themes)
[![Made for Emacs](https://img.shields.io/badge/Made_for-Emacs-blueviolet.svg?style=flat-square)](https://www.gnu.org/software/emacs/)

Load the theme in your configuration:

``` emacs-lisp
(use-package catppuccin-themes
  :vc (:url "https://github.com/xuchengpeng/catppuccin-themes")
  :init
  (catppuccin-themes-take-over-modus-themes-mode 1)
  :config
  (modus-themes-load-theme 'catppuccin-latte))
```

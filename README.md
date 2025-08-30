# catppuccin-themes

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
   (catppuccin-themes-with-colors
     (custom-set-faces
       `(git-gutter-fr:added ((,c :foreground ,green)))
       `(git-gutter-fr:deleted ((,c :foreground ,red)))
       `(git-gutter-fr:modified ((,c :foreground ,yellow)))))
   ```

2. Change color palettes by customize `catppuccin-<style>-palette-overrides`, style is an choice with `latte`, `frappe`, `macchiato` or `mocha`:
   ``` emacs-lisp
   (setq catppuccin-latte-palette-overrides
         '((blue . "#2e7de9")
           (sky . "#007197")))
   ```


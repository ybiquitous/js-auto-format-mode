# js-auto-format-mode

Emacs minor mode for auto-formatting JavaScript code.

## Install

```elisp
(unless (package-installed-p 'js-auto-format-mode)
  (url-copy-file "https://raw.githubusercontent.com/ybiquitous/js-auto-format-mode/master/js-auto-format-mode.el" "js-auto-format-mode.el" t)
  (package-install-file "js-auto-format-mode.el")
  (delete-file "js-auto-format-mode.el"))
```

## Release

```sh
git tag -a 0.0.x -m 'version 0.0.x'
```

```sh
git push --tags
```

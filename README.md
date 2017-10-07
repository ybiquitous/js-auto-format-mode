# js-auto-format-mode

Emacs minor mode for auto-formatting JavaScript code.

## Install

```elisp
(unless (package-installed-p 'js-auto-format-mode)
  (url-copy-file "https://raw.githubusercontent.com/ybiquitous/js-auto-format-mode/master/js-auto-format-mode.el" "js-auto-format-mode.el" t)
  (package-install-file "js-auto-format-mode.el")
  (delete-file "js-auto-format-mode.el"))
```

### Install ESLint

```sh
npm install -g eslint
```

### Create `~/.eslintrc` file

```json
{
  "extends": "eslint:recommended"
}
```

For details, please see [ESLint official site](http://eslint.org/).

## Use

### Enable `js-auto-format-mode` in `js-mode`

```elisp
(add-hook 'js-mode-hook 'js-auto-format-mode)
```

### Disabled in any directories

```
M-x add-dir-local-variable RET js-mode RET js-auto-format-disabled RET t
```

### Format only once

```
M-x js-auto-format-execute
```

### Customize

```
M-x customize-group RET js-auto-format RET
```

## Release

```sh
git tag -a 0.0.x -m 'version 0.0.x'
git push --tags
```

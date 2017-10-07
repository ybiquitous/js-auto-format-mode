# js-auto-format-mode

Emacs minor mode for auto-formatting JavaScript code.

## Table of Contents

- [Install](#install)
- [Use](#use)
- [Release](#release)

## Install

```elisp
(unless (package-installed-p 'js-auto-format-mode)
  (url-copy-file "https://raw.githubusercontent.com/ybiquitous/js-auto-format-mode/master/js-auto-format-mode.el" "js-auto-format-mode.el" t)
  (package-install-file "js-auto-format-mode.el")
  (delete-file "js-auto-format-mode.el"))
```

### Install ESLint

```sh
npm install --global eslint
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

### Use Prettier instead of ESLint

#### Install

```sh
npm install --global prettier
```

#### Customize

```elisp
(custom-set-variables
  '(js-auto-format-command "prettier")
  '(js-auto-format-command-args "--write --single-quote --no-semi"))
```

## Release

```sh
git tag -a 0.0.x -m 'version 0.0.x'
git push --tags
```

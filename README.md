# js-auto-format-mode

Emacs minor mode for auto-formatting JavaScript code.

![Demo](demo.gif)

## Table of Contents

- [Install](#install)
- [Use](#use)
- [Release](#release)
- [License](#license)

## Install

### Prerequisites

- Emacs 24+
- [Node.js](https://nodejs.org/)
- [ESLint](https://eslint.org/)

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

For details, please see [ESLint official site](https://eslint.org/).

### MELPA

<kbd>M-x package-install RET js-auto-format-mode RET</kbd>

### `use-package`

```elisp
(use-package js-auto-format-mode)
```

## Use

### Enable `js-auto-format-mode` in `js-mode`

```elisp
(add-hook 'js-mode-hook 'js-auto-format-mode)
```

### Disabled in any directories

<kbd>M-x add-dir-local-variable RET js-mode RET js-auto-format-disabled RET t</kbd>

### Format only once

<kbd>M-x js-auto-format-execute</kbd>

### Customize

<kbd>M-x customize-group RET js-auto-format RET</kbd>

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

## License

[GPLv3](LICENSE) © ybiquitous

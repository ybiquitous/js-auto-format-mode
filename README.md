# js-auto-format-mode

Emacs minor mode for auto-formatting JavaScript code.

By default, [ESLint](https://eslint.org/) is used as the formatter.

![Demo](demo.gif)

## Table of Contents

- [Install](#install)
  - [Prerequisites](#prerequisites)
  - [ESLint](#eslint)
  - [MELPA](#melpa)
- [Use](#use)
  - [Enable](#enable)
  - [Format on demand](#format-on-demand)
  - [Customize](#customize)
  - [Use other formatter](#use-other-formatter)
  - [Disable in any directories](#disable-in-any-directories)
- [Release](#release)
- [License](#license)

## Install

### Prerequisites

- [Emacs 24+](https://www.gnu.org/software/emacs/)

Optional (if you use a different formatter than the default one):

- [Node.js](https://nodejs.org/)
- [ESLint](https://eslint.org/)

### ESLint

Install `eslint` command:

```sh
npm install --global eslint
```

Create `~/.eslintrc` file:

```json
{
  "extends": "eslint:recommended"
}
```

For details, please see [ESLint official site](https://eslint.org/).

**NOTICE**: If you use ESLint in a Node.js project,
`eslint` command installed into your project will be used
(maybe `node_modules/.bin/eslint`) instead of one installed globally.

### MELPA

Install `js-auto-format-mode.el` by [MELPA](https://melpa.org/).

<kbd>M-x package-install RET js-auto-format-mode RET</kbd>

If you use [`use-package`](https://github.com/jwiegley/use-package):

```elisp
(use-package js-auto-format-mode)
```

## Use

### Enable

```elisp
(add-hook 'js-mode-hook #'js-auto-format-mode)

;; if you use js2-mode
(add-hook 'js2-mode-hook #'js-auto-format-mode)
```

### Format on demand

<kbd>M-x js-auto-format-execute</kbd> (or <kbd>M-x j-a-f-e</kbd>)

### Customize

<kbd>M-x customize-group RET js-auto-format RET</kbd> (or <kbd>M-x cus-g RET j-a-f RET</kbd>)

### Use other formatter

For example, in case of using [Prettier](https://prettier.io/).

First, install `prettier` command.

```sh
npm install --global prettier
```

Then, customize `js-auto-format-mode`.

```elisp
(custom-set-variables
  '(js-auto-format-command "prettier")
  '(js-auto-format-command-args "--write --single-quote --no-semi"))
```

### Disable in any directories

<kbd>M-x add-dir-local-variable RET js-mode RET js-auto-format-disabled RET t</kbd>

## Release

For maintainers.

1. `git tag -a x.y.z -m 'version x.y.z'`
1. `git push --tags`

## License

[GPLv3](LICENSE) © ybiquitous

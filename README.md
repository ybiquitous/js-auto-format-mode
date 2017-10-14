# js-auto-format-mode

Emacs minor mode for auto-formatting JavaScript code.

By default, this package uses [ESLint](https://eslint.org/) as formatter.
For details, please see [`--fix`](https://eslint.org/docs/user-guide/command-line-interface#--fix)
option of ESLint command line.

![Demo](demo.gif)

## Table of Contents

- [Install](#install)
  - [Dependencies](#dependencies)
  - [ESLint](#eslint)
  - [MELPA](#melpa)
- [Usage](#usage)
  - [Format on demand](#format-on-demand)
  - [Customize](#customize)
  - [Use other formatter](#use-other-formatter)
  - [Disable in any directories](#disable-in-any-directories)
- [Release](#release)
- [License](#license)

## Install

### Dependencies

- [Emacs 24+](https://www.gnu.org/software/emacs)

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

### MELPA

Install from [MELPA](https://melpa.org/).

<kbd>M-x package-install RET js-auto-format-mode RET</kbd>

## Usage

Recommended configuration:

```elisp
(add-hook 'js-mode-hook #'js-auto-format-mode)

;; if you use js2-mode
(add-hook 'js2-mode-hook #'js-auto-format-mode)
```

If you use `js-auto-format-mode` in a Node.js project,
It is recommended to install also [`add-node-modules-path`](https://github.com/codesuki/add-node-modules-path).
Because this package puts project local `eslint` (that is `node_modules/.bin/eslint`)
before global `eslint`.

If you use [`use-package`](https://github.com/jwiegley/use-package),
installation and configuration are easier:

```elisp
(use-package js-auto-format-mode
  :config
  (add-hook 'js-mode-hook #'js-auto-format-mode))

(use-package add-node-modules-path
  :config
  (add-hook 'js-mode-hook #'add-node-modules-path))
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

# js-auto-format-mode

[![MELPA](https://melpa.org/packages/js-auto-format-mode-badge.svg)](https://melpa.org/#/js-auto-format-mode)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org)

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
  - [Enable in editing CSS](#enable-in-editing-css)
- [Change Log](#change-log)
- [Development](#development)
  - [Setup](#setup)
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
```

**NOTE**: In a Node.js project, it's **recommended** to install
also [`add-node-modules-path`](https://github.com/codesuki/add-node-modules-path),
which puts project local `eslint` (`node_modules/.bin/eslint`) before global `eslint`.

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

<kbd>M-x js-auto-format-execute</kbd>

(or <kbd>M-x j-a-f-e</kbd>)

### Customize

<kbd>M-x customize-group RET js-auto-format RET</kbd>

(or <kbd>M-x cus-g RET j-a-f RET</kbd>)

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

## Enable in editing CSS

```elisp
(defun my/enable-auto-format-on-css ()
  (setq-local js-auto-format-command "prettier")
  (setq-local js-auto-format-command-args "--write --no-color")
  (js-auto-format-mode))
(add-hook 'css-mode-hook #'my/enable-auto-format-on-css)
```

## Change Log

For each release, please see [here](CHANGELOG.md).

## Development

### Setup

1.  `git clone git@github.com:ybiquitous/js-auto-format-mode.gi`
1.  `npm ci`

### Release

1.  `git checkout master`
1.  `git pull`
1.  `npm run release:dry-run`
1.  `npm run release`
1.  `git push --follow-tags`

## License

[GPLv3](LICENSE) © Masafumi Koba

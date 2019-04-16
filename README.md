<!-- TOC depthFrom:2 -->

# Table of Contents
- [1. Installation](#installation)
- [2. Customize](#customize)
- [3. Packages](#packages)
- [4. use-package](#use-package)
- [5. Links](#links)
- [6. To See](#to-see)
  - [6.1. Packages](#to-see_packages)

<!-- /TOC -->

## 1. Installation <a name="installation"></a>

* [Installation with PPA](https://www.reddit.com/r/emacs/comments/8pcw5a/what_is_the_most_painless_way_to_install_emacs_26 "Installation with PPA")
* [kelleyk's PPA](https://launchpad.net/~kelleyk/+archive/ubuntu/emacs "kelleyk's PPA")

```bash
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update
sudo apt install emacs26
```

## 2. Customize <a name="customize"></a>

```lisp
M-x customize
M-x customize-group
M-x customize-themes
M-x customize-...
```

## 3. Packages <a name="packages"></a>

* [ELPA](https://elpa.gnu.org "ELPA")
* [MELPA](https://melpa.org "MELPA")
* [MARMELADE](https://marmalade-repo.org/packages "MARMELADE")

```lisp
M-x package-initialize
M-x package-refresh-contents
M-x list-packages
```

## 4. use-package <a name="use-package"></a>

* [Use-package project](https://jwiegley.github.io/use-package "Use-package project")
* [Use-package Github](https://github.com/jwiegley/use-package "Use-package Github")

```lisp
(use-package <package_name>
	:ensure t
	:command <cmd>
	:init <cmd>
	:bind <keymap list)
	...
)
```

## 5. Links <a name="links"></a>

* [Awesome Emacs](https://github.com/emacs-tw/awesome-emacs "Awesome Emacs")
* [Ladicle's Emacs Configuration](https://ladicle.com/post/config "Ladicle's Emacs Configuration")
* [Python configuration](https://realpython.com/blog/python/emacs-the-best-python-editor "Python configuration")
* [Lupan emacs configuration](https://lupan.pl/dotemacs "Lupan emacs configuration")
* [Cocreature emacs configuration](https://github.com/cocreature/dotfiles/blob/master/emacs/.emacs.d/emacs.org "Cocreature emacs configuration")
* [Arecker emacs configuration](https://github.com/arecker/emacs.d "Arecker emacs configuration")

## 6. To see <a name="to-see"></a>

### 6.1. Packages <a name="to-see_packages"></a>

* [Org-mode](https://www.orgmode.org/fr/index.html "Org-mode")

# Installation

* [Installation with PPA](https://www.reddit.com/r/emacs/comments/8pcw5a/what_is_the_most_painless_way_to_install_emacs_26 "Installation with PPA")
* [kelleyk's PPA](https://launchpad.net/~kelleyk/+archive/ubuntu/emacs "kelleyk's PPA")

```bash
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update
sudo apt install emacs26
```

# Customize

```lisp
M-x customize
M-x customize-group
M-x customize-themes
M-x customize-...
```

# Packages

* [MELPA](https://melpa.org "MELPA")

```lisp
M-x package-initialize
M-x package-refresh-contents
M-x list-packages
```

# use-package

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

# Links

* [Python configuration](https://realpython.com/blog/python/emacs-the-best-python-editor "Python configuration")
* [Emacs configuration sample #1](https://lupan.pl/dotemacs "Emacs configuration sample #1")

<!-- TOC depthFrom:2 -->

# Table of Contents
- [1. Installation](#installation)
- [2. Customize](#customize)
- [3. Packages](#packages)
- [4. use-package](#use-package)
- [5. Dired Mode](#dired-mode)
- [6. Eshell Mode](#eshell-mode)
- [7. Links](#links)
- [8. To See](#to-see)
  - [8.1. Packages](#to-see_packages)
- [9. Tips](#tips)

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

## 5. Dired Mode <a name="dired-mode"></a>

### Start emacs dired-mode in terminal (-nw: no-window) / window wihout load init.el (-q)

```bash
emacs -q -nw -f dired
emacs -q -f dired
```

### Exec docker container locally / remotely

* [Tramp with SSH & Docker](https://afsmnghr.github.io/emacs/tramp-with-ssh-and-docker "Tramp with SSH & Docker")

```lisp
C-x C-f /docker:container:/etc/passwd RET ;; locally use
C-x C-f /ssh:user@remotehost|docker:user@container:/etc/passwd RET ;; remotely use
```

## 6. Eshell Mode <a name="eshell-mode"></a>

* [Eshell Setup](https://github.com/howardabrams/dot-files/blob/master/emacs-eshell.org "Eshell Setup")

- Start eshell in terminal wihout load init.el

```bash
emacs -Q -q -nw --eval '(eshell)'
emacs -Q -q -nw -f eshell
```

- Start eshell in emacs window

```bash
emacs -q -f eshell # Don't load init file.
emacs -f eshell # Load init file
```

- Use Tramp with eshell

```lisp
M-x eshell
cd /ssh:<remote_host>:<path> RET
```

## 7. Links <a name="links"></a>

* [Awesome Emacs](https://github.com/emacs-tw/awesome-emacs "Awesome Emacs")
* [Ladicle's Emacs Configuration](https://ladicle.com/post/config "Ladicle's Emacs Configuration")
* [Python configuration](https://realpython.com/blog/python/emacs-the-best-python-editor "Python configuration")
* [Lupan emacs configuration](https://lupan.pl/dotemacs "Lupan emacs configuration")
* [Cocreature emacs configuration](https://github.com/cocreature/dotfiles/blob/master/emacs/.emacs.d/emacs.org "Cocreature emacs configuration")
* [Arecker emacs configuration](https://github.com/arecker/emacs.d "Arecker emacs configuration")
* [Stefano-m emacs configuration](https://notabug.org/stefano-m/.emacs.d "Stefano-m emacs configuration")

## 8. To see <a name="to-see"></a>

### 8.1. Packages <a name="to-see_packages"></a>

#### Manuals

* [Manual](http://www.linux-france.org/~pmartin/article/appli/emacs/manuel/html/index.html "Manual")

#### Cheat Sheets

* [Cheat Sheet #1](https://ccrma.stanford.edu/guides/package/emacs/emacs.html "Cheat Sheet #1")
* [Cheat Sheet #2](https://courses.cs.washington.edu/courses/cse351/16wi/sections/1/Cheatsheet-emacs.pdf "Cheat Sheet #2")
* [Cheat Sheet #3](https://lea-linux.org/documentations/Software-soft_edit-emacs "Cheat Sheet #3")

#### Themes

* [Themes #1](https://pawelbx.github.io/emacs-theme-gallery "Themes #1")
* [Themes #2](https://peach-melpa.org "Themes #2")

#### Customize

* [Slemaguer emacs configuration](http://www.coli.uni-saarland.de/~slemaguer/emacs/main.html "Slemaguer emacs configuration")

#### Eshell

* [GNU Emacs Eshell](https://www.gnu.org/software/emacs/manual/html_mono/eshell.html "GNU Emacs Eshell")
* [Mastering Eshell](https://www.masteringemacs.org/article/complete-guide-mastering-eshell "Mastering Eshell")

#### Modes

* [Org-mode](https://www.orgmode.org/fr/index.html "Org-mode")
* [Org-mode explain](https://linuxfr.org/news/org-mode-1-5-gerer-ses-notes-avec-gnu-emacs "Org-mode explain")

## 9. Tips <a name="tips"></a>

### Start emacs in fullscreen (-mm)

```bash
emacs -mm # see 'man emacs'
```

### Disabled all packages

```bash
for file in ~/.emacs.d/package.d/setup-*.el; do mv ${file} ${file}.dis; done
```

### Enabled all packages

```bash
for file in ~/.emacs.d/package.d/setup-*.el.dis; do mv ${file} ${file%.dis}; done
```

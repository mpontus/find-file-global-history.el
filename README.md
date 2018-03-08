# Find File Global History

> Include all opened files in find-file history.

Ensures that any opened file will be added to the history used by find-file.

## Background

I use find-file a lot when I mean to access recently opened files. `C-x C-f C-r` is ingrained in my memory, and changing old habits, in favor of something like `recentf` is hard.

This approach served me well until I started using [Projectile](https://github.com/bbatsov/projectile/) and `projectile-find-file` command, and I have multiple means of opening a file.

Relying on `find-file` history became harder, since only the files which I open with this command will be remembered. This package provides a simple solution to the problem by including any file, opened by any means, into the `file-name-history` used by `find-file`.

## Install

I have plans to publish this package to [Melpa](https://melpa.org/) repository so you'd be able to install using package install command.

```
M-x package-install find-file-global-history
```

This package provides a global minor mode which is disabled by default. To enable it, add following to your `.emacs` file:

```elisp
(find-file-global-history t)
```

## Contributing

If you can find a way to improve this simple library, your contribution will be welcome.


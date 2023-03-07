# statusicon-xmodmap

StatusIcon for custom keymap user to run xmodmap

## How to use it?

* Build and run.

```
$ make run
```

* It should show the status icon of this application.
* You can run `xmodmap ~/.Xmodmap` anytime with left clicking on the icon.
* Also you can auto-run this application with following setting:

```
$ vi ~/.i3/autostart
$HOME/src/statusicon-xmodmap/statusicon-xmodmap &
```

## Why need it?

If you use following environments:

* using [i3wm](https://i3wm.org/),
* setting up custom modifier key using xmodmap,
* connecting your i3wm desktop on [xrdp](https://github.com/neutrinolabs/xrdp), and
* reconnecting the RDP session,

you will lose the custom modifier on the session.

On this case, someone needs to run xmodmap manually.
But how to do that?
The custom modifier key needs to run xmodmap, which needs some terminals, which needs to be executed by the key on i3wm...

This application is a quick hack to resolve this situation. You can just click the status icon to run xmodmap.

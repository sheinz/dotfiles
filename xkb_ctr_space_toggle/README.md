Switch keyboard layouts with CTRL + SPACE
=========================================

There's no rule in standard xkb rules to switch layouts with ctrl+space.
The following patch adds option 'grp:ctrl_space_toggle'

```
cd /
sudo patch -p0 ~/xkb_ctr_space_toggle.patch
```

To use this option add `grp:ctrl_space_toggle` to xkb configuration.
For example in `/etc/X11/xorg.conf.d/00-keyboard.conf':
```
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us,ru"
        Option "XkbOptions" "caps:escape,ctrl:swap_lalt_lctl,grp:ctrl_space_toggle"
EndSection
```


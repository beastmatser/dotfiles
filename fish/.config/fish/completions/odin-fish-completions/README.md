# odin-fish-completions

Completions for the odin command in the fish shell.

## Install

```sh
wget https://raw.githubusercontent.com/beastmatser/odin-fish-completions/master/completions/odin.fish -O ~/.config/fish/completions/odin.fish
```

### [Fisher](https://github.com/jorgebucaran/fisher)

```fish
fisher install beastmatser/odin-fish-completions
```

## Note

The odin cli tool uses a colon to recieve values e.g.: `odin run hellope.odin -o:speed`, this causes a minor inconvience. If you type a colon after a command that recieves specific values, the valid options will not appear. Instead first leave a whitespace then press tab and the valid arguments for a certain flag will appear. Then you can go back and add the colon inbetween the values.

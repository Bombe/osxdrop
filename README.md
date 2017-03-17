# osxdrop

`osxdrop` is a small tool that takes a binary executable, compresses it (using bzip2), and creates an executable shell script that, when started, will uncompress the binary executable and run it.

## Syntax

```
osxdrop <binary> [<dropper.sh>]
```

`<binary>` is the name of the binary executable you want to compress. `<dropper.sh>` is the name of the shell script that you want to get. If omitted, the name of the binary with an appended `.sh` is used. The script is always dropped in the current directory (unless you specify a file in a different directory).

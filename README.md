bashrc config
=============

Here is my `.bashrc` configurations!

## Short info

The `.bashrc` files don't have any final configuration. Instead, it
runs all shell files within the `.bashrc.d` directory. It's a Fedora
linux approach which is pretty smart!

## Set up the configurations

1. Clone the repository
```sh
git clone --depth 1 https://github.com/nasccped/bashrc.conf && cd bashrc.conf
```

2. run the `update.sh` script:
```sh
./update.sh
```

This script will do all the job.

## Notes

The script also checks if an `bashrc` directory and it's inner files
exists. Then, copy the necessary files to that dir + update the
`.bashrc` file if needed.

The `bashrc` directory's files won't be update! Instead, you should
remove the file that want to change + run the `update.sh` (or just
change it manually).

> [!WARNING]
>
> I've wrote the bashrc in Void-Linux which have the `hostname`
> command, but this command might not be found in distros default
> image. In case of `Archlinux`, you should run `sudo pacman -S
> inetutils` which contains the `hostname` binary!
>
> The Arch incident was just an example. You'll need to search for
> the solution by your own.

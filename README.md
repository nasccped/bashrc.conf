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
git clone --depth 1 https://github.com/nasccped/bashrc.conf
```
2. `cd` + remove git folder
```sh
cd bashrc.conf
rm -rf .git
```
3. Add the config
```sh
# move configs
mv ./const/.bashrc.d $HOME/
# move call script
cat ./conf/.bashrc >> $HOME/.bashrc
```

> [!WARNING]
>
> Since the `.bashrc.d` think is a Fedora env. approach, ensures that
> you doesn't already have this directory in your `$HOME` path. If
> so, just copy the inner files with
> `cp conf/.bashrc.d/*.sh $HOME/.bashrc.d/`.
>
> ---
>
> I've wrote the bashrc in Void-Linux which have the `hostname`
> command (for getting the... hostname). But this command might not
> be found in distros default image. In case of `Archlinux`, you
> should run `sudo pacman -S inetutils` which contains the `hostname`
> binary!
>
> The Arch incident was just an example. You'll need to search for
> the solution by your own.

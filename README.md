bashrc config
=============

Here is my `.bashrc` configurations!

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
echo ./conf/.bashrc >> $HOME/.bashrc
```

> [!WARNING]
>
> I've wrote the bashrc in Void-Linux which have the `hostname`
> command (for getting the... hostname). But this command might not
> be found in distros default image. In case of `Archlinux`, you
> should run `sudo pacman -S inetutils` which contains the `hostname`
> binary!
>
> The Arch incident was just an example. You'll need to search for
> the solution by your own.

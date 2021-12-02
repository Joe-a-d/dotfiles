# .dotfiles


# Scripts

- `setup_mac.sh` sets up most things but is very fragile
	- **avoid casks** , `pkg/dmg` there's no way to differentiate between architectures
- `create_symlinks.sh` adds custom utility scripts to `/usr/local/bin/`

# Hierarchy

- sources leave in here and are symlinked to the appropriate directories upon creation
	- updates should only be made in `.dotfiles`
- `my_scripts` is to be used for small utility scripts which are added to the apth by running the script mentioned above
	- to xem you just need to prepend `my_` to the filename without the extension
- `dev` is where code projects live

## Homebrew

- most of the 3rd party tools were installed with homebrew but there is a big [change in their hierarchy for M1 machines](https://www.reddit.com/r/MacOS/comments/jw9guu/why_did_homebrew_move_from_usrlocalto_opthomebrew/) , `brew --prefix` now points to `/opt/homebrew` with binaries in `bin` and Kegs in `Cellar`
	- the installation script is not backward compatible with intel machines

## Python

- The main Python is alised to Homebrew and `pip` uses `python -m`
- There are only a handfull of packages installed at system level and virtualenvwrapper is used to keep things tidy; venvs live in `dev/venvs`
	- `jupyter` has a standalone environment
	- each `venv` should inherit from the system level python by using `--system-site-packages` and the goal is to have major subenvironments for different type of projects (e.g data science, ai, web) to avoid the unecessary installation of shared packages
		- in the past you've symlinked, but virtualenvwrapper as an utility `add2virtualenv` which uses `.pth` files to change the `sys.path`. Theoretically we could then install other versions of packages in child environments simply by specifying the version or we could just use `pip install -U` to upgrade to the latest version. However, even though the package is installed , the parent's path is (very oddly) added at the start which means that the parent's packages will supersede the child's.
		- to use different jupyter for different kind of projects we use `ipiython kernel install --user --name=<project name>` to create a kernel tailored to the venv instead of installing jupyter in each project





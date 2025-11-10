# djs

WARNING: VERY UNSTABLE

short for daemontools.js (THESE TWO PROJECTS ARE NOT EQUAL)
- daemontools.js -> daemontools in typescript
- djs -> daemontools.js in the booting process (of linux, but could work in any unix)

## Notes:
- djs will only boot a simple system, no graphical but network is provided (by networkmanager)
- tested only in arch

## Requirements:
- inotifywait from inotify-tools (HARD REQUIREMENT FOR shutdown_waiter)
- dbus (by dbus-daemon, not dbus-broker)
- udev
- agetty or sulogin (agetty enabled by default)
- acpid (optional, if you choose to not use it, put a down file in the service directory)
- networkmanager (optional if you dont want internet, put down in both networmanager and networkmanager-dispatcher)

## How to install
- install nvm in the root
- install the latest lts version `nvm install --lts`
- git clone this project with `--recursive` into /etc `git clone --recursive`
- chown the directory to root `chown root:root -R /etc/djs`
- run extra/install_symlinks.sh (IF ORIGINAL DAEMONTOOLS IS PRESENT IT WILL BREAK!)
- uninstall your currently used init system, if you use systemd, uninstall systemd-sysvcompat (in arch its pacman -Rdd systemd-sysvcompat)
- run extra/install_dangerous_files.sh (WILL REPLACE REBOOT, POWEROFF, HALT AND INIT!)
- reboot (do not use the reboot command, if you use systemd use systemctl reboot)
- pray for it to work (or use init=/lib/systemd/systemd in grub edit mode to use systemd)

## Files
- shutdown: sync everything, umounts everything, remount / as read only and executes the shutdown type
- shutdown.rc: any pre shutdown commands you want to put there
- startup: when the kernel finishes loading itself, this is where it lands
- startup.rc: any pre svscan commands you might add, nvm and node is already added to the path here
- shutdown_waiter: detects whenever reboot, poweroff or halt writes to shutdown_target (linux dependent)
- shutdown_target: this file is only created during runtime and deleted afterwards, can only contain "poweroff", "halt" or "reboot". Whenever someone writes to this file and closes the handle, inotify detects and the shutdown_waiter proceeds to do it's thing
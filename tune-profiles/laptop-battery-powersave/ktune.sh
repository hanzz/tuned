#!/bin/sh

. /etc/tune-profiles/functions

start() {
	set_disk_alpm min_power
	#enable_usb_autosuspend
	enable_cpu_multicore_powersave
	set_cpu_governor ondemand
	enable_snd_ac97_powersave
	enable_wifi_powersave
	set_radeon_powersave auto

	return 0
}

stop() {
	set_disk_alpm max_performance
	#disable_usb_autosuspend
	disable_cpu_multicore_powersave
	restore_cpu_governor
	enable_snd_ac97_powersave
	disable_wifi_powersave
	set_radeon_powersave default

	return 0
}

process $@

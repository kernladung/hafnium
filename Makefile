install:
	cp -r data/* /

uninstall:
	rm \
	/usr/share/sddm/themes/nullraum/angle-down.png \
	/usr/share/sddm/themes/nullraum/Main.qml \
	/usr/share/sddm/themes/nullraum/metadata.desktop \
	/usr/share/sddm/themes/nullraum/reboot.svg \
	/usr/share/sddm/themes/nullraum/shutdown.svg \
	/usr/share/sddm/themes/nullraum/theme.conf
	rmdir /usr/share/sddm/themes/nullraum

.PHONY: install uninstall

.DEFAULT_GOAL:= 
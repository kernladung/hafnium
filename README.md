A simple and clean theme for the [SDDM display manager](https://github.com/sddm/sddm).

![Screenshot](https://github.com/nullraum/nullraum-sddm-theme/blob/master/screenshot.png)


# Get it

- clone the repository with `$ git clone https://github.com/nullraum/nullraum-sddm-theme` 

**or**

- download as zip and extract it


# Install it

*nullraum-sddm-theme* uses [make](https://www.gnu.org/software/make/) as build-tool. 

To install *nullraum-sddm-theme* open a terminal in the root folder of the repository and:

	$ sudo make install


# Enable it

Edit `/etc/sddm.conf`:

```
...
[Theme]
# Current theme name
Current=nullraum
...
```

# Uninstall it

To uninstall *nullraum-sddm-theme* open a terminal in the root folder of the repository and:

	$ sudo make uninstall

Of course, you should disable the theme in `/etc/sddm.conf` too.
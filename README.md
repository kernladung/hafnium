A simple and clean theme for the [SDDM display manager](https://github.com/sddm/sddm).

![Screenshot of hafnium](https://github.com/kernladung/hafnium/blob/master/screenshot.png)


# Get it

- clone the repository with `$ git clone https://github.com/kernladung/hafnium` 

**or**

- download as zip and extract it


# Install it

*hafnium* uses [ninja](https://github.com/ninja-build/ninja) as build-tool. Open terminal in the root folder of the repository and:

	$ sudo ninja install


# Enable it

Edit `/etc/sddm.conf`:

...
[Theme]
# Current theme name
Current=kernladung.hafnium
...
```

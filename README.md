A simple and clean theme for the [SDDM display manager](https://github.com/sddm/sddm).

![Screenshot of hafnium](https://github.com/kernladung/hafnium/blob/master/screenshot.png)


# Get it

- clone the repository with `$ git clone https://github.com/mlde/hafnium` 

**or**

- download as zip and extract it


# Install it

*hafnium* uses [ninja](https://github.com/ninja-build/ninja) as build-tool. 

To install *hafnium* open a terminal in the root folder of the repository and:

(in development, currently does not work!)

	$ sudo ninja install


# Enable it

Edit `/etc/sddm.conf`:

```
...
[Theme]
# Current theme name
Current=mlde.hafnium
...
```

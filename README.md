Node.js-Project-Setup
=========
Download the setup file and run it on a new EC2 instance running Ubuntu 12.04.2 LTS (Server install)
or PC Linux distro (Individual Development installation, only tested on Linux Mint)to configure both
the machine and your individual development environment as follows:

```sh
wget https://raw.github.com/cmpsoares91/Node.js-Project-Setup/master/setup.sh

#You can select the following options:
# If you want to setup on a new EC2 instance running Ubuntu 12.04.2 LTS for final setup use:
bash ./setup.sh server

# Else if you want to do a normal development install use:
bash ./setup.sh dev
```

To test if installation is succesful:
```sh
# Run the following bash file to test installation:
wget https://raw.github.com/cmpsoares91/Node.js-Project-Setup/master/test.sh
bash ./test.sh

# Note: If you did a dev installation heroku will be missing.
```

```sh
# If you want to use another version of node.js instead of the latest:
nvm install vx.xx.xx
nvm use vx.xx.xx
```

## Credits

  See the [contributors](https://github.com/cmpsoares91/Node.js-Project-Setup/graphs/contributors).
  
  See also http://github.com/startup-class/dotfiles for more details.

## License

<pre>
The MIT License (MIT)

Copyright (c) 2013-2014 Carlos Soares

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
</pre>

[![Analytics](https://ga-beacon.appspot.com/UA-61026805-1/GitHub/Node.js-Project-Setup/README.md)](https://github.com/igrigorik/ga-beacon)

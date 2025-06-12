# arduino-r4-comple-setup

Arduino UNO R4 Minima compilation setup project, targeting to be used as a GitHub template

# TODO after project creation based on this repository

While my target board is **Arduino UNO R4 Minima**, each user may change configuration on purpose.
Please edit `Dockerfile` for board and library preparation; `Makefile.in` stores target project name.
The project name can be overridden with by adding SKETCH= inline option to `make`.

### Dockerfile

`make docker` builds compiler image based on this file. Default configuration is:

- Based on `ubuntu:24.04` standard image
- `apt update` and `upgrade`
- installs `curl` and utilities via `apt`
- installs `arduino-cli@1.2.2` from official
- installs `arduino:renesas_uno@1.4.1` core from official
- run as `arduino-cli`

When non-standard library is required, edit this file and rebuild the image, otherwise the sketch won't be compiled.

### Makefile.in

It contains only two variables `SKETCH` and `BUILD_PATH`. `SKETCH` stores the project (sketch) name;
`BUILD_PATH` stores compiled files' output directory name. Default is `sketch_1` and `build`, respectively.

# Makefile targets

- `make initdir` makes sketch and build directories
- `make docker` builds compiler image `arduino-cli-runner` based on `Dockerfile`
- `make new` creates a blank sketch in `sketch` folder
- `make attach` runs `make new` and then attaches `arduino:renesas_uno:minima` board to the sketch
- `make init` is equivalent to `make new; make attach`
- `make` or `make firmware` compiles the sketch, and the result is stored in `build` directory

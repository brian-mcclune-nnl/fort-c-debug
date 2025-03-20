# Fort-C-Debug

A project for demonstrating debugging of a Fortran program, including
use of Fortran C Interoperability.

# Project Structure

```
.
├── cmake/
│   └── toolchains/          # Toolchain configurations
│       └── linux-gnu-x86_64.cmake
├── src/
│   ├── add_one/            # C implementation
│   │   └── add_one.c
│   ├── add_two/            # Fortran module
│   │   └── add_two.f90
│   ├── add_three/          # Fortran module
│   │   └── add_three.f90
│   └── main.f90            # Main program
├── CMakeLists.txt          # Build configuration
├── CMakePresets.json       # CMake presets
└── README.md
```

The project demonstrates:
- Fortran-C interoperability
- Fortran modules
- Mixed-language debugging
- CMake configuration with toolchain files

# Getting Started

## Prerequisites

* A C compiler (e.g., `gcc`)
* A Fortran compiler (e.g., `gfortran`)
* CMake version 3.26 or higher
* Ninja build system
* Visual Studio Code extensions:
    * [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
    * [Modern Fortran](https://marketplace.visualstudio.com/items?itemName=fortran-lang.linter-gfortran)

### Installing Ninja

On Ubuntu/Debian:
```sh
sudo apt install ninja-build
```

On macOS:
```sh
brew install ninja
```

On Windows:
```sh
choco install ninja
```

## Setting up the Fortran Language Server

Optional, for language server integration:

```sh
python -m venv venv
. venv/bin/activate
pip install fortls
```

## Building

The project uses CMake presets for building. Three presets are available:
- `default`: Basic build configuration
- `debug`: Debug build with debug symbols
- `release`: Release build with optimizations

All presets use the GNU compiler toolchain (gcc/gfortran) configured for x86_64 Linux systems.

To configure and build:

```sh
# Configure using a preset (choose one)
cmake --preset default
cmake --preset debug
cmake --preset release

# Build using the same preset
cmake --build --preset default
# or
cmake --build --preset debug
# or
cmake --build --preset release
```

Each preset will create its build files in a separate directory under `build/`.

### Build Output Structure

```
build/<preset>/
├── modules/           # Generated Fortran module files
├── CMakeFiles/        # CMake build files
├── fortran_c_demo     # Main executable
└── lib/              # Generated libraries
    ├── libadd_one_lib.a
    ├── libadd_two_lib.a
    └── libadd_three_lib.a
```

### Compiler Flags

The toolchain configuration includes:
- Architecture-specific: `-march=x86-64`
- Debug builds: 
  - C: `-g -O0`
  - Fortran: `-g -O0 -fcheck=all -fbacktrace`
- Release builds: `-O3`

## Running

After building with any preset, you can run the program:

```console
$ build/<preset-name>/fortran_c_demo
Starting with:          10
After add_one:          11
After add_two:          12
After add_three:        13
Sum of all results:     36
```

## Debugging

1. Navigate to the Run and Debug pane.
2. Optionally set breakpoints by clicking to the left of line numbers in
   editor windows.
3. Hit the Play button or F5 to start debugging.

Note: Make sure you've built the project using the `debug` preset for the best debugging experience.

To learn more, visit
[VS Code debugging documentation](https://code.visualstudio.com/docs/editor/debugging).
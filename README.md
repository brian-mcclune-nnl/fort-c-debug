# Fort-C-Debug

A project for demonstrating debugging of a Fortran program, including
use of Fortran C Interoperability.

# Getting Started

## Prerequisites

* A C compiler (e.g., `gcc`)
* A Fortran compiler (e.g., `gfortran`)
* A CMake installation, version at least 3.10.
* Visual Studio Code extensions:
    * [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
    * [Modern Fortran](https://marketplace.visualstudio.com/items?itemName=fortran-lang.linter-gfortran)

## Setting up the Fortran Language Server

Optional, for language server integration:

```sh
python -m venv venv
. venv/bin/activate
pip install fortls
```

## Building

```sh
# Optional: specify C and Fortran compiler
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_Fortran_COMPILER=gfortran
```

## Running

```console
$ build/fortran_c_demo
 The answer is:          42
```

## Debugging

1. Navigate to the Run and Debug pane.
2. Optionally set breakpoints by clicking to the left of line numbers in
   editor windows.
3. Hit the Play button or F5 to start debugging.

To learn more, visit
[VS Code debugging documentation](https://code.visualstudio.com/docs/editor/debugging).
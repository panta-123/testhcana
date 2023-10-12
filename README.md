hcana - Hall C ROOT/C++ analyzer
============================================

hcana is an under-development tool to analyze data from the HMS, SHMS and
SOS spectrometers in
[Hall C](http://www.jlab.org/Hall-C/) at [JLab](http://www.jlab.org/).
It is being developed to replace
the historical Hall C analyzer, ENGINE, which was written in Fortran.
hcana will be the package used to analyze Hall C date in the 12 GeV era.
hcana is being written in C++, using the CERN ROOT framework.  hcana is
an extension to the Hall A analyzer, PODD.

NOTE: In the process of retrieving the hcana source code, a copy of
the Hall A PODD package will be downloaded.  The version of PODD included
has been slightly modified for use with hcana.  For an official version
of PODD, see the [ROOT/C++ Analyzer for Hall A](http://hallaweb.jlab.org/podd/) page.

Downloading
-----------

Instructions for downloading hcana can be found in the
[Hall C Wiki](https://hallcweb.jlab.org/wiki/index.php/ROOT_Analyzer/Git).

Compiling
---------
hcana may be compiled with either make or scons.  Switching between these
two build systems make require some cleanup of dependency files, binary files
and other autogenerated files.

Before compiling, type
`source setup.sh` or `source setup.csh`
depending on whether your shell is bash or csh.

### Compiling with scons

```
scons
```

### Additional SCons features 
To do the equivalent of "make clean", do
`scons -c`
To compile with debug capabilities, do
`scons debug=1`
To compile the standalone codes the are part of podd, do
`scons standalone=1`
To run cppcheck (if installed) on the Hall C src diretory, do
`scons cppcheck=1`

### Compiling with CMake (experimental)

Do the usual CMake setup

```
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$HOME/local/hcana ..
make -jN install
```

Here `$HOME/local/hcana` is an example installation destination;
modify as appropriate. You will need to add the `bin` and `lib[64]` sub-directories
under the installation prefix to your environment:

```
export PATH=$HOME/local/hcana/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/hcana/lib64:$LD_LIBRARY_PATH
```

On macOS, the library directory is usually simply `lib` instead of `lib64`.

CMake does not yet support the SCons features "standalone" and "cppcheck".

The default CMake build type is "RelWithDebInfo", i.e. debug symbols are
included in the binaries, but the code is optimized, which may cause the
debugger to act in a confusing way on occasion. To build a
non-optimized debug version, run CMake as follows:
```
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=$HOME/local/hcana-dbg ..
make -jN install
```

### Compiling with make (deprecated)

```
make [-jN]
```

Running
-------
Basic instructions on how to run hcana are in the
[Hall C Wiki](https://hallcweb.jlab.org/wiki/index.php/ROOT_Analyzer/Running).

Contributing
------------
To participate in hcana code development, contact Mark Jones or Stephen Wood.


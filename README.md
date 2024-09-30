# Edge Impulse stand-alone inferencing example (linking Edge Impulse library)

This repository demonstrates pre-compiling the Edge Impulse's C++ library export (includes model) into a shared or static library and linking to a **C** or **C++** application.

> **No hardware optimization!** This example repository contains the bare minimum example of compiling your impulse, and does not contain hardware optimizations for MPUs or on Linux. See [example-standalone-inferencing-linux](https://github.com/edgeimpulse/example-standalone-inferencing-linux) to compile with optimizations.

See `shared/` for example of linking with precompiled shared Edge Impulse library and see `static` for an example with linking with a statically linked library.

## Getting Started 

> To build only the library skip this step and jump to **Build your [static|shared] library and link with application**

To get started head over to your Edge Impulse project, and go to **Deployment**. From here you can create the full library which contains the impulse and all external required libraries. Select **C++ library**, and click **Build** to create the library.

Download the **.zip**, extract and place the contents in **C/** and/or **C++/** directory depending on which you'd like to build.

Copy a test sample's *raw features* into the `features[]` array in **C++/*/source/main.cpp** or in **C/*/source/main.c**. To obtain raw features head back to Studio and click on the **Live Classification**. Then load a validation sample and then copy the **Raw Features**. For more information see [Add data sample to main.cpp](https://docs.edgeimpulse.com/docs/run-inference/cpp-library/running-your-impulse-locally#add-data-sample-to-main.cpp)


## Build static library and link with application

+ To build C application:
    + Go to **C/static**
+ To build C++ application:
    + Go to **C++/static**

Then in a terminal or console:

### macOS, Linux

``` sh
sh build.sh
```

### Windows

``` sh
build.bat
```

This will build `build/edge-impulse-standalone` and the `build/libedgeimpulse.a`

## Build shared library and link with application

+ To build C application:
    + Go to **C/shared**
+ To build C++ application:
    + Go to **C++/shared**

Then in a terminal or console:

### macOS, Linux

``` sh
sh build.sh
```

### Windows

``` sh
build.bat
```

This will build `build/edge-impulse-standalone` and the `build/libedgeimpulse.so` in case of Linux or `build/libedgeimpulse.dll` in case of Windows.

After this, for C++ shared library run (both Linux and Windows):

```bash
bash install-shared-lib.sh
```

This wil create a directory


## Execute the application

To test how the created library builds against C++ code, we will use `test-app` directory.

Copy the `libedgeimpulse` folder to the `test-app` folder and run `make`.

This will create an executable in `build`.
To run the executable o`n windows, copy `libedgeimpulse/lib/libedgeimpulse.dll` to `build` directory and execute. 


E.g. if you built with the following: 

- Project: [Tutorial: Continuous Motion Recoginition](https://studio.edgeimpulse.com/public/14299/latest)
- Docs: [Tutorial: Continuous Motion Recoginition]( https://docs.edgeimpulse.com/docs/tutorials/end-to-end-tutorials/continuous-motion-recognition) 
- Sample: `updown.1.cbor.1q53q9pl` at timestample `0`

you'd get similar results as below:

``` sh
run_classifier returned: 0
Timing: DSP 0 ms, inference 0 ms, anomaly 0 ms
Predictions:
  idle: 0.00000
  snake: 0.00000
  updown: 0.99609
  wave: 0.00000
Anomaly prediction: -0.540
```

## Other toolchain (or cross-compilation)

To use another toolchain other than GNU (`gcc/g++`) e.g. clang.

### `clang`.

Then you can do so as follows:

``` sh
CC=clang CXX=clang++ make -j
```

## Target specific builds

This repo builds the application by default for your computer (x86). However this can easily adapted for your (embedded) target. Edit `Makefile` for your target. See e.g. "Target specific" in `Makefile`.


## Further reading 

- [Running your impulse locally -> Using the library from C](https://docs.edgeimpulse.com/docs/run-inference/cpp-library/running-your-impulse-locally#using-the-library-from-c).
- [Deploy your model as a C++ library](https://docs.edgeimpulse.com/docs/deployment/running-your-impulse-locally/running-your-impulse-locally)
- [Edge Impulse for Linux](https://docs.edgeimpulse.com/docs/tools/edge-impulse-for-linux)
- [fully-supported-development-boards](https://docs.edgeimpulse.com/docs/development-platforms/fully-supported-development-boards).

## License

 [Apache License v2.0](https://www.apache.org/licenses/LICENSE-2.0)

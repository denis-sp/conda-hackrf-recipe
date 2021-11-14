@echo on

cd host
if errorlevel 1 exit 1

mkdir build
if errorlevel 1 exit 1

cd build
if errorlevel 1 exit 1

cmake -G "Ninja" ^
    -DCMAKE_BUILD_TYPE:STRING=Release ^
    -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
    -DLIB_INSTALL_DIR:PATH="lib" ^
    -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
    -DLIBUSB_INCLUDE_DIR:PATH="%LIBRARY_INC%\libusb-1.0" ^
    -DLIBUSB_LIBRARIES:PATH="%LIBRARY_LIB%\libusb-1.0.lib" ^
    -DFFTW_INCLUDES:PATH="%LIBRARY_INC%" ^
    -DFFTW_LIBRARIES:PATH="%LIBRARY_LIB%\fftw3f.lib" ^
    -DTHREADS_PTHREADS_WIN32_LIBRARY:FILEPATH="%LIBRARY_LIB%\pthread.lib" ^
    ..

if errorlevel 1 exit 1

cmake --build . --config Release
if errorlevel 1 exit 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1

del %LIBRARY_BIN%\hackrf_static.lib


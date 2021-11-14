@echo on

cd host
if errorlevel 1 exit 1

mkdir build
if errorlevel 1 exit 1

cd build
if errorlevel 1 exit 1

cmake -G "MinGW Makefiles" ^
    -DCMAKE_BUILD_TYPE:STRING=Release ^
    -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
    -DLIB_INSTALL_DIR:PATH="lib" ^
    -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
    ..

if errorlevel 1 exit 1

mingw32-make
if errorlevel 1 exit 1

mingw32-make install
if errorlevel 1 exit 1


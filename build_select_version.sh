#!/bin/bash

cd ./LINUX/android/
source build/envsetup.sh

#prompt user to select build option
echo "Please select a build option:"
echo "1) monaco_go-userdebug"
echo "2) monaco_go-user"
read -p "Enter option number: " build_option

#execute the selected build command
case "$build_option" in
    1)
        echo "...Building monaco_go-userdebug version..."
        lunch "monaco_go_userdebug"
        ./build.sh dist -j32 KERNEL_DEFCONFIG=monaco-debug_defconfig ARCH=arm | tee make_log
        ;;
    2)
        echo "...Building monaco_go-userdebug version..."
        lunch "monaco_go_userdebug"
        ./build.sh dist -j32 KERNEL_DEFCONFIG=monaco-debug_defconfig ARCH=arm | tee make_log
        ;;
    *)
        echo "Invalid selection. Exiting."
        exit 1
        ;;
esac

echo "-----------------succssed complited, and the log is saved----------------------"

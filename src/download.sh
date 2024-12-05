#!/bin/sh
set -e

export VERSION="v"
 
function downloadAndroid () {

    if [ "$VERSION" == "v" ]; then 
        echo "please set a version with 'v=*' parameter"
        exit 1
    fi
    curl -L -o ./libpjsua2.maui.so.tar.gz https://github.com/weslleymurdock/libpjsua2-android/releases/download/v2.14.1.1/libpjsua2.tar.gz
    tar -xzvf libpjsua2.maui.so.tar.gz 
    mkdir -p ./libpjsua2.maui.android/org/pjsip
    mkdir -p ./libpjsua2.maui.android/pjsua2maui
    mkdir -p ./libpjsua2.so/lib/
    mv -v ./home/runner/libpjsua2/lib/libpjsua2.maui.android/* ./libpjsua2.maui.android/pjsua2maui
    rm -rf ./home/runner/libpjsua2/lib/java/org/pjsip/pjsua2
    mv -v ./home/runner/libpjsua2/lib/java/org/pjsip/* ./libpjsua2.maui.android/org/pjsip/
    mv -v ./home/runner/libpjsua2/lib/* ./libpjsua2.runtime.android/lib/
   
}

function downloadiOS () {
    echo "iOS ..."
    curl -L -o ./libpjsua2.maui.a.tar.gz https://github.com/weslleymurdock/libpjsua2-ios/releases/download/v2.14.1.1/libpjsua2.tar.gz
    tar -xzvf libpjsua2.maui.a.tar.gz
    mkdir -p ./libpjsua2.maui.ios/pjsua2maui
    mkdir -p ./libpjsua2.runtime.ios/lib/arm64 
    mkdir -p ./libpjsua2.runtime.ios/lib/x86_64 
    mv -v ./libpjsua2/lib/pjsua2maui/pjsua2/* ./libpjsua2.maui.ios/pjsua2maui
    mv -v ./libpjsua2/lib/arm64/libpjsua2.a  ./libpjsua2.runtime.ios/lib/arm64
    mv -v ./libpjsua2/lib/x86_64/libpjsua2.a  ./libpjsua2.runtime.ios/lib/x86_64 
    rm -rf ./libpjsua2 libpjsua2.maui.a.tar.gz
}

function downloadMac () {

     echo "not implemented"
}

function downloadWin () {
     echo "not implemented"
     
}
DOWNLOAD_ANDROID=0
DOWNLOAD_IOS=0
DOWNLOAD_WINDOWS=0
DOWNLOAD_MACOSX=0

for i in "$@"; do
    case $i in
    --android | android)
    DOWNLOAD_ANDROID=1
    shift
    ;;
    --ios | ios)
    DOWNLOAD_IOS=1
    shift
    ;;
    --macos | osx)
    DOWNLOAD_MACOSX=1

    shift
    ;;
    --windows | win)
    DOWNLOAD_WINDOWS=1
    shift
    ;;
    *)
    ;;
    esac
done

if [ "$DOWNLOAD_ANDROID" == "1" ]; then
    downloadAndroid
fi

if [ "$DOWNLOAD_IOS" == "1" ]; then
    downloadiOS
fi

if [ "$DOWNLOAD_WINDOWS" == "1" ]; then
    downloadWin
fi

if [ "$DOWNLOAD_MACOSX" == "1" ]; then
    downloadMac
fi

echo "done"
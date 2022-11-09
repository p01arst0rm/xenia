#!/usr/bin/env bash


echo "[+] downloading xenia subprojects..."
/mingw64/bin/meson subprojects download
/mingw64/bin/meson subprojects packagefiles --apply

/mingw64/bin/meson setup build/xenia \
    --native-file "./buildfiles/meson/x86_64-mingw-w64.ini" \
    -Dcmake_prefix_path="$CMAKE_PREFIX_PATH" \
    -Dpkg_config_path="$PKG_CONFIG_PATH"

#!/bin/sh
set -eu

if [ "$(id -u)" -ne 0 ]; then
    printf '%s\n' "Run this installer as root: sudo sh sddm/install.sh" >&2
    exit 1
fi

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
theme_source="$repo_dir/sddm/usr/share/sddm/themes/reek-hypr"
theme_target=/usr/share/sddm/themes/reek-hypr

install -d -m 755 "$theme_target" /etc/sddm.conf.d
install -m 644 "$theme_source/Main.qml" "$theme_target/Main.qml"
install -m 644 "$theme_source/theme.conf" "$theme_target/theme.conf"
install -m 644 "$theme_source/metadata.desktop" "$theme_target/metadata.desktop"
install -m 644 "$repo_dir/sddm/etc/sddm.conf.d/zz-reek-theme.conf" /etc/sddm.conf.d/zz-reek-theme.conf

printf '%s\n' "Installed the reek-hypr SDDM theme. It will be used on the next boot."

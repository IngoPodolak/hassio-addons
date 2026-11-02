#!/bin/sh
# Uebernimmt die Home-Assistant-Add-on-Optionen (/data/options.json)
# in die JDownloader-Konfiguration. Laeuft nach 55-jdownloader2.sh.
set -u
O=/data/options.json
CFG=/config/cfg
opt() { jq -r --arg k "$1" '.[$k] // empty' "$O" 2>/dev/null; }
setjson() { # datei jq-filter [args...]
    F="$CFG/$1"; shift
    [ -f "$F" ] || echo '{}' > "$F"
    jq -c -M "$@" "$F" | sponge "$F"
}

# Downloadordner
P="$(opt download_path)"; [ -n "$P" ] || P=/media/jdownloader
mkdir -p "$P"
setjson org.jdownloader.settings.GeneralSettings.json --arg p "$P" '.defaultdownloadfolder = $p'
echo "Downloadordner: $P"

# MyJDownloader (optional)
MJ=org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
E="$(opt myjd_email)"; PW="$(opt myjd_password)"; N="$(opt myjd_device_name)"
if [ -n "$E" ] && [ -n "$PW" ]; then
    setjson "$MJ" --arg e "$E" --arg p "$PW" '.email = $e | .password = $p'
    echo "MyJDownloader-Konto gesetzt."
fi
if [ -n "$N" ]; then
    setjson "$MJ" --arg n "$N" '.devicename = $n'
fi
exit 0

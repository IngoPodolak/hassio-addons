# JDownloader 2 (Web-Oberfläche)

Dieses Add-on startet JDownloader 2 auf Basis des Docker-Images
[`jlesage/jdownloader-2`](https://hub.docker.com/r/jlesage/jdownloader-2) –
dasselbe Image, das auch ZimaOS verwendet. Die komplette JDownloader-Oberfläche
läuft im Browser und ist direkt in Home Assistant eingebunden
(Seitenleiste → **JDownloader**). MyJDownloader ist optional.

## Optionen

| Option | Bedeutung |
|---|---|
| `download_path` | Zielordner für Downloads, z. B. `/media/jdownloader` oder `/share/downloads` |
| `dark_mode` | Dunkles Design der Oberfläche |
| `myjd_email` / `myjd_password` | MyJDownloader-Konto (leer lassen, wenn nicht genutzt) |
| `myjd_device_name` | Gerätename in MyJDownloader |

## Daten

- Einstellungen von JDownloader liegen im Add-on-Konfigurationsordner
  (`/addon_configs/<slug>/`) und bleiben bei Updates erhalten.
- Downloads unter `/media/...` sind in Home Assistant unter **Medien** sichtbar,
  unter `/share/...` z. B. über Samba.

## Optional: direkter Zugriff

Port 5800 kann in der Netzwerk-Konfiguration freigegeben werden, um die
Oberfläche ohne Home Assistant unter `http://<ip>:5800` zu öffnen.
Port 3129 wird nur für die MyJDownloader-Direktverbindung benötigt.

#!/bin/bash
# Browser
xdg-settings set default-web-browser google-chrome.desktop

# Torrent Default app
gio mime x-scheme-handler/magnet org.qbittorrent.qBittorrent.desktop
gio mime application/x-bittorrent org.qbittorrent.qBittorrent.desktop


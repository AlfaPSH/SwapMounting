
#!/system/bin/sh
SWAPFILE="/data/swapfile"

if [ -f "$SWAPFILE" ]; then
    echo "[!] Swapfile already exists."
else
    dd if=/dev/zero of="$SWAPFILE" bs=1M count=4096
    chmod 600 "$SWAPFILE"
    mkswap "$SWAPFILE"
fi

exit 0

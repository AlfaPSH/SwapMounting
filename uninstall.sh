
#!/system/bin/sh
SWAPFILE="/data/swapfile"

if [ -f "$SWAPFILE" ]; then
    swapoff "$SWAPFILE" 2>/dev/null
    rm -f "$SWAPFILE"
fi

exit 0

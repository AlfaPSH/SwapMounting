
#!/system/bin/sh
SWAPFILE="/data/swapfile"
LOGFILE="/data/local/tmp/AlfaTweaks-Swap.log"

log_info() {
    echo "[+] $(date +'%Y-%m-%d %H:%M:%S') - $1" >> "$LOGFILE"
}

until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 5
done


while true; do
    [ -d "/data/data" ] && [ -d "/data/user/0" ] && break
    sleep 1
done

if [ -f "$SWAPFILE" ]; then
    chmod 600 "$SWAPFILE"
    if ! grep -q "$SWAPFILE" /proc/swaps; then
        swapon "$SWAPFILE" 2>>"$LOGFILE" \
            && log_info "Swap activated." \
            || log_info "Failed to activate swap."
    fi
fi

exit 0

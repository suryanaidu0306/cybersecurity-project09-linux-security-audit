#!/bin/bash

REPORT="reports/security_audit.txt"

mkdir -p reports

echo "========================================"
echo "       LINUX SECURITY AUDIT TOOL"
echo "========================================"

{
    echo "LINUX SECURITY AUDIT REPORT"
    echo "Generated: $(date)"
    echo "Hostname: $(hostname)"
    echo

    echo "===== CURRENT USER ====="
    id
    echo

    echo "===== SUDO GROUP MEMBERS ====="
    getent group sudo || echo "Sudo group not found"
    echo

    echo "===== FIREWALL STATUS ====="
    if command -v ufw >/dev/null 2>&1; then
        sudo -n ufw status 2>&1 ||
            echo "Firewall status requires administrator authentication"
    else
        echo "UFW is not installed"
    fi
    echo

    echo "===== RUNNING SERVICES ====="
    systemctl list-units --type=service --state=running --no-pager
    echo

    echo "===== WORLD-WRITABLE FILES IN HOME ====="
    find "$HOME" -type f -perm -0002 -print 2>/dev/null
    echo

    echo "===== AVAILABLE PACKAGE UPDATES ====="
    apt list --upgradable 2>/dev/null
    echo

    echo "===== CURRENT USER GROUPS ====="
    groups
    echo

} | tee "$REPORT"

echo
echo "========================================"
echo "AUDIT COMPLETED"
echo "Report: $REPORT"
echo "========================================"

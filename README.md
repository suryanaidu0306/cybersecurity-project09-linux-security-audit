# Project 9 — Linux Security Audit Tool

## Objective
Automate basic Linux security checks using Bash and native Linux commands.

## Tools
- Ubuntu Linux
- Bash
- systemctl
- UFW
- APT
- find
- getent

## Features
1. Inspect current user and group information.
2. Check sudo group membership.
3. Inspect firewall status.
4. List running services.
5. Identify world-writable files in the user's home directory.
6. Display available package updates.
7. Generate an audit report.

## Execution

```bash
chmod +x security_audit.sh
./security_audit.sh
```

## Project Files
- `security_audit.sh` — Main audit script
- `README.md` — Documentation
- `output.txt` — Saved audit output
- `reports/security_audit.txt` — Generated report

## Learning Outcomes
- Linux security auditing
- User and group management
- File permission inspection
- Firewall status checking
- Service inspection
- Bash automation

## Safety
This project performs read-only checks. It does not change firewall rules, user accounts, permissions, or system services.

## Author
Surya Naidu

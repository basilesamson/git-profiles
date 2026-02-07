# Git Profiles (Professional / Personal) — Clean & Legal Setup

This repository provides a **vendor-neutral, privacy-respecting** way to manage
multiple Git identities on the same machine.

## Why this exists

Many companies prohibit:
- Personal use of company-provided AI tools
- Mixing work and personal Git identities

Git itself supports clean separation using standard configuration files.
This setup:
- Uses **no third-party tools**
- Stores **no secrets**
- Is **fully auditable**
- Works with **any editor or OS**

---

## What this does

- Separate **commit identities** (name + email)
- Automatic switching based on repository location
- No impact on GitHub / GitLab / Bitbucket policies
- Compatible with corporate compliance rules

---

## Folder convention

```text
~/projects/personal/   -> personal identity
~/projects/pro/       -> professional identity

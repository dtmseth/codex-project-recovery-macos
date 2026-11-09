# Changelog

## 1.2.0 — macOS support

- Added `START-RECOVERY.command` and macOS process detection.
- Added POSIX path matching and a macOS Application Support data directory.
- Kept the existing Windows launcher and portable-runtime support.
- Added macOS-focused tests and usage documentation.

## 1.1.0 — one-click portable Windows release

- Added `START-RECOVERY.bat` with a private CPython runtime; no Python installation is required.
- Waits for Codex/ChatGPT to close, then repairs with backups and no typed confirmation prompt.
- Added concise installation instructions, checksums, runtime licensing, and automated tests.

## 1.0.0 — manual Windows release

- Added read-only diagnosis, reviewed repair, organization snapshots, and guarded undo.

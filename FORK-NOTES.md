# macOS Fork Notes

This repository is a macOS-capable fork of [convertify-pro/codex-project-recovery](https://github.com/convertify-pro/codex-project-recovery).

## Original work and credit

The original project was created and published by the **Convertify Team** at [@convertify-pro](https://github.com/convertify-pro). The upstream project supplied the recovery design, Windows implementation, guarded database updates, rollback backups, organization-only undo journal, privacy model, and original synthetic tests.

This fork starts from upstream commit [`f21ccc58b3de20ec354455f1700f90d29425a9e0`](https://github.com/convertify-pro/codex-project-recovery/commit/f21ccc58b3de20ec354455f1700f90d29425a9e0), titled “release: publish v1.1.0 portable Windows package and direct downloads.” The upstream MIT license is preserved unchanged.

## Changes in the macOS fork

Version 1.2.0 adds:

- `START-RECOVERY.command`, a Finder/Terminal-friendly zsh launcher for macOS.
- Python 3.8+ detection and `-E -s` startup flags to ignore Python environment overrides and user site-packages while still loading the adjacent recovery module.
- macOS process detection using `ps -axo comm=` so repair waits until the Codex or ChatGPT app and Codex CLI are closed.
- POSIX path normalization alongside the original Windows path handling.
- Unicode NFC normalization for reliable comparison of macOS project paths.
- A native macOS data location at `~/Library/Application Support/CodexProjectRecovery` for reports, snapshots, and rollback backups.
- Platform-neutral one-click launcher messages and defaults.
- macOS setup, privacy, diagnostic, and manual-operation documentation.
- Tests for macOS process detection, data-directory selection, path normalization, and launcher isolation behavior.

## Preserved upstream behavior

- The Windows `.bat` launcher and portable Windows download remain available.
- The core recovery algorithm, conservative conflict handling, backup behavior, undo safeguards, and offline/no-telemetry design are preserved.
- Existing project assignments are not overwritten, ambiguous folder matches are skipped, and chat bodies are not rewritten.

## Verification

The fork passes 22 synthetic unit tests on macOS. The release package is also checked for zsh syntax, Python compilation, executable launcher permissions, clean extraction, and SHA-256 integrity.

These tests do not certify every macOS or Codex version. Future Codex releases may change the local saved-state or SQLite schema; the utility stops rather than guessing when the expected layout is not present.

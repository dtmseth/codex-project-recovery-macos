# v1.2.0 — macOS support

This release adds a native macOS launcher while preserving the Windows workflow. Extract the repository, Control-click `START-RECOVERY.command`, and choose **Open**. The launcher uses Python 3.8 or newer, waits for Codex/ChatGPT to close, creates rollback backups, and then restores recoverable local project organization.

macOS-specific changes include POSIX and Unicode-aware path normalization, `ps`-based app detection, and backups under `~/Library/Application Support/CodexProjectRecovery`. The tool remains standard-library-only and offline.

This unofficial community tool targets local projects missing from the desktop sidebar while their chats remain in Recents. It cannot recover records removed from all saved sources. Review `README.md` for setup, privacy information, and limits.

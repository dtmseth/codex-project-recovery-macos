# Codex Project Recovery

Restore **local Codex projects that disappeared from the desktop sidebar while their chats still appear in Recents** on macOS or Windows.

> This is an unofficial community utility. It is not made or endorsed by OpenAI, and it cannot recover records that no longer exist in local saved data.

## Origin and attribution

This macOS-capable fork is based on [convertify-pro/codex-project-recovery](https://github.com/convertify-pro/codex-project-recovery), originally created and published by the **Convertify Team** under the MIT License. Credit for the original recovery design, Windows implementation, safety checks, backup/undo workflow, and initial test suite belongs to [@convertify-pro](https://github.com/convertify-pro).

The macOS adaptation adds platform support while preserving the original Windows workflow. See [FORK-NOTES.md](FORK-NOTES.md) and [CHANGELOG.md](CHANGELOG.md) for an exact summary of the changes from upstream commit `f21ccc58b3de20ec354455f1700f90d29425a9e0`.

## Run on macOS

Requirements: macOS, a local Codex desktop installation, and Python 3.8 or newer. The utility uses only Python's standard library and makes no network requests.

1. Extract the entire repository ZIP.
2. In Finder, Control-click `START-RECOVERY.command` and choose **Open**. This is usually only necessary the first time.
3. If macOS says the file cannot be executed, open Terminal in the extracted folder and run:

   ```zsh
   chmod +x START-RECOVERY.command
   ./START-RECOVERY.command
   ```

4. If Codex or ChatGPT is open, quit it when prompted. Leave the recovery window open; it waits and continues by itself.
5. When it says `SUCCESS - RECOVERY COMPLETE`, reopen Codex.

To run a read-only diagnosis instead:

```zsh
python3 -E -s one_click.py --diagnose
```

By default, macOS backups and reports are saved in `~/Library/Application Support/CodexProjectRecovery`.

## Run on Windows

The existing Windows portable package remains supported. Extract it and double-click `START-RECOVERY.bat`. Its bundled Python runtime means a separate Python installation is not required.

## What it does

The tool checks the local Codex database against saved desktop project metadata. When records remain available, it restores missing local project entries and their chat memberships. It uses saved assignments first; it uses a working-folder match only when the folder points to exactly one project. macOS and Windows paths are normalized with their native path rules. Ambiguous folders, subagents, and chats explicitly marked projectless are skipped.

The utility changes local project organization and empty membership fields. It does not replace chat text, project files, account credentials, or file access settings. It creates rollback backups before repair, makes no network requests, sends no telemetry, and installs no background service.

After repair, Codex writes current state normally. Run `python3 project_recovery.py snapshot` after significant project changes if you want a recent recovery snapshot. Do not run repair as routine cleanup: old local records can include projects you intentionally removed.

## Requirements and limits

- macOS or Windows 10/11.
- Local Codex desktop projects only. Cloud/ChatGPT projects, mobile clients, and remote hosts are outside the tool's scope.
- The repair depends on local project records still existing and on a supported database layout. It stops rather than guessing if the expected layout is missing.
- The original recovery approach was demonstrated on Windows Codex app build `26.1021.3705.0`. macOS support uses the same saved-state and SQLite layouts, but future Codex releases may change them.
- On macOS, the launcher requires `python3` on `PATH`. Install Python from [python.org](https://www.python.org/downloads/macos/) if needed.

## Advanced/manual commands

The source uses only Python's standard library:

```zsh
python3 project_recovery.py diagnose
python3 project_recovery.py repair
python3 project_recovery.py snapshot
python3 project_recovery.py undo --backup "/path/to/repair-backup"
```

Use `--codex-home` and `--data-dir` to override the defaults. Run tests with:

```zsh
python3 -m unittest discover -s tests -v
```

On Windows, `build_portable.py` can rebuild the private x64 runtime used by `START-RECOVERY.bat`.

## Privacy and backups

Compact organization snapshots include project names, local paths, IDs, and memberships. Full rollback backups can contain chat text and saved app state. Keep the recovery folder private and do not attach `state_*.sqlite`, `.*codex-global-state*.json`, logs, or backups to an issue.

## License

The recovery source remains MIT licensed under the original project's `LICENSE.txt`. The bundled Windows CPython runtime and its components have separate notices in `PYTHON-LICENSE.txt` and the portable package's `runtime/PYTHON-LICENSE.txt`.

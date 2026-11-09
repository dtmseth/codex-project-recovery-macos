#!/bin/zsh

set -u
SCRIPT_DIR="${0:A:h}"
PYTHON_BIN="${commands[python3]:-}"

if [[ -z "$PYTHON_BIN" ]]; then
  print "Python 3 is required. Install it from https://www.python.org/downloads/macos/"
  print "Then run START-RECOVERY.command again."
  read -r "?Press Return to close this window."
  exit 1
fi

if ! "$PYTHON_BIN" -c 'import sys; raise SystemExit(sys.version_info < (3, 8))'; then
  print "Python 3.8 or newer is required."
  read -r "?Press Return to close this window."
  exit 1
fi

"$PYTHON_BIN" -E -s "$SCRIPT_DIR/one_click.py" "$@"
RECOVERY_EXIT=$?

print
read -r "?Press Return to close this recovery window."
exit "$RECOVERY_EXIT"

#!/bin/bash
# Server Lesson Pipeline Wrapper
# ==============================
# 
# This is a convenience wrapper for the general pipeline script.
# It calls the general run-pipeline.sh script with server-lesson configuration.
#
# Usage:
#   ./run-pipeline.sh [--clean]
#
# Options:
#   --clean    Remove old level files before processing

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Find project root
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
GENERAL_SCRIPT="$PROJECT_ROOT/level-creation-scripts/bin/run-pipeline.sh"

# Call the general script with server-lesson project name
exec "$GENERAL_SCRIPT" server-lesson "$@"

#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE_PATH="$PROJECT_DIR/templates/weekly_progress_template.md"
OUTPUT_DIR="$PROJECT_DIR/reports/weekly"
LOG_DIR="$PROJECT_DIR/logs"

mkdir -p "$OUTPUT_DIR" "$LOG_DIR"

WEEK_LABEL="$(date +%Y-W%V)"
OUTPUT_PATH="$OUTPUT_DIR/weekly_${WEEK_LABEL}.md"

if [[ -f "$OUTPUT_PATH" ]]; then
  echo "[SKIP] 已存在：$OUTPUT_PATH"
  exit 0
fi

if [[ ! -f "$TEMPLATE_PATH" ]]; then
  echo "[ERROR] 找不到模板：$TEMPLATE_PATH" >&2
  exit 1
fi

sed "s/{week_no}/$WEEK_LABEL/g" "$TEMPLATE_PATH" > "$OUTPUT_PATH"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] weekly report created: $OUTPUT_PATH" >> "$LOG_DIR/workflow.log"
echo "[OK] 已生成周报草稿：$OUTPUT_PATH"

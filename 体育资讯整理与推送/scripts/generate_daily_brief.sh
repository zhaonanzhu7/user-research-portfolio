#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE_PATH="$PROJECT_DIR/templates/daily_report_template.md"
OUTPUT_DIR="$PROJECT_DIR/reports/daily"
LOG_DIR="$PROJECT_DIR/logs"

mkdir -p "$OUTPUT_DIR" "$LOG_DIR"

TODAY="$(date +%Y-%m-%d)"
OUTPUT_PATH="$OUTPUT_DIR/daily_${TODAY}.md"

if [[ -f "$OUTPUT_PATH" ]]; then
  echo "[SKIP] 已存在：$OUTPUT_PATH"
  exit 0
fi

if [[ ! -f "$TEMPLATE_PATH" ]]; then
  echo "[ERROR] 找不到模板：$TEMPLATE_PATH" >&2
  exit 1
fi

sed "s/{date}/$TODAY/g" "$TEMPLATE_PATH" > "$OUTPUT_PATH"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] daily ledger created: $OUTPUT_PATH" >> "$LOG_DIR/workflow.log"
echo "[OK] 已生成采集台账：$OUTPUT_PATH"

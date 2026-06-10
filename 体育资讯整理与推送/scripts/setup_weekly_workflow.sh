#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DAILY_SCRIPT="$PROJECT_DIR/scripts/generate_daily_brief.sh"
WEEKLY_SCRIPT="$PROJECT_DIR/scripts/generate_weekly_report.sh"
LOG_DIR="$PROJECT_DIR/logs"
CRON_TMP_FILE="$(mktemp)"

mkdir -p "$LOG_DIR"

if [[ ! -x "$DAILY_SCRIPT" ]]; then
  chmod +x "$DAILY_SCRIPT"
fi

if [[ ! -x "$WEEKLY_SCRIPT" ]]; then
  chmod +x "$WEEKLY_SCRIPT"
fi

CURRENT_CRON=""
if crontab -l >/dev/null 2>&1; then
  CURRENT_CRON="$(crontab -l)"
fi

FILTERED_CRON="$(printf '%s\n' "$CURRENT_CRON" | grep -v '体育资讯整理与推送/scripts/generate_daily_brief.sh' | grep -v '体育资讯整理与推送/scripts/generate_weekly_report.sh' || true)"

{
  printf '%s\n' "$FILTERED_CRON"
  echo "30 8 * * 0-4 /bin/bash '$DAILY_SCRIPT' >> '$LOG_DIR/cron.log' 2>&1"
  echo "0 9 * * 5 /bin/bash '$WEEKLY_SCRIPT' >> '$LOG_DIR/cron.log' 2>&1"
} > "$CRON_TMP_FILE"

crontab "$CRON_TMP_FILE"
rm -f "$CRON_TMP_FILE"

echo "[OK] 定时任务已安装："
echo "- 周日到周四 08:30 生成日报草稿"
echo "- 周五 09:00 生成周报草稿"

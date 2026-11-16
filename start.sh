#!/usr/bin/env bash
# NANA WHITEBOX / Director Workbench — 本地启动脚本（macOS / Linux）
cd "$(dirname "$0")" || exit 1

PORT="${1:-8000}"
URL="http://localhost:${PORT}/"

echo ""
echo "  NANA WHITEBOX / Director Workbench"
echo "  ---------------------------------"
echo "  Local:  ${URL}"
echo "  Folder: $(pwd)"
echo ""
echo "  保持这个窗口开着即可使用，Ctrl+C 停止服务。"
echo ""

# 优先用 python3，再退回 python
if command -v python3 >/dev/null 2>&1; then
  PY=python3
elif command -v python >/dev/null 2>&1; then
  PY=python
else
  echo "  [错误] 没找到 python3 / python，请先安装 Python 3。"
  exit 1
fi

# 尝试自动打开浏览器（失败不影响服务）
( sleep 1
  if command -v open >/dev/null 2>&1; then open "$URL"
  elif command -v xdg-open >/dev/null 2>&1; then xdg-open "$URL"
  fi ) >/dev/null 2>&1 &

exec "$PY" -m http.server "$PORT" --bind 127.0.0.1

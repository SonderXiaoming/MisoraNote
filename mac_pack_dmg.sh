#!/usr/bin/env bash
set -euo pipefail

# === 修改这里 ===
APP_NAME="美空笔记"   # 你的 .app 名称（不含 .app 后缀）
APP_DIR="build/macos/Build/Products/Release"
# === 以上即可 ===

APP_PATH="${APP_DIR}/${APP_NAME}.app"
OUT_DIR="dist"
DMG_PATH="${OUT_DIR}/${APP_NAME}.dmg"
STAGE_DIR="${OUT_DIR}/.dmg_stage"

# 1) 工具检查
command -v create-dmg >/dev/null 2>&1 || (echo "[info] brew install create-dmg" && brew install create-dmg)

# 2) 生成校验
if [ ! -d "${APP_PATH}" ]; then
  echo "[error] 未找到 ${APP_PATH}"
  echo "请先执行：flutter build macos --release"
  exit 1
fi

# 3) 准备 staging 目录：只放 .app 和 Applications
rm -rf "${STAGE_DIR}"
mkdir -p "${STAGE_DIR}"
# 复制 .app（用 rsync 保权限/符号链接；没有 rsync 就用 cp -R）
if command -v rsync >/dev/null 2>&1; then
  rsync -a "${APP_PATH}" "${STAGE_DIR}/"
else
  cp -R "${APP_PATH}" "${STAGE_DIR}/"
fi
ln -sf /Applications "${STAGE_DIR}/Applications"

# 4) 输出目录
mkdir -p "${OUT_DIR}"
rm -f "${DMG_PATH}"

# 5) 只对 staging 目录打包（里面只有 .app 和 Applications）
create-dmg \
  --format UDZO \
  --volname "${APP_NAME}" \
  --volicon "${APP_PATH}/Contents/Resources/AppIcon.icns" \
  --window-size 600 400 \
  --icon-size 120 \
  --icon "${APP_NAME}.app" 150 200 \
  --app-drop-link 450 200 \
  "${DMG_PATH}" \
  "${STAGE_DIR}"

echo "[ok] DMG: ${DMG_PATH}"

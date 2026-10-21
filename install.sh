#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

BASE="${DSH_SKINS_HOME:-${DSH_SKINS_DIR:-${DSH_HOME:-$HOME/.dsh}/skins}}"
DEST="$BASE/whale-wallpaper"
ASSETS="https://acgay.oss-cn-hangzhou.aliyuncs.com/dsh-skins/whale-wallpaper/assets"

mkdir -p "$DEST/assets" "$DEST/preview"

echo "→ 安装到 $DEST"
echo "→ 下载背景视频（约 6.3 MB）"
curl -fL --retry 3 --progress-bar -o "$DEST/assets/whale-fantasy-loop.mp4"      "$ASSETS/whale-fantasy-loop.mp4"
echo "→ 下载 11s 定格图"
curl -fL --retry 3 --progress-bar -o "$DEST/assets/whale-wallpaper-11s.jpg"    "$ASSETS/whale-wallpaper-11s.jpg"
echo "→ 下载设置弹窗背景图"
curl -fL --retry 3 --progress-bar -o "$DEST/assets/settings-bg.webp"           "$ASSETS/settings-bg.webp"

cp -f skin.json skin.css patches.css "$DEST/"
cp -f preview/light.jpg preview/dark.jpg "$DEST/preview/"

echo
echo "✓ 已安装：$DEST"
echo "  打开 DSH → 设置 → 皮肤 → 「鲸鱼娘 · 仅壁纸」→ 应用"
echo "  卸载：rm -rf \"$DEST\"，再在皮肤里切回「官方默认」。"

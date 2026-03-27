#!/bin/bash
# Фабрика Контента — Бесплатный курс для Claude Code
# Установка одной командой

set -e

REPO="maximgalson/fabrika-free"
REPO_URL="https://github.com/${REPO}.git"
INSTALL_DIR="$HOME/.fabrika"
SKILL_DIR="$HOME/.claude/commands/fabrika"

echo ""
echo "  Фабрика Контента — Бесплатный курс"
echo "  ===================================="
echo ""

# ── Проверяем Claude Code ────────────────────────────────

for dir in "$HOME/.local/bin" "$HOME/.claude/local/bin" "/usr/local/bin"; do
    if [ -d "$dir" ] && [[ ":$PATH:" != *":$dir:"* ]]; then
        export PATH="$dir:$PATH"
    fi
done

if ! command -v claude &> /dev/null; then
    echo "  Claude Code не установлен."
    echo ""
    echo "  Установи его:"
    echo ""
    echo "    curl -fsSL https://claude.ai/install.sh | bash"
    echo ""
    echo "  Потом запусти этот установщик ещё раз:"
    echo ""
    echo "    curl -fsSL https://raw.githubusercontent.com/${REPO}/main/install.sh | bash"
    echo ""
    exit 0
fi

echo "  Claude Code найден"
echo ""

# ── Скачиваем или обновляем ──────────────────────────────

if [ -d "$INSTALL_DIR" ]; then
    echo "  Обновляю..."
    cd "$INSTALL_DIR"
    git pull --quiet origin main 2>/dev/null || git pull --quiet
    echo "  Обновлено."
else
    echo "  Скачиваю..."
    git clone --quiet "$REPO_URL" "$INSTALL_DIR"
    echo "  Скачано."
fi

echo ""

# ── Устанавливаем скиллы ─────────────────────────────────

echo "  Устанавливаю скиллы..."
mkdir -p "$SKILL_DIR"

SKILL_COUNT=0
for skill_file in "$INSTALL_DIR/skills/"*.md; do
    if [ -f "$skill_file" ]; then
        cp "$skill_file" "$SKILL_DIR/"
        SKILL_NAME=$(basename "$skill_file" .md)
        echo "    /fabrika:${SKILL_NAME}"
        SKILL_COUNT=$((SKILL_COUNT + 1))
    fi
done

echo "  ${SKILL_COUNT} скиллов установлено."
echo ""

# ── Итог ─────────────────────────────────────────────────

echo "  Готово!"
echo ""
echo "  Что установлено:"
echo "  ├── Скиллы    → ~/.claude/commands/fabrika/"
echo "  ├── Курс      → ~/.fabrika/course/"
echo "  └── Подарки   → ~/.fabrika/gifts/"
echo ""
echo "  Для обновления — просто запусти эту команду ещё раз."
echo ""
echo "  ─────────────────────────────────────────────"
echo "  Полная Фабрика Контента: https://galson.pro"
echo "  ─────────────────────────────────────────────"
echo ""
echo "  Теперь набери:"
echo ""
echo "    claude"
echo ""
echo "  И затем:  /fabrika:start"
echo ""

#!/bin/bash
# Cursor Optimization Framework - Setup (React Frontend Version)

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Cursor Optimization Framework - Setup"
echo ""

echo "📁 Создаю структуру .cursor/..."
mkdir -p .cursor/rules
mkdir -p .cursor/context
mkdir -p .cursor/scripts/prompts
mkdir -p .cursor/scripts/bash

echo "📁 Создаю структуру .tasks/..."
mkdir -p .tasks/todo
mkdir -p .tasks/done

echo "📋 Копирую файлы..."
cp "$SCRIPT_DIR/.cursorignore"                         ./.cursorignore
cp "$SCRIPT_DIR/cursor-folder/rules/"*                 ./.cursor/rules/
cp "$SCRIPT_DIR/cursor-folder/context/base.md"         ./.cursor/context/
cp "$SCRIPT_DIR/cursor-folder/scripts/bash/"*.sh       ./.cursor/scripts/bash/
cp "$SCRIPT_DIR/cursor-folder/scripts/prompts/"*.txt   ./.cursor/scripts/prompts/
cp "$SCRIPT_DIR/GUIDE.md"                              ./GUIDE.md
cp "$SCRIPT_DIR/test-framework.sh"                     ./test-framework.sh

chmod +x .cursor/scripts/bash/*.sh
chmod +x test-framework.sh

echo ""
echo "✅ Установка завершена!"
echo ""
echo "📋 Следующие шаги:"
echo "  1. Отредактируй .cursor/context/base.md под свой проект"
echo "  2. Запусти: bash test-framework.sh"
echo "  3. В чате Cursor введи: Выполни анализ @.cursor/scripts/prompts/01-analyze-project.txt"
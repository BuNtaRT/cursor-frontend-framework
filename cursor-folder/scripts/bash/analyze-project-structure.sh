#!/bin/bash
# Анализ структуры проекта - 0 токенов

echo "🔍 Анализ структуры React проекта"
echo "Дата: $(date '+%Y-%m-%d %H:%M')"
echo ""

count_lines() {
    local pattern=$1 name=$2
    local count=$(find . -name "$pattern" \
        -not -path "*/node_modules/*" -not -path "*/dist/*" \
        -not -path "*/build/*" -not -path "*/.git/*" \
        -exec wc -l {} + 2>/dev/null | tail -1 | awk '{print $1}')
    [ -n "$count" ] && [ "$count" != "0" ] && echo "  $name: $count строк"
}

count_files() {
    local pattern=$1 name=$2
    local count=$(find . -name "$pattern" \
        -not -path "*/node_modules/*" -not -path "*/dist/*" \
        -not -path "*/build/*" -not -path "*/.git/*" \
        2>/dev/null | wc -l)
    [ "$count" != "0" ] && echo "  $name: $count файлов"
}

echo "=== Файлы ==="
count_files "*.tsx" "React/TSX"
count_files "*.ts" "TypeScript"
count_files "*.jsx" "React/JSX"
count_files "*.js" "JavaScript"
count_files "*.css" "CSS"
count_files "*.module.css" "CSS Modules"

echo ""
echo "=== Строки кода ==="
count_lines "*.tsx" "React/TSX"
count_lines "*.ts" "TypeScript"
count_lines "*.css" "CSS"

echo ""
echo "=== Крупные файлы (>250 строк) ==="
find . \( -name "*.tsx" -o -name "*.ts" \) -not -path "*/node_modules/*" -not -path "*/dist/*" -exec wc -l {} \; 2>/dev/null | \
    awk '$1 > 250 {print "  ⚠️  "$1" строк: "$2}' | sort -rn | head -15

echo ""
echo "=== TODO / Tech debt ==="
todo_count=$(grep -r "TODO\|FIXME\|HACK\|XXX" . \
    --include="*.ts" --include="*.tsx" --include="*.js" --include="*.jsx" \
    --exclude-dir=node_modules --exclude-dir=.git --exclude-dir=dist 2>/dev/null | wc -l)
echo "  Найдено: $todo_count"

echo ""
echo "✅ Готово"

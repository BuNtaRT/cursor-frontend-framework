#!/bin/bash
# Поиск TODO/FIXME/HACK - 0 токенов
echo "🔍 Tech debt..."
echo ""
grep -rn "TODO\|FIXME\|HACK\|XXX\|BUG\|DEPRECATED" . \
    --include="*.tsx" --include="*.ts" --include="*.jsx" --include="*.js" \
    --exclude-dir=node_modules --exclude-dir=.git --exclude-dir=dist \
    2>/dev/null | sort | head -n 30
echo ""
echo "✅ Готово"
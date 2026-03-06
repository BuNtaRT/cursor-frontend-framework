# Cursor Optimization Framework

Система оптимизации токенов для Cursor IDE, адаптированная для React/Frontend проектов.

## Ключевая идея

При выполнении каждой задачи в контексте только:
- `task-NNN.md` — файл конкретной задачи (без номеров строк)
- Целевые файлы `.tsx`/`.ts`

Не весь план целиком. `plan.md` используется только
для поиска следующей задачи внутри `run-next-task.txt`.

В отличие от бекенд-версии, тут:
1. Нет привязки к номерам строк.
2. Нет автоматических git-коммитов на каждую задачу.
3. Тесты пишутся только по явному флагу `TESTS_REQUIRED: true`.
4. Глобальный кэш проекта живет и обновляется в `.tasks/project-map.md`.
5. Задачи и планы вынесены из `.cursor` в отдельную директорию `.tasks`, чтобы системная папка оставалась чистой, а старые таски легко игнорировались.

## Установка

```bash
git clone https://github.com/motokazmin/cursor-optimization-framework
cd your-react-project
bash ../cursor-optimization-framework/setup.sh
```

## Структура после установки

```
your-project/
├── .cursorignore
├── test-framework.sh
├── GUIDE.md
├── PROCESS.md
├── .tasks/                        # динамические данные и задачи
│   ├── project-map.md             # глобальный кэш структуры проекта
│   ├── plan.md                    # индекс задач
│   ├── todo/task-NNN.md           # задачи к выполнению
│   └── done/task-NNN.md           # выполненные задачи
└── .cursor/                       # статичные шаблоны и настройки
    ├── rules/                     # правила оптимизации и код-стайла
    ├── context/base.md            # глобальное описание проекта
    └── scripts/
        ├── bash/
        │   ├── analyze-project-structure.sh
        │   └── find-todos.sh
        └── prompts/
            ├── 01-analyze-project.txt
            ├── 02-create-plan.txt
            ├── 03-fix-simple-bug.txt
            ├── 04-create-architecture.txt
            ├── 05-refactor.txt
            ├── 05b-refactor-complex.txt
            ├── 06-write-unit-tests.txt
            ├── 09-update-readme.txt
            └── run-next-task.txt    ← единственная точка входа для тасок
```

## Подробнее

См. `GUIDE.md` и `PROCESS.md`
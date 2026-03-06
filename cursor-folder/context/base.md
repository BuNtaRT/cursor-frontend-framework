## Технологический стек

- `React 19` + `TypeScript`
- `Vite`
- `Mantine` (UI, тема)
- `Mantine/charts` (графики)
- `Mantine/form` (формы)
- `Mantine/nprogress`
- `Mantine/modals`
- `Mantine/dates`
- `TanStack Router` (ручная конфигурация роутов)
- `TanStack Query` (мутации/запросы)
- `Jotai` (часть состояния)
- `Axios` (HTTP + interceptors)
- `zod` + `mantine-form-zod-resolver`
- `react-imask` (маска телефона)

## Важные точки входа

- `src/main.tsx` — провайдеры (`MantineProvider`, `QueryClientProvider`, `Jotai Provider`)
- `src/router.tsx` — вся карта маршрутов и auth-guard
- `src/constants/routes.ts` — единый источник путей (функциями)
- `src/theme.ts` — тема Mantine (палитры, primaryColor)

## Структура приложения

- `src/pages-landing/*` — внешний контур (лендинг, auth, confirm)
- `src/pages-statistic/*` — внутренняя система (statistic-модуль)
- `src/components/layout/*` — layout-обвязки (`LandingLayout`, `StatisticLayout`)
- `src/components/sidebar/*` — меню
- `src/api/*` — API-клиенты и схема OpenAPI
- `src/utils/*` — токены, auth-утилиты
- `src/constants/*` — ключи storage, роуты, бренд

## Стилизация и темы

Ключевые файлы:
- `src/theme.ts` — Mantine-тема (палитры, `primaryColor`, шрифты)
- `src/index.css` — CSS-переменные, завязанные на `data-mantine-color-scheme`
- `src/components/**/*.module.css` — локальные стили компонентов

## Важные нюансы и договоренности

1. **Маршруты не хардкодить строками** — использовать `ROUTE_PATHS`.
2. **Storage ключи не хардкодить** — использовать `STORAGE_KEYS`.
3. **Избегать `setState` внутри `useEffect`** без необходимости:
   - в проекте включено правило `react-hooks/set-state-in-effect`.
4. **Для новых форм**:
    - zod-схема + `zod4Resolver`
    - проверка на `blur/submit`, а не на каждый ввод (если не требуется иной UX).
5. Основа — Mantine Theme (`createTheme`), а не "ручной" глобальный reset.
6. `logout()` в `src/utils/authStorage.ts` — централизованная точка очистки токенов.
7. Роутинг в `src/constants/routes.ts` и `src/router.tsx`.
   


## Быстрые команды

- `yarn dev` — запуск dev-сервера
- `yarn lint` — eslint
- `yarn build` — typecheck + production build

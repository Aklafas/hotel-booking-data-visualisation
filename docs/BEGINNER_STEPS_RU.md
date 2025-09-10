# Пошаговое руководство для новичка (РУССКИЙ)

Ниже — понятный план "с нуля" как развернуть и проверить проект на своей машине. Вся работа — локальная (без Docker).

## 0) Скачай ZIP и распакуй
1. Скачай файл `hotel-booking-data-visualisation.zip` (в репозитории / приложенном архиве).
2. Распакуй архив в удобную папку, например `C:\projects\hotel-booking-data-visualisation` или `~/projects/hotel-booking-data-visualisation`.

## 1) Git и GitHub (один раз)
1. Создай новый пустой репозиторий на GitHub (название: `hotel-booking-data-visualisation`).
2. На локальной машине открой терминал/PowerShell и перейди в папку проекта.
3. Инициализируй Git и свяжи с удалённым:
```bash
git init
git add .
git commit -m "Initial skeleton"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/hotel-booking-data-visualisation.git
git push -u origin main
```
4. Установи Git LFS (рекомендуется для `.pbix`):
```bash
# Windows / macOS / Linux
git lfs install
git lfs track "*.pbix"
git add .gitattributes
git commit -m "Enable Git LFS for pbix"
git push
```

## 2) Установи MS SQL Server и инструменты
- Скачай и установи **SQL Server Express / Developer** (если ещё не установлен).
- Установи **SQL Server Management Studio (SSMS)** или **Azure Data Studio**.

## 3) Создай базу и примените схему
1. Открой SSMS и подключись к серверу (локальный instance).
2. Открой `sql/schema.sql` и выполните скрипт — он создаст базу `HotelBooking` и таблицы.
3. Или из командной строки:
```bash
# Пример с Windows Authentication
sqlcmd -S localhost -E -i sql/schema.sql

# Или, если используешь SQL-auth:
sqlcmd -S localhost -U SA -P 'YourPassword' -i sql/schema.sql
```

## 4) Заполни lookup-таблицы
Запусти:
```bash
sqlcmd -S localhost -E -d HotelBooking -i sql/seed.sql
```

## 5) Загрузите sample.csv в таблицу
### Вариант A (рекомендуется для новичка) — SSMS Import Wizard:
1. В SSMS правой кнопкой на базе `HotelBooking` → Tasks → Import Data...
2. Выбери источник: Flat File (CSV) → укажи `data/sample.csv`.
3. На шаге назначения укажи таблицу — `dbo.[2018$]` (или создайте отдельную таблицу).
4. Запусти импорт и проверь данные (SELECT TOP 10 * FROM [dbo].[2018$]).

### Вариант B — BULK INSERT (при желании):
```sql
BULK INSERT [dbo].[2018$]
FROM 'C:\path\to\data\sample.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', TABLOCK);
```
> Если BULK INSERT выдаёт ошибку — используйте Import Wizard.

## 6) Открой Power BI Desktop
1. Если у тебя есть `powerbi/report.pbix`, открой его.
2. Если нет — создайте новый отчёт.
   - Источник данных: подключение к SQL Server (Server: `localhost`, Database: `HotelBooking`).
   - Или импортируйте `data/sample.csv`.
3. Построй визуалы:
   - Cards: Total Revenue (sum), Avg ADR, Total Nights, Avg Discount (если есть), Required Car Spaces (sum).
   - Line chart: Sum of Revenue by Date (hierarchy Year/Quarter/Month/Day) and hotel type.
   - Table: Year, Revenue, Required Car Spaces, Parking Percentage (если вычисляете: required_car_parking_spaces / total_rooms ?).
   - Donut: Revenue by hotel.

## 7) Сделай скриншоты и залей в репо
1. В Power BI Desktop: File → Export → Export to PNG (или снимай экран).
2. Помести изображения в `powerbi/images/`.
3. Добавь и закоммить в Git, затем push.

## 8) Проверка качества (локально)
Установи Python и затем:
```bash
python -m pip install --upgrade pip
pip install sqlfluff codespell
sqlfluff lint sql/ --dialect tsql
codespell .
```

## 9) CI (GitHub Actions)
- После push GitHub автоматически запустит workflow `ci.yml` (sqlfluff + codespell).
- Перейдите в Actions → убедитесь, что прогон успешен.

## 10) Финальная проверка
- README понятен? Да/Нет — при необходимости обновите.
- SQL `sql/query.sql` открывается и выполняется?
- Power BI рендерит визуалы и скриншоты похожи на ожидаемые?

---

Если хочешь, я могу:
- Сгенерировать полный `seed.sql` из `data/sample.csv` (INSERT-ы) — чтобы не импортировать вручную.
- Подготовить готовый `report.pbix` (если опишешь точные DAX-меры).
- Помочь залить `.pbix` в репо с Git LFS.

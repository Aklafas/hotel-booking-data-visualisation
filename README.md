# Hotel Booking Data Visualisation

**Interactive hotel booking analytics demo using MSSQL queries and Power BI visualisations. Includes SQL scripts, sample data, and reproducible dashboards.**

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![CI](https://github.com/USERNAME/hotel-booking-data-visualisation/actions/workflows/ci.yml/badge.svg)](./.github/workflows/ci.yml)
![Power BI](https://img.shields.io/badge/Made%20with-Power%20BI-yellow)

## Overview
This repository contains a portfolio-ready demo that demonstrates:
- Data preparation with **T-SQL (MSSQL)** across multiple yearly tables (2018–2020).
- An interactive **Power BI** report (1 page) with cards, line chart, table and donut chart.
- Reproducible steps to load the sample CSV into SQL Server and connect Power BI to it.
- Basic CI for SQL linting (sqlfluff) and Markdown spellcheck.

**Note:** The Power BI `.pbix` file is large — add it to the `powerbi/` folder and enable Git LFS (see .gitattributes).

---

## Quick links
- SQL query: `sql/query.sql`  
- Schema + seed: `sql/schema.sql`, `sql/seed.sql`  
- Sample CSV: `data/sample.csv`  
- Power BI placeholders: `powerbi/`  
- Instructions for beginners (Russian): `docs/BEGINNER_STEPS_RU.md`

---

## How repository is organized
```
hotel-booking-data-visualisation/
├─ README.md
├─ LICENSE
├─ .gitignore
├─ .gitattributes
├─ sql/
│  ├─ schema.sql
│  ├─ seed.sql
│  └─ query.sql
├─ powerbi/
│  ├─ report.pbix.placeholder
│  └─ images/
├─ data/
│  ├─ sample.csv
│  └─ dictionary.md
├─ scripts/
│  └─ init_db.md
├─ .github/
│  ├─ workflows/ci.yml
│  ├─ ISSUE_TEMPLATE.md
│  └─ PULL_REQUEST_TEMPLATE.md
└─ docs/
   └─ report_overview.md
   └─ BEGINNER_STEPS_RU.md
```

---

## Contributing
Fork, branch, PR. All SQL must pass `sqlfluff lint` (dialect=tsql) and documentation changes should be spellchecked.

---

## License
MIT — see `LICENSE`.

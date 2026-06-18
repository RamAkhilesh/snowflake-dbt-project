# Airbnb dbt + Snowflake Pipeline

A dbt project that transforms raw Airbnb data (bookings, listings, hosts) into analytics-ready models on Snowflake using a **bronze-silver-gold medallion architecture**.

## Architecture

```
Source (AIRBNB.staging)
  └── Bronze  — raw ingestion from staging tables
        └── Silver  — cleaned and typed models
              └── Gold  — business-level fact table and OBT (One Big Table)
```

## Data Sources

| Table      | Description              |
|------------|--------------------------|
| `bookings` | Reservation records      |
| `listings` | Property listing details |
| `hosts`    | Host information         |

## Setup

### Prerequisites

- Python 3.12+
- A Snowflake account with an `AIRBNB` database and `staging` schema seeded with source data

### Install

```bash
uv sync
```

### Run

```bash
cd dbt_project
dbt seed     # load CSV seed data
dbt run      # build all models
dbt test     # run tests
```

## Project Structure

```
source_data/          # raw CSV files (bookings, listings, hosts)
dbt_project/
  models/
    bronze/           # raw staging mirrors
    silver/           # cleaned transformations
    gold/
      ephemeral/      # intermediate ephemeral models
      fact.sql        # fact table
      obt.sql         # one big table for analytics
  seeds/
  tests/
```

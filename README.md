# Airbnb_Analytics_with_dbt_and_Snowflake



## 🔍 Project Overview

This project showcases how I use **dbt and Snowflake** to transform raw Airbnb data into **trusted, analytics-ready datasets** that support reporting, exploratory analysis, and decision-making.

While my core role is that of a **Senior Data Analyst**, this project demonstrates my ability to work confidently with **large-scale data**, apply structured data modeling, enforce data quality, and clearly document business logic using modern data tooling.

The emphasis of this work is not only on transformation, but on **making data accurate, explainable, and usable for analysis**.



## Project Goals

- Convert raw Airbnb source data into **clean, well-defined analytical models**
- Apply **business logic and data quality rules** directly in transformations
- Design **fact and dimension tables** suitable for reporting and BI tools
- Demonstrate comfort working with **Snowflake-scale data**
- Document models so other analysts can easily understand and reuse them




## Why this Project Matters

As a Senior Data Analyst, I focus on more than querying data — I focus on data quality, clarity, and usability.

This project demonstrates my ability to:

- Work directly with Snowflake and large datasets

- Design and maintain analytics-ready data models

- Apply business rules within transformations

- Use modern tools like dbt to improve reliability and documentation

- Bridge the gap between raw data and meaningful insights




## Tech Stack

- dbt Core – data transformation and modeling

- Snowflake – cloud data warehouse

- SQL – transformation logic

- GitHub – version control & collaboration



## Data Source

The project uses Airbnb datasets containing information about:

- Listings

- Hosts

- Reviews

- Locations and pricing

Raw data is assumed to already exist in Snowflake and is treated as the source layer, with dbt handling all downstream transformations.



## Data Modeling Approach

This project follows a layered modeling approach commonly used in modern analytics workflows.

### Staging Models
**Purpose:** Light transformations and standardization of raw source data.

**Location:** `models/staging/`

- `src_listings.sql`
- `src_hosts.sql`
- `src_reviews.sql`

These models:
- Rename columns for clarity
- Apply basic type casting
- Preserve the original grain of the source tables



### Analytics Models (Dimensions & Facts)
**Purpose:** Create analytics-ready tables with applied business logic, optimised for reporting and BI tools

**Location:** `models/marts/`

#### Dimension Tables
- **`dim_listings_cleansed.sql`**  
  Cleans and standardizes listing attributes such as price, minimum nights, and availability.

- **`dim_hosts_cleansed.sql`**  
  Provides a clean, reliable view of Airbnb hosts with historical tracking support.

#### Fact Tables
- **`fct_reviews.sql`**  
  Incremental fact table at the grain of **one review per listing per review date**, optimized for scale and performance.



### Analytical Mart
- **`mart_fullmoon_reviews.sql`**

This mart combines review data with a seeded calendar of full moon dates to support exploratory analysis around temporal patterns in customer behavior.



## Orchestration with Dagster

This project uses **Dagster** to orchestrate dbt models, tests, seeds, and snapshots, ensuring that analytical datasets are built in a reliable and repeatable way.

Dagster is used to:
- Schedule dbt runs
- Manage execution order and dependencies
- Surface failures early in the pipeline
- Support production-style analytical workflows

The goal of orchestration in this project is not complexity, but **reliability and reproducibility** of analytics outputs.



## Key Analytical Questions Answered

This project is designed to answer real analytical questions, including:

- How do listing prices, availability, and minimum stay requirements vary across Airbnb listings?
- How does review activity change over time?
- Do customer reviews show any noticeable patterns around full moon dates?
- How can raw Airbnb data be transformed into reliable datasets that analysts can confidently use for reporting?

These questions guided the structure of the models and the business logic applied throughout the project.



## Data Quality & Testing

To ensure analytical reliability, the project includes multiple layers of data validation:

- not-nulls, unique, relationhsips
- Custom SQL tests enforcing business rules (e.g. minimum nights ≥ 1)
- Reusable generic tests (row count thresholds, positive value checks)
- Source freshness checks
- Snapshotting to track historical changes in key entities

These checks help ensure that downstream analysis is built on **accurate and trustworthy data**.



## Documentation

All models are documented using dbt’s documentation framework, with an emphasis on:

- Business meaning of fields
- Reasoning behind data cleansing decisions
- Clear communication for other analysts

To generate documentation locally:

```bash
dbt docs generate
dbt docs serve
```


## How to Run the Project

```bash
dbt deps
dbt run
dbt test
```




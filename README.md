# dbt Project: Les Vélos de Didier

This dbt project transforms raw data from the `les_velos_de_didier_dwh` data warehouse into clean, analytics-ready models. It includes staging models for data cleaning and two data marts: one for clients and one for products.

# Create new virtual environment for dbt
```bash
python -m venv dbt-env 
source dbt-env/Scripts/activate  # On Windows
```

# Install dbt and the Snowflake adapter
```bash
pip install dbt-core dbt-snowflake
```

<pre> ```plaintext cas_pratique_dbt/ ├── models/ │ ├── staging/ # Staging models (prefixed with stg_) │ │ ├── stg_customers.sql │ │ ├── stg_orders.sql │ │ ├── stg_order_items.sql │ │ └── stg_products.sql │ └── marts/ # Business logic models │ ├── clients/ │ │ └── dm_clients.sql │ └── products/ │ └── dm_products.sql │ ├── src/ │ └── src_les_velos_de_didier.yml ├── tests/ # Custom tests ├── macros/ # Macros │ └── is_uppercase.sql ├── dbt_project.yml # Main project configuration └── README.md # Project documentation ``` </pre>

# Running all the model
dbt run
## Build the staging layer
dbt run --select staging
## Build the Clients Data Mart
dbt run --select marts.clients.*
## Build the Products Data Mart
dbt run --select marts.products.*

# Run All Tests
dbt test
## Run Tests for Staging Only
dbt test --select staging
## Run Tests for Clients Only
dbt test --select marts.clients.*
## Run Tests for Products Only
dbt test --select marts.products.*

# Generate Docs
dbt docs generate
# Serve docs Locally*
dbt docs serve

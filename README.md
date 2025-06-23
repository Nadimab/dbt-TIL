# dbt-TIL
# Create new virtual environment for dbt
python -m venv dbt-env
source dbt-env/Scripts/activate  # On Windows

# Reinstall dbt and adapter here
pip install dbt-core dbt-snowflake

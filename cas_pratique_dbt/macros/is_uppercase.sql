{% macro test_is_uppercase(model, column_name) %}
select *
from {{ model }}
where {{ column_name }} != upper({{ column_name }})
  and {{ column_name }} is not null
{% endmacro %}

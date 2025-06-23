
with source as (
    select * from {{ source('les_velos_de_didier_dwh', 'orders') }}
)
select * from source
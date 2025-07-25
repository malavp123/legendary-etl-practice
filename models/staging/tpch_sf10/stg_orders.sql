{{ config(materialized='view') }}

with source as (
    select * from {{ source('tpch_sf10_sample_data', 'orders') }}
  ),

renamed as (
    SELECT
        o_orderkey AS order_id,
        o_custkey AS customer_id,
        o_orderstatus AS order_status,
        o_totalprice AS total_price,
        o_orderdate AS order_date
    FROM source
)
    
select * from renamed

with adwords as (
    select
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    from {{ ref('stg_greenweez__adwords') }}
),

bing as (
    select
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    from {{ ref('stg_greenweez__bing') }}
),

criteo as (
    select
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    from {{ ref('stg_greenweez__criteo') }}
),

facebook as (
    select
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    from {{ ref('stg_greenweez__facebook') }}
)

select * from adwords
union all
select * from bing
union all
select * from criteo
union all
select * from facebook
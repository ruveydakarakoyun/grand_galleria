with source as (

    select *
    from {{ ref('stg_grand_galleria__data4') }}

),

store_master as (

    select

        magaza_id,
        grup_adi,
        lokasyon,
        il,
        magaza_tipi,
        durum,
        m2,
        acilis_tarihi,
        kapanis_tarihi,

        case
            when lower(durum) like 'lfl%' then 1
            when lower(durum) = 'pup' then 1
            else 0
        end as aktif_magaza_flag,

        case
            when lower(durum) in ('cls', 'canceled') then 0
            else 1
        end as acik_magaza_flag

    from source

)

select *
from store_master
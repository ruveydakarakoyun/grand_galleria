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
            when lower(durum) like '%aktif%' then 1
            else 0
        end as aktif_magaza_flag,

        case
            when kapanis_tarihi is null
                 or trim(kapanis_tarihi) = ''
            then 1
            else 0
        end as acik_magaza_flag

    from source

)

select *
from store_master
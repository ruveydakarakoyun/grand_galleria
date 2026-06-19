with source as (

    select *
    from {{ ref('int_grand_galleria__data4_store_master') }}

),

store_network as (

    select

        il,

        count(distinct magaza_id) as magaza_sayisi,

        sum(aktif_magaza_flag) as aktif_magaza_sayisi,

        sum(acik_magaza_flag) as acik_magaza_sayisi,

        avg(m2) as ortalama_m2,

        max(m2) as en_buyuk_magaza_m2,

        min(m2) as en_kucuk_magaza_m2

    from source

    group by il

)

select *
from store_network
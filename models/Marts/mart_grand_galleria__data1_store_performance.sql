with source as (

    select *
    from {{ ref('int_grand_galleria__data1_inventory_sales') }}

)

select

    magaza_id,
    magaza,

    sum(ty_toplam_satis_tutari) as toplam_ciro,
    sum(ty_toplam_satis_adedi) as toplam_satis_adedi,

    sum(ty_stok_adedi) as toplam_stok_adedi,
    sum(ty_stok_tutari) as toplam_stok_tutari,

    avg(ciro_buyume_orani) as ortalama_ciro_buyume_orani,
    avg(adet_buyume_orani) as ortalama_adet_buyume_orani,

    avg(sell_through_orani) as ortalama_sell_through_orani,

    avg(ortalama_birim_satis_fiyati) as ortalama_birim_satis_fiyati

from source

group by
    magaza_id,
    magaza
with source as (

    select *
    from {{ ref('stg_grand_galleria__data1') }}

),

inventory_sales as (

    select

        magaza_id,
        magaza,
        grup,

        ust_marka,
        marka_kod,
        ana_grubu,
        urun_grubu,
        ust_mal_grubu,
        mal_grubu,

        urun_yil,
        urun_sezon,
        cinsiyet,

        ly_toplam_satis_adedi,
        ty_toplam_satis_adedi,

        ly_toplam_satis_tutari,
        ty_toplam_satis_tutari,

        ly_stok_adedi,
        ty_stok_adedi,

        ly_stok_tutari,
        ty_stok_tutari,

        safe_divide(
            ty_toplam_satis_tutari - ly_toplam_satis_tutari,
            nullif(ly_toplam_satis_tutari, 0)
        ) as ciro_buyume_orani,

        safe_divide(
            ty_toplam_satis_adedi - ly_toplam_satis_adedi,
            nullif(ly_toplam_satis_adedi, 0)
        ) as adet_buyume_orani,

        safe_divide(
            ty_toplam_satis_adedi,
            nullif(ty_stok_adedi + ty_toplam_satis_adedi, 0)
        ) as sell_through_orani,

        safe_divide(
            ty_toplam_satis_tutari,
            nullif(ty_toplam_satis_adedi, 0)
        ) as ortalama_birim_satis_fiyati

    from source

)

select *
from inventory_sales
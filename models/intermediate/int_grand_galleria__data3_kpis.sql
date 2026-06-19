with source as (

    select *
    from {{ ref('stg_grand_galleria__data3') }}

)

select

    tarih,
    magaza_id,
    magaza_adi,

    satis_adedi,
    satis_tutari,

    iade_adedi,
    iade_tutari,

    safe_divide(
        musteri_sayisi_satis,
        musteri_sayisi_giren
    ) as donusum_orani,

    safe_divide(
        satis_tutari,
        nullif(satis_adedi,0)
    ) as ortalama_sepet_tutari,

    safe_divide(
        satis_adedi,
        nullif(satis_fatura_sayisi,0)
    ) as upt,

    safe_divide(
        iade_adedi,
        nullif(satis_adedi,0)
    ) as iade_orani

from source
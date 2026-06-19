with source as (

    select *
    from {{ ref('int_grand_galleria__data3_kpis') }}

)

select

    magaza_id,
    magaza_adi,

    sum(satis_tutari) as toplam_ciro,

    sum(satis_adedi) as toplam_satis_adedi,

    avg(donusum_orani) as ortalama_donusum_orani,

    avg(ortalama_sepet_tutari) as ortalama_sepet_tutari,

    avg(upt) as ortalama_upt,

    avg(iade_orani) as ortalama_iade_orani

from source

group by
    magaza_id,
    magaza_adi
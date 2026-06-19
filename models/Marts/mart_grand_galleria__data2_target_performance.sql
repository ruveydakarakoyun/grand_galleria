with source as (

    select *
    from {{ ref('int_grand_galleria__data2_targets') }}

),

store_target_performance as (

    select

        grup,
        lfl_statu,
        magaza_id,
        magaza_adi,

        sum(ciro_ly_mtd) as toplam_ciro_ly_mtd,
        sum(ciro_ty_mtd) as toplam_ciro_ty_mtd,
        sum(hedef_ay) as toplam_hedef_ay,
        sum(hedef_ay_sapma) as toplam_hedef_ay_sapma,

        sum(ciro_ly_ytd) as toplam_ciro_ly_ytd,
        sum(ciro_ty_ytd) as toplam_ciro_ty_ytd,
        sum(hedef_ytd) as toplam_hedef_ytd,

        safe_divide(
            sum(ciro_ty_mtd),
            nullif(sum(hedef_ay), 0)
        ) as hedef_gerceklesme_orani_mtd,

        safe_divide(
            sum(ciro_ty_ytd),
            nullif(sum(hedef_ytd), 0)
        ) as hedef_gerceklesme_orani_ytd,

        safe_divide(
            sum(ciro_ty_mtd) - sum(ciro_ly_mtd),
            nullif(sum(ciro_ly_mtd), 0)
        ) as buyume_orani_mtd,

        safe_divide(
            sum(ciro_ty_ytd) - sum(ciro_ly_ytd),
            nullif(sum(ciro_ly_ytd), 0)
        ) as buyume_orani_ytd

    from source

    group by
        grup,
        lfl_statu,
        magaza_id,
        magaza_adi

)

select *
from store_target_performance
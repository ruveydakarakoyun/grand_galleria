with source as (

    select *
    from {{ ref('stg_grand_galleria__data2') }}

),

kpis as (

    select

        grup,
        lfl_statu,
        magaza_id,
        magaza_adi,

        ciro_ly_mtd,
        ciro_ty_mtd,

        hedef_ay,
        hedef_ay_sapma,

        ciro_ly_ytd,
        ciro_ty_ytd,

        hedef_ytd,

        safe_divide(
            ciro_ty_mtd,
            nullif(hedef_ay,0)
        ) as hedef_gerceklesme_orani_mtd,

        safe_divide(
            ciro_ty_ytd,
            nullif(hedef_ytd,0)
        ) as hedef_gerceklesme_orani_ytd,

        safe_divide(
            ciro_ty_mtd - ciro_ly_mtd,
            nullif(ciro_ly_mtd,0)
        ) as buyume_orani_mtd,

        safe_divide(
            ciro_ty_ytd - ciro_ly_ytd,
            nullif(ciro_ly_ytd,0)
        ) as buyume_orani_ytd

    from source

)

select *
from kpis
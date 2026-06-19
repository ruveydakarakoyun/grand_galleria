with source as (

    select *
    from {{ source('grand_galleria', 'data2') }}

),

cleaned as (

    select
        trim(Grup) as grup,
        trim(LFL_Statu) as lfl_statu,
        trim(MagazaId) as magaza_id,
        trim(Magaza) as magaza_adi,

        coalesce(Ciro_LY__MTD_, 0) as ciro_ly_mtd,
        coalesce(Ciro_TY__MTD_, 0) as ciro_ty_mtd,
        coalesce(Degisim_yuzde_MTD_, 0) as degisim_yuzde_mtd,
        coalesce(Reel_Ddegisim_yuzde_MTD_, 0) as reel_degisim_yuzde_mtd,

        coalesce(Hedef__Ay_, 0) as hedef_ay,
        coalesce(Hedef_Ay_Sapma, 0) as hedef_ay_sapma,
        coalesce(Hedef__Ay__HGO_yuzde, 0) as hedef_ay_hgo_yuzde,

        coalesce(LY_Ay_Ciro, 0) as ly_ay_ciro,

        coalesce(Ciro_LY__YTD_, 0) as ciro_ly_ytd,
        coalesce(Ciro_TY__YTD_, 0) as ciro_ty_ytd,
        coalesce(Degisim_yuzde__YTD_, 0) as degisim_yuzde_ytd,
        coalesce(Reel_degisim_yuzde__YTD_, 0) as reel_degisim_yuzde_ytd,

        coalesce(Hedef__YTD_, 0) as hedef_ytd,
        coalesce(Hedef_HGO_yuzde___YTD_, 0) as hedef_hgo_yuzde_ytd

    from source

    where MagazaId is not null

)

select *
from cleaned
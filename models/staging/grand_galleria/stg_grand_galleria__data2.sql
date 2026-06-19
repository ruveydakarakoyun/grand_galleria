with 

source as (

    select * from {{ source('grand_galleria', 'data2') }}

),

renamed as (

    select
        grup,
        lfl_statu,
        magazaid,
        magaza,
        ciro_ly__mtd_,
        ciro_ty__mtd_,
        degisim__yuzde_mtd_,
        reel_degisim_yuzde__mtd_,
        hedef__ay_,
        hedef_ay_sapma,
        hedef__ay__hgo_yuzde,
        ly_ay_ciro,
        ciro_ly__ytd_,
        ciro_ty__ytd_,
        degisim_yuzde__ytd_,
        reel_degisim_yuzde__ytd_,
        hedef__ytd_,
        hedef_hgo_yuzde___ytd_

    from source

)

select * from renamed
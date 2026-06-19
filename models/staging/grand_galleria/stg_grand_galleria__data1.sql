with 

source as (

    select * from {{ source('grand_galleria', 'data1') }}

),

renamed as (

    select
        grup,
        magazaid,
        magaza,
        ust_marka,
        marka_kod,
        _ana_grubu,
        urun_grubu,
        ust_mal_grubu,
        _mal_grubu,
        urunyil,
        urunsezon,
        cinsiyet,
        kdvoran,
        ly_toplam_satis_adedi,
        ty_toplam_satis_adedi,
        ly_toplam_satis_tutar__,
        ty_toplam_satis_tutar__,
        ly_stok_adedi,
        ty_stok_adedi,
        ly_stok_tutar__,
        ty_stok_tutar__

    from source

)

select * from renamed
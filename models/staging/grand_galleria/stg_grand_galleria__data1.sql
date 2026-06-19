with source as (

    select *
    from {{ source('grand_galleria', 'data1') }}

),

cleaned as (

    select

        trim(Grup) as grup,
        MagazaId as magaza_id,
        trim(Magaza) as magaza,

        trim(Ust_Marka) as ust_marka,
        trim(MARKA_KOD) as marka_kod,
        trim(_Ana_Grubu) as ana_grubu,
        trim(Urun_Grubu) as urun_grubu,
        trim(Ust_Mal_Grubu) as ust_mal_grubu,
        trim(_Mal_Grubu) as mal_grubu,

        UrunYil as urun_yil,
        trim(UrunSezon) as urun_sezon,
        trim(Cinsiyet) as cinsiyet,

        coalesce(KdvOran, 0) as kdv_oran,

        coalesce(LY_Toplam_Satis_Adedi, 0) as ly_toplam_satis_adedi,
        coalesce(TY_Toplam_Satis_Adedi, 0) as ty_toplam_satis_adedi,

        coalesce(LY_Toplam_Satis_Tutar__, 0) as ly_toplam_satis_tutari,
        coalesce(TY_Toplam_Satis_Tutar__, 0) as ty_toplam_satis_tutari,

        coalesce(LY_Stok_Adedi, 0) as ly_stok_adedi,
        coalesce(TY_Stok_Adedi, 0) as ty_stok_adedi,

        coalesce(LY_Stok_Tutar__, 0) as ly_stok_tutari,
        coalesce(TY_Stok_Tutar__, 0) as ty_stok_tutari

    from source

    where Magaza is not null

)

select *
from cleaned
with source as (

    select *
    from {{ source('grand_galleria', 'data3') }}

),

cleaned as (

    select
        trim(grup_adi) as grup_adi,
        magaza_id,
        trim(magaza_adi) as magaza_adi,

        trim(type) as magaza_tipi,
        trim(status) as status,

        yil,
        ay,
        tarih,

        coalesce(satis_adedi, 0) as satis_adedi,
        coalesce(satis_tutari, 0) as satis_tutari,

        coalesce(iade_adedi, 0) as iade_adedi,
        coalesce(iade_tutar__, 0) as iade_tutari,

        coalesce(satis_fatura_sayisi, 0) as satis_fatura_sayisi,
        coalesce(iade_fatura_sayisi, 0) as iade_fatura_sayisi,

        coalesce(musteri_sayisi_giren, 0) as musteri_sayisi_giren,
        coalesce(musteri_sayisi_satis, 0) as musteri_sayisi_satis,

        coalesce(satis_tutari__esatis_dahil_, 0) as satis_tutari_esatis_dahil

    from source

    where magaza_id is not null
      and tarih is not null

)

select *
from cleaned
with 

source as (

    select * from {{ source('grand_galleria', 'data3') }}

),

renamed as (

    select
        grup_adi,
        magaza_id,
        magaza_adi,
        type,
        status,
        yil,
        ay,
        tarih,
        satis_adedi,
        satis_tutari,
        iade_adedi,
        iade_tutar__,
        satis_fatura_sayisi,
        iade_fatura_sayisi,
        musteri_sayisi_giren,
        musteri_sayisi_satis,
        satis_tutari__esatis_dahil_

    from source

)

select * from renamed
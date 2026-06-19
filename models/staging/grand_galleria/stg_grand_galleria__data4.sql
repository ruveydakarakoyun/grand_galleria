with source as (

    select *
    from {{ source('grand_galleria', 'data4') }}

),

cleaned as (

    select

        trim(Grup_Adi) as grup_adi,
        ID as magaza_id,
        trim(Lokasyon) as lokasyon,
        trim(Il) as il,

        Acilis_Tarihi as acilis_tarihi,
        Kapanis_Tarihi as kapanis_tarihi,

        trim(Type) as magaza_tipi,
        trim(Durum) as durum,

        safe_cast(m2 as int64) as m2

    from source

)

select *
from cleaned
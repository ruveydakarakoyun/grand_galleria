with 

source as (

    select * from {{ source('grand_galleria', 'data1') }}

),

renamed as (

    select
        grup_adi,
        id,
        lokasyon,
        il,
        acilis_tarihi,
        kapanis_tarihi,
        type,
        durum,
        m2

    from source

)

select * from renamed
SELECT
    Grup,
    MagazaId,
    CASE
        WHEN Magaza LIKE 'Grand Galleria%' THEN
            REGEXP_REPLACE(
                REGEXP_REPLACE(Magaza, r'^Grand Galleria\s+', ''),
                r'^(365|Butik|BOUTIQUE)\s+',
                ''
            )
        ELSE Magaza
    END AS Magaza_Lokasyon,
    Ust_Marka,
    MARKA_KOD,
    _Ana_Grubu,
    Urun_Grubu,
    Ust_Mal_Grubu,
    _Mal_Grubu,
    UrunYil,
    UrunSezon,
    Cinsiyet,
    KdvOran,
    COALESCE(LY_Toplam_Satis_Adedi, 0) AS LY_Toplam_Satis_Adedi,
    COALESCE(TY_Toplam_Satis_Adedi, 0) AS TY_Toplam_Satis_Adedi,
    COALESCE(LY_Toplam_Satis_Tutar__, 0) AS LY_Toplam_Satis_Tutar__,
    COALESCE(TY_Toplam_Satis_Tutar__, 0) AS TY_Toplam_Satis_Tutar__,
    COALESCE(LY_Stok_Adedi, 0) AS LY_Stok_Adedi,
    COALESCE(TY_Stok_Adedi, 0) AS TY_Stok_Adedi,
    COALESCE(LY_Stok_Tutar__, 0) AS LY_Stok_Tutar__,
    COALESCE(TY_Stok_Tutar__, 0) AS TY_Stok_Tutar__
FROM {{ source('grand_galleria', 'data1') }}
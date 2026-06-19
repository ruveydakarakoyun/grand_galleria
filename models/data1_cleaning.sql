WITH cleaned AS (
    SELECT
        *,
        TRIM(REGEXP_REPLACE(Magaza, r'^\*+', '')) AS Magaza_Temiz
    FROM {{ ref('stg_grand_galleria__data1') }}
)

SELECT DISTINCT
    Grup,
    MagazaId,

    CASE
        WHEN Magaza_Temiz LIKE 'ESKİ%Grand Galleria %' THEN 'Grand Galleria'

        WHEN Magaza_Temiz LIKE 'Grand Galleria 365 %' THEN 'Grand Galleria 365'

        WHEN Magaza_Temiz LIKE 'Grand Galleria Butik %' THEN 'Grand Galleria BOUTIQUE'
        WHEN Magaza_Temiz LIKE 'Grand Galleria BOUTIQUE %' THEN 'Grand Galleria BOUTIQUE'
        WHEN UPPER(Magaza_Temiz) LIKE 'V.%BUTIK %' THEN 'Grand Galleria BOUTIQUE'

        WHEN Magaza_Temiz LIKE 'Grand Galleria MAN %' THEN 'Grand Galleria MAN'
        WHEN Magaza_Temiz LIKE 'GG MAN %' THEN 'Grand Galleria MAN'

        WHEN Magaza_Temiz LIKE 'HOME %' THEN 'Grand Galleria HOME'

        WHEN Magaza_Temiz LIKE 'DUTY FREE %' THEN 'DUTY FREE'

        WHEN UPPER(Magaza_Temiz) LIKE 'OUTLET GRAND GALLERIA %' THEN 'Grand Galleria OUTLET'
        WHEN UPPER(Magaza_Temiz) LIKE 'OUTLET %' THEN 'Grand Galleria OUTLET'

        WHEN UPPER(Magaza_Temiz) LIKE 'COUTURE %' THEN 'COUTURE'

        WHEN Magaza_Temiz LIKE 'ESATIŞ%' THEN Magaza_Temiz
        WHEN Magaza_Temiz LIKE 'FASHION DEPOT%' THEN Magaza_Temiz

        ELSE Magaza_Temiz
    END AS Magaza,

    CASE
        WHEN Magaza_Temiz LIKE 'ESKİ%Grand Galleria %' THEN
            REGEXP_REPLACE(
                Magaza_Temiz,
                r'^ESKİ\s*\*+\s*Grand Galleria\s+',
                ''
            )

        WHEN Magaza_Temiz LIKE 'Grand Galleria%' THEN
            REGEXP_REPLACE(
                REGEXP_REPLACE(Magaza_Temiz, r'^Grand Galleria\s+', ''),
                r'^(365|Butik|BOUTIQUE|MAN)\s+',
                ''
            )

        WHEN UPPER(Magaza_Temiz) LIKE 'V.%BUTIK %' THEN
            REGEXP_REPLACE(
                Magaza_Temiz,
                r'(?i)^V\.\s*BUTIK\s+',
                ''
            )

        WHEN Magaza_Temiz LIKE 'HOME %' THEN
            REGEXP_REPLACE(Magaza_Temiz, r'^HOME\s+', '')

        WHEN Magaza_Temiz LIKE 'DUTY FREE %' THEN
            REGEXP_REPLACE(Magaza_Temiz, r'^DUTY FREE\s+', '')

        WHEN Magaza_Temiz LIKE 'GG MAN %' THEN
            REGEXP_REPLACE(Magaza_Temiz, r'^GG MAN\s+', '')

        WHEN Magaza_Temiz LIKE 'Grand Galleria MAN %' THEN
            REGEXP_REPLACE(Magaza_Temiz, r'^Grand Galleria MAN\s+', '')

        WHEN UPPER(Magaza_Temiz) LIKE 'OUTLET GRAND GALLERIA %' THEN
            REGEXP_REPLACE(Magaza_Temiz, r'(?i)^OUTLET GRAND GALLERIA\s+', '')

        WHEN UPPER(Magaza_Temiz) LIKE 'OUTLET %' THEN
            REGEXP_REPLACE(Magaza_Temiz, r'(?i)^OUTLET\s+', '')

        WHEN UPPER(Magaza_Temiz) LIKE 'COUTURE %' THEN
            REGEXP_REPLACE(Magaza_Temiz, r'(?i)^COUTURE\s+', '')

        WHEN Magaza_Temiz LIKE 'ESATIŞ%' THEN Magaza_Temiz
        WHEN Magaza_Temiz LIKE 'FASHION DEPOT%' THEN Magaza_Temiz

        ELSE Magaza_Temiz
    END AS Magaza_Lokasyon,

    Ust_Marka,
    MARKA_KOD,
    _Ana_Grubu,
    Urun_Grubu,
    Ust_Mal_Grubu,
    _Mal_Grubu,
    UrunYil,
    UrunSezon,
    COALESCE(Cinsiyet, 'Unknown') AS Cinsiyet,
    KdvOran,

    COALESCE(LY_Toplam_Satis_Adedi, 0) AS LY_Toplam_Satis_Adedi,
    COALESCE(TY_Toplam_Satis_Adedi, 0) AS TY_Toplam_Satis_Adedi,
    COALESCE(LY_Toplam_Satis_Tutar__, 0) AS LY_Toplam_Satis_Tutar__,
    COALESCE(TY_Toplam_Satis_Tutar__, 0) AS TY_Toplam_Satis_Tutar__,
    COALESCE(LY_Stok_Adedi, 0) AS LY_Stok_Adedi,
    COALESCE(TY_Stok_Adedi, 0) AS TY_Stok_Adedi,
    COALESCE(LY_Stok_Tutar__, 0) AS LY_Stok_Tutar__,
    COALESCE(TY_Stok_Tutar__, 0) AS TY_Stok_Tutar__

FROM cleaned

WHERE NOT (
    COALESCE(LY_Toplam_Satis_Adedi, 0) = 0
    AND COALESCE(TY_Toplam_Satis_Adedi, 0) = 0
    AND COALESCE(LY_Toplam_Satis_Tutar__, 0) = 0
    AND COALESCE(TY_Toplam_Satis_Tutar__, 0) = 0
    AND COALESCE(LY_Stok_Adedi, 0) = 0
    AND COALESCE(TY_Stok_Adedi, 0) = 0
    AND COALESCE(LY_Stok_Tutar__, 0) = 0
    AND COALESCE(TY_Stok_Tutar__, 0) = 0
)
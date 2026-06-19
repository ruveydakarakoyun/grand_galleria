SELECT
    Magaza,
    Magaza_Lokasyon,
    SUM(TY_Toplam_Satis_Tutar__) AS toplam_ciro,
    SUM(TY_Toplam_Satis_Adedi) AS toplam_satis_adedi,
    SUM(TY_Stok_Adedi) AS toplam_stok_adedi,
    SUM(TY_Stok_Tutar__) AS toplam_stok_tutari
FROM {{ ref('data1_cleaning') }}
GROUP BY
    Magaza,
    Magaza_Lokasyon
SELECT
  COALESCE(ly_toplam_satis_adedi, 0) AS ly_toplam_satis_adedi
FROM {{ source('grand_galleria', 'data1') }}
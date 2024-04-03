--  3) “Yazılım” veya “Donanım” birimlerinde çalışanların ad, soyad ve maaş bilgilerini listeleyen SQL sorgusunu yazınız. (Tek bir sorgu ile)
SELECT ad, soyad, maas FROM calisanlar WHERE calisan_birim_id IN (SELECT birim_id FROM birimler WHERE birim_ad IN ('Yazılım','Donanım'))

--  4) Maaşı en yüksek olan çalışanların ad, soyad ve maaş bilgilerini listeleyen SQL sorgusunu yazınız. (Tek bir sorgu ile)
SELECT ad, soyad, maas FROM calisanlar WHERE maas >= ALL (SELECT maas FROM calisanlar)

--  5) Birimlerin her birinde kaç adet çalışan olduğunu ve birimlerin isimlerini listeleyen sorguyu yazınız. (Tek bir sorgu ile) (Örneğin; x biriminde 3 çalışan var gibi düşünebilirsiniz.) (Gruplamalı sorgu ile)
SELECT birim_ad, COUNT (DISTINCT calisan_id) as calisan_sayisi FROM calisanlar INNER JOIN birimler ON calisan_birim_id = birim_id GROUP BY birim_ad

--  6) Birden fazla çalışana ait olan unvanların isimlerini ve o unvan altında çalışanların sayısını listeleyen sorguyu yazınız. (Tek bir sorgu ile)
SELECT * FROM (SELECT unvan_calisan, COUNT (DISTINCT unvan_calisan_id) as calisan_sayisi FROM unvan GROUP BY unvan_calisan) as uc WHERE calisan_sayisi > 1

--  7) Maaşları “50000” ve “100000” arasında değişen çalışanların ad, soyad ve maaş bilgilerini listeleyen sorguyu yazınız. (Tek bir sorgu ile)
SELECT ad, soyad, maas from calisanlar WHERE maas BETWEEN 50000 AND 100000

--  8) İkramiye hakkına sahip çalışanlara ait ad, soyad, birim, unvan ve ikramiye ücreti bilgilerini listeleyen sorguyu yazınız. (Tek bir sorgu ile)
SELECT c.ad, c.soyad, b.birim_ad, u.unvan_calisan, i.ikramiye_ucret FROM unvan u
LEFT OUTER JOIN calisanlar c ON (u.unvan_calisan_id = c.calisan_id)
LEFT OUTER JOIN birimler b ON (c.calisan_birim_id = b.birim_id)
INNER JOIN ikramiye i ON (c.calisan_id = i.ikramiye_calisan_id)
WHERE c.calisan_birim_id IS NOT NULL 
  OR u.unvan_calisan_id IS NOT NULL

--  9) Ünvanı “Yönetici” ve “Müdür” olan çalışanların ad, soyad ve ünvanlarını listeleyen sorguyu yazınız. (Tek bir sorgu ile)
SELECT ad, soyad, unvan_calisan FROM calisanlar INNER JOIN unvan ON calisan_id = unvan_calisan_id WHERE unvan_calisan IN ('Yönetici','Müdür')

-- 10) Her bir birimde en yüksek maaş alan çalışanların ad, soyad ve maaş bilgilerini listeleyen sorguyu yazınız. (Tek bir sorgu ile)
SELECT ad, soyad, maas FROM (SELECT MAX(maas) as max_maas, calisan_birim_id FROM calisanlar GROUP BY calisan_birim_id) o INNER JOIN calisanlar ON max_maas = maas
# Veritabani-Lab-Odev-3

## Veritabanının oluşturulması:

```sql
CREATE DATABASE [odev3] ON PRIMARY
(
NAME= vtlab3_data,
FILENAME = "C:\vtlab\vtlab3data.mdf",
SIZE = 8MB,
MAXSIZE = unlimited,
FILEGROWTH = 10%
)
LOG ON
(
NAME= vtlab3_log,
FILENAME = "C:\vtlab\vtlab3log.ldf",
SIZE = 8MB,
MAXSIZE = unlimited,
FILEGROWTH = 10%
)
```

## Tabloların oluşturulması ve yabancı anahtarların eklenmesi:


```sql
CREATE TABLE calisanlar
(
	calisan_id INT PRIMARY KEY NOT NULL, 
	ad CHAR(25) NULL,
	soyad CHAR(25) NULL,
	maas int NULL,
	katilmaTarihi DATETIME NULL,
	calisan_birim_id INT NOT NULL,
)

CREATE TABLE birimler
(
	birim_id INT PRIMARY KEY NOT NULL, 
	birim_ad CHAR(25) NOT NULL,
)

CREATE TABLE unvan
(
	unvan_calisan_id INT NOT NULL, 
	unvan_calisan CHAR(25) NULL,
	unvan_tarih DATETIME NULL,
)

CREATE TABLE ikramiye
(
	ikramiye_calisan_id INT NOT NULL, 
	ikramiye_ucret INT NULL,
	ikramiye_tarih DATETIME NULL,
)
```

```sql
ALTER TABLE calisanlar ADD FOREIGN KEY (calisan_birim_id) REFERENCES birimler(birim_id)

ALTER TABLE unvan ADD FOREIGN KEY (unvan_calisan_id) REFERENCES calisanlar(calisan_id)

ALTER TABLE ikramiye ADD FOREIGN KEY (ikramiye_calisan_id) REFERENCES calisanlar(calisan_id)
```

## Verilerin yüklenmesi:

```sql
INSERT INTO birimler(birim_id,birim_ad) VALUES (1,'Yazılım')
INSERT INTO birimler(birim_id,birim_ad) VALUES (2,'Donanım')
INSERT INTO birimler(birim_id,birim_ad) VALUES (3,'Güvenlik')

INSERT INTO calisanlar(calisan_id,ad,soyad,maas,katilmaTarihi,calisan_birim_id) VALUES (1,'İsmail', 'İşeri', 100000, '2014-02-20', 1)
INSERT INTO calisanlar(calisan_id,ad,soyad,maas,katilmaTarihi,calisan_birim_id) VALUES (2,'Hami', 'Satılmış', 80000, '2014-06-11', 1)
INSERT INTO calisanlar(calisan_id,ad,soyad,maas,katilmaTarihi,calisan_birim_id) VALUES (3,'Durmuş', 'Şahin', 300000, '2014-02-20', 2)
INSERT INTO calisanlar(calisan_id,ad,soyad,maas,katilmaTarihi,calisan_birim_id) VALUES (4,'Kağan', 'Yazar', 500000, '2014-02-20', 3)
INSERT INTO calisanlar(calisan_id,ad,soyad,maas,katilmaTarihi,calisan_birim_id) VALUES (5,'Meryem', 'Soysaldı', 500000, '2014-06-11', 3)
INSERT INTO calisanlar(calisan_id,ad,soyad,maas,katilmaTarihi,calisan_birim_id) VALUES (6,'Duygu', 'Akşehir', 200000, '2014-06-11', 2)
INSERT INTO calisanlar(calisan_id,ad,soyad,maas,katilmaTarihi,calisan_birim_id) VALUES (7,'Kübra', 'Seyhan', 75000, '2014-01-20', 1)
INSERT INTO calisanlar(calisan_id,ad,soyad,maas,katilmaTarihi,calisan_birim_id) VALUES (8,'Gülcan', 'Yıldız', 90000, '2014-04-11', 3)

INSERT INTO ikramiye(ikramiye_calisan_id, ikramiye_ucret, ikramiye_tarih) VALUES (1, 5000, '2016-02-20')
INSERT INTO ikramiye(ikramiye_calisan_id, ikramiye_ucret, ikramiye_tarih) VALUES (2, 3000, '2016-06-11')
INSERT INTO ikramiye(ikramiye_calisan_id, ikramiye_ucret, ikramiye_tarih) VALUES (3, 4000, '2016-02-20')
INSERT INTO ikramiye(ikramiye_calisan_id, ikramiye_ucret, ikramiye_tarih) VALUES (1, 4500, '2016-02-20')
INSERT INTO ikramiye(ikramiye_calisan_id, ikramiye_ucret, ikramiye_tarih) VALUES (2, 3500, '2016-06-11')

INSERT INTO unvan(unvan_calisan_id, unvan_calisan, unvan_tarih) VALUES (1, 'Yönetici', '2016-02-20')
INSERT INTO unvan(unvan_calisan_id, unvan_calisan, unvan_tarih) VALUES (2, 'Personel', '2016-06-11')
INSERT INTO unvan(unvan_calisan_id, unvan_calisan, unvan_tarih) VALUES (8, 'Personel', '2016-06-11')
INSERT INTO unvan(unvan_calisan_id, unvan_calisan, unvan_tarih) VALUES (5, 'Müdür', '2016-06-11')
INSERT INTO unvan(unvan_calisan_id, unvan_calisan, unvan_tarih) VALUES (4, 'Yönetici Yardımcısı', '2016-06-11')
INSERT INTO unvan(unvan_calisan_id, unvan_calisan, unvan_tarih) VALUES (7, 'Personel', '2016-06-11')
INSERT INTO unvan(unvan_calisan_id, unvan_calisan, unvan_tarih) VALUES (6, 'Takım Lideri', '2016-06-11')
INSERT INTO unvan(unvan_calisan_id, unvan_calisan, unvan_tarih) VALUES (3, 'Takım Lideri', '2016-06-11')
```

## 3 ve Sonraki Sorularda Geçen Sorgular

```sql
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
```
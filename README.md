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
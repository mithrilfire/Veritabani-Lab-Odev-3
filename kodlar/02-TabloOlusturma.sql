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
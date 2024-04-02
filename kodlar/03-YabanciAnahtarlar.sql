ALTER TABLE calisanlar ADD FOREIGN KEY (calisan_birim_id) REFERENCES birimler(birim_id)

ALTER TABLE unvan ADD FOREIGN KEY (unvan_calisan_id) REFERENCES calisanlar(calisan_id)

ALTER TABLE ikramiye ADD FOREIGN KEY (ikramiye_calisan_id) REFERENCES calisanlar(calisan_id)
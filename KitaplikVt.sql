CREATE database KitaplikVt
use KitaplikVt 
CREATE table tblKitap(
id int not null,
Kadi varchar(200) not null,
Kyazari int not null,
ISBN int not null,
Yayinevi varchar(100),
Ktur int not null,
PRIMARY KEY (id) 
)
CREATE table tblYazar(
id int not null,
Yadi varchar(200) not null,
Ysoyadi varchar(200),
PRIMARY KEY (id)
)
CREATE table tblTur(
id int not null,
tur varchar(100),
PRIMARY KEY (id)
)
INSERT INTO tblYazar(id,Yadi,Ysoyadi)
VALUES(101,'Oguz','ATAY'),
(102,'Omer','SEYFETTÝN'),
(103, 'Peyami','SEFA'),
(104,'Sebahattin','ALÝ'),
(105,'Nazim','HÝKMET')

SELECT*FROM tblYazar

INSERT INTO tblTur(id,tur)
VALUES(11,'Roman'),
(12,'Hikaye'),
(13,'Þiir'),
(14,'Deneme'),
(15,'Bilim')
SELECT*FROM tblTur

INSERT INTO tblKitap(id,Kadi,Kyazari,ISBN,Yayinevi,Ktur)
VALUES(1,'Tutunamayanlar',101,465864,'Papatya',11),
(2,'Ali Cengizin Maceralari',102,465864,'Cicek Yayinevi',12),
(3,'Ali Cengizin Kurnazliklari',103,465864,'Cicek Yayinevi',13),
(4,'Ali Cengizin Üniversiteli Oldu',104,465864,'Papatya Yayinevi',14),
(5,'Ali Cengizin Asker Oldu',105,465864,'Papatya',15)
SELECT*FROM tblKitap

SELECT*
FROM tblKitap
WHERE Ktur=103 or Ktur=105

SELECT*
FROM tblTur
WHERE id=12 

SELECT Kadi, Kyazari, ISBN
FROM tblKitap
WHERE Ktur=103

SELECT Yayinevi,Ktur,Kadi, Kyazari
FROM tblKitap


SELECT*
FROM tblKitap, tblYazar
WHERE tblKitap.Kyazari= tblYazar.id

SELECT*
FROM tblKitap, tblYazar, tblTur
WHERE tblKitap.Kyazari= tblYazar.id and tblKitap.Ktur=tblTur.id

SELECT tblKitap.Kadi, tblYazar.Yadi, tblYazar.Ysoyadi, tblTur.tur, tblKitap.ISBN, tblKitap.Yayinevi
FROM tblKitap, tblYazar, tblTur
WHERE tblKitap.Kyazari= tblYazar.id and tblKitap.Ktur=tblTur.id
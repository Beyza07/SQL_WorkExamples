CREATE database kütüphane
USE kütüphane

CREATE table islem(
islemno int,
ogrno int FOREIGN KEY REFERENCES ogrenci(ogrno),
kitapno int FOREIGN KEY REFERENCES kitap(kitapno),
atarih date,
vtarih date,
PRIMARY KEY (islemno)
)

CREATE table ogrenci(
ogrno int,
ograd varchar(50),
ogrsoyad varchar(50),
cinsiyet varchar(50),
dtarih date,
sinif int,
PRIMARY KEY(ogrno)
)

CREATE table kitap(
kitapno int,
isbnno int,
kitapadi varchar(50),
yazarno int FOREIGN KEY REFERENCES yazar(yazarno),
turno int FOREIGN KEY REFERENCES tur (turno),
sayfasayisi int,
puan int,
PRIMARY KEY(kitapno)
)

CREATE table yazar(
yazarno int,
yazarad varchar(50),
yazarsoyad varchar(50),
PRIMARY KEY (yazarno)
)

CREATE table tur(
turno int,
turadi varchar(50),
PRIMARY KEY (turno))

INSERT INTO tur(turno,turadi)
VALUES(1,'hikaye'),
(2,'masal'),
(3,'öykü'),
(4,'roman'),
(5,'tarih')

SELECT*FROM tur

INSERT INTO yazar(yazarno,yazarad,yazarsoyad)
VALUES(11,'Oguz','ATAY'),
(12,'Omer','SEYFETTÝN'),
(13,'Peyami','SEFA'),
(14,'Nazim','HÝKMET'),
(15,'Sebahattin','Ali')

SELECT*FROM yazar

INSERT INTO kitap(kitapno,isbnno,kitapadi,yazarno,turno,sayfasayisi,puan)
VALUES(101,21,'Tutunamayanlar',11,4,300,400),
(102,22,'Papatya',13,3,250,300),
(103,23,'Kel Oðlan',15,2,150,68),
(104,24,'Osmanlý',14,5,350,450),
(105,25,'Alicengiz',12,1,250,300)

SELECT*FROM kitap

INSERT INTO ogrenci(ogrno,ograd,ogrsoyad,cinsiyet,dtarih,sinif)
VALUES(225,'Ali','Cengiz','Erkek','2003/05/20',2),
(226,'Simgenur','KARAYEL','Kadýn','2003/01/27',2),
(227,'Beyza','Ceylan','Kadýn','2003/04/07',1),
(228,'Kiraznur','Ýnce','Kadýn','2003/08/08',1),
(229,'Eren','Karakütük','Erkek','2003/06/28',1)

SELECT*FROM ogrenci

INSERT INTO islem(islemno,ogrno,kitapno,atarih,vtarih)
VALUES(201,225,101,'2023-01-02','2023-04-02'),
(202,226,102,'2023-02-02','2023-03-02'),
(203,227,103,'2001-01-02','2002-05-07'),
(204,228,104,'2001-04-20','2005-01-08'),
(205,229,105,'2001-01-02','2023-08-23')

SELECT*FROM islem

SELECT*
FROM islem,ogrenci,kitap,tur,yazar
WHERE ogrenci.ogrno=islem.ogrno and kitap.kitapno=islem.kitapno and yazar.yazarno=kitap.yazarno and tur.turno=kitap.turno

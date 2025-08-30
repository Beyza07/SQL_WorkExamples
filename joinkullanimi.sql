create database joinkullanimi
USE joinkullanimi

create table ogrenci(
ogrenciId int,
AdSoyad varchar(100)
)

create table Danisman(
DanismanId int,
AdSoyad varchar(100)
)

create table OgrenciDanisman(
OgrenciDanismanId int,
OgrenciId int,
DanismanID int
)

INSERT Ogrenci 
VALUES(1,'Öðrenci_1'),
(2,'Öðrenci_2'),
(3,'Öðrenci_3'),
(4,'Öðrenci_4')


INSERT Danisman 
VALUES(1,'Danýþman_1'),
(2,'Danýþman_2'),
(3,'Danýþman_3'),
(4,'Danýþman_4')

INSERT OgrenciDanisman 
VALUES(1,1,2),
(2,3,2),
(3,4,1)

Select* from ogrenci
select*from Danisman
select*from OgrenciDanisman

---Join kullanýmý  ýnner joýn iç birleþtirici
---Tablolara takma isimle nasýl bir alançaðýrdýðýmýzý görüyoruz.
---Where yazýlýma yeni baþlayan kiþiler kullanýr.Inner Join daha çok kullanýmýdýr.
Select O.*From ogrenci O
	INNER JOIN OgrenciDanisman OD
		ON O.ogrenciId=OD.OgrenciId

Select O.OgrenciId,O.AdSoyad,D.DanismanId,D.AdSoyad 
From ogrenci O
join OgrenciDanisman OD
	ON O.ogrenciId=OD.OgrenciId
join Danisman D
	ON OD.DanismanID=D.DanismanId
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
VALUES(1,'��renci_1'),
(2,'��renci_2'),
(3,'��renci_3'),
(4,'��renci_4')


INSERT Danisman 
VALUES(1,'Dan��man_1'),
(2,'Dan��man_2'),
(3,'Dan��man_3'),
(4,'Dan��man_4')

INSERT OgrenciDanisman 
VALUES(1,1,2),
(2,3,2),
(3,4,1)

Select* from ogrenci
select*from Danisman
select*from OgrenciDanisman

---Join kullan�m�  �nner jo�n i� birle�tirici
---Tablolara takma isimle nas�l bir alan�a��rd���m�z� g�r�yoruz.
---Where yaz�l�ma yeni ba�layan ki�iler kullan�r.Inner Join daha �ok kullan�m�d�r.
Select O.*From ogrenci O
	INNER JOIN OgrenciDanisman OD
		ON O.ogrenciId=OD.OgrenciId

Select O.OgrenciId,O.AdSoyad,D.DanismanId,D.AdSoyad 
From ogrenci O
join OgrenciDanisman OD
	ON O.ogrenciId=OD.OgrenciId
join Danisman D
	ON OD.DanismanID=D.DanismanId
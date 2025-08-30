Create database Personelvt
USE Personelvt

Create table personell(
personelid int,
perad varchar(50),
persoyad varchar(50),
persehir varchar(50),
permaas int,
perdurum varchar(50),
permeslek varchar(50),
PRIMARY KEY (personelid)
)

INSERT INTO personell(personelid,perad,persoyad,persehir,permaas,perdurum,permeslek)
VALUES(12,'Yasin','Yel','Ýzmir',3500,'True','Bankacý'),
(13,'Ali','Yel','Ýzmir',2500,'False','Biliþim'),
(14,'Yasin','Yel','Ýzmir',3500,'True','Mühendis'),
(15,'Ahmet','Kaya','Ýstanbul',3000,'False','Ýþçi'),
(16,'Sinan','Kel','Kastamonu',1500,'True','Ýþsiz'),
(17,'Ayþe','Ella','Ankara',3400,'False','Mühendis'),
(18,'Elif','Þahin','Bursa',3200,'True','Kimyager'),
(19,'Eda','Yürür','Ýstanbul',3500,'True','Öðretmen'),
(20,'Duru','Çakýr','Ankra',3500,'False','Biliþim')

Select*from personell





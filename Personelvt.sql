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
VALUES(12,'Yasin','Yel','�zmir',3500,'True','Bankac�'),
(13,'Ali','Yel','�zmir',2500,'False','Bili�im'),
(14,'Yasin','Yel','�zmir',3500,'True','M�hendis'),
(15,'Ahmet','Kaya','�stanbul',3000,'False','���i'),
(16,'Sinan','Kel','Kastamonu',1500,'True','��siz'),
(17,'Ay�e','Ella','Ankara',3400,'False','M�hendis'),
(18,'Elif','�ahin','Bursa',3200,'True','Kimyager'),
(19,'Eda','Y�r�r','�stanbul',3500,'True','��retmen'),
(20,'Duru','�ak�r','Ankra',3500,'False','Bili�im')

Select*from personell





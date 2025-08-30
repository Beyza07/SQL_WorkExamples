create database personel
Use personel

create table calisan(
id int not null,
ad varchar(50),
soyad varchar(50),
yas int,
cinsiyet varchar(10),
sehir varchar(10),
ulke varchar(10),
maas money null,
Primary key (id) 
)

--1.soru

insert into calisan(id,ad,soyad,yas,cinsiyet,sehir,ulke,maas)
values(2,'Ahmet','Yilmaz',20,'E','Ankara','Turkiye',2000.00),
(3,'Mehmet','Efe',22,'E','Bolu','Turkiye',2000.00),
(4,'Ayse','Can',23,'B','Istanbul','Turkiye', NULL),
(5,'Fatma','Ak',35,'B','Ankara','Turkiye',3200.00),
(6,'John','Smith',45,'E','New York','USA',3000.00),
(7,'Ellen','Smith',40,'B','New York','USA',3500.00),
(8,'Hans','Muller',30,'E','Berlin','Almanya',4000.00),
(9,'Frank','Cesanne',35,'E','Paris','Fransa',NULL),
(10,'Abbas','Demir',26,'E','Adana','Turkiye',2000.00),
(11,'Hatice','Topcu',26,'B','Hatay','Turkiye',2200.00),
(12,'Gulsum','Demir',35,'B','Adana','Turkiye',2000.00)

select*from calisan

--2.Soru
update calisan set maas =maas*1.1 where ulke='Turkiye';
--update calisan set maas =maas + maas * 10/100  where ulke='Turkiye';

select*from calisan

--3.Soru
select*from calisan where cinsiyet='E';

--4.Soru
select ad,soyad from calisan;
--select ad,soyad,ad+soyad+'@hotmail.com' as mail from calisan

--5.Soru
select* from calisan
where maas between 2000 and 3500;

--6.soru
select*from calisan
where maas in (2000,3000,4000);
--arama yaparken in kullanýyoruz

--7.soru
select*from calisan where maas is null;
--select ad,soyad,ulke from calisan where maas is null

 --8.Soru
 select*from calisan where ad like 'A%';
 --like istediðim karakter listeleme

--9.Soru
select ad,soyad,ulke,maas from calisan order by yas;
--- select ad, soyad, ulke,maas from personel orday by yas asc

--10.soru
select* 
from calisan
where lower(ad)=ad and upper(soyad)= soyad;
--select upper(ad) as isim, lower(soyad) as soyisim, maas from calisan

--11 
select count(*) as sayi, avg(yas) as "yaþ ortalamasý" from calisan;
--select count(ad) as sayy, avg(yas) as yas_ortalamasi from calisan

--12
update calisan set maas=2500 where maas is null;

select*from calisan

--13
select max(maas) as "en yüksek maaþ" , min(maas) as "en düþük maaþ" from calisan;
select*from calisan 

--14
select count(*) as "toplam kayýt" from calisan;


--15
select sum(maas) as "toplam maas"  from calisan;
 
--16
select ulke, count(*) as "kiþi sayýsý" from calisan group by ulke;
--count gruplandýran ifadelere yöneliyor.

--17
 select ulke, count(*) as "30 yaþ üstü personel" from calisan where yas>30 group by ulke;
 --select ulke, count(*) as sayy from calisan where yas>30 grop by ulke

--18
 select cinsiyet, avg(yas) as "yas ortalamasý", count (*) as "kiþi sayýsý" from calisan group by cinsiyet;
 --cinsiyete göre group by 

--19
select ulke, avg(maas) as"maaþ ortalamasý", count(*) "kiþi sayýsý" 
from calisan group by ulke,cinsiyet;


--20
select ulke, avg(maas) as"maaþ ortalamasý", count(*) "kiþi sayýsý" 
from calisan 
group by ulke,cinsiyet 
having count(*) <2 and cinsiyet='E';








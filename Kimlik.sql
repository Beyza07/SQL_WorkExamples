create database PersonelVeriTabani
Use PersonelVeriTabani
create table Tbl_Personel(
PerAd varchar(10),
PerSoyad varchar(50),
PerSehir varchar (50),
PerMaas money,
PerDurum varchar(50),
PerMeslek varchar(50))

select*from Tbl_Personel

create table Tbl_Yonetici(
KullaniciAd varchar(50),
Sifre int null)

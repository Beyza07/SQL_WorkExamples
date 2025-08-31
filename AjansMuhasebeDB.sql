----AjansMuhasebeProgram� 
---9 Adet Tablo olu�turulacak
---(M��teriler,Tedarikciler,Kullan�c�Hesaplar�,Projeler,Faturalar,Hizmetler,FaturaDetaylar�,�deme��lemleri,BankaHesaplar�)
---Her tabloya 20 veri giri�i yap�lacak
---Her tablo i�in 10 adet veri g�ncellemessi yap�lacak
---Her tablo i�in 10 adet veri silme i�lemi yap�lacak
---Her tablo i�in 5 adet farkl� SQL fonksiyonlar� kullan�larak Select sorgular� yap�lacak.
---Tablolar aras� �li�kilerde JO�N i�lemleri i�in �rnek olu�turulacak.

Create database AjansMuhasebeDB

Use AjansMuhasebeDB

---Veritaban� olu�turuldu.
---Tablo eklemeye ba�laya biliriz.

Create Table Musteriler(
	MusteriID INT PRIMARY KEY,
	Ad VARCHAR(50),
	Soyad VARCHAR(50),
	Telefon VARCHAR(15),
	Email VARCHAR(50),
	Adres VARCHAR(100)
	)
	
Create Table Tedarikciler(
	TedarikciID INT PRIMARY KEY,
	Ad VARCHAR(50),
	Soyad VARCHAR(50),
	Telefon VARCHAR(15),
	Email VARCHAR(50),
	Adres VARCHAR(100)
	)

Create Table Kullanicilar(
	KullaniciID INT PRIMARY KEY,
	KullaniciAdi VARCHAR(50),
	KullaniciSoyadi VARCHAR(50),
	KullaniciSifresi VARCHAR(25) NOT NULL
	)
	
Create Table Projeler(
	ProjeID Int PRIMARY KEY,
	MusteriID INT NOT NULL,
	ProjeAdi VARCHAR(50),
	BaslangicTarihi DATE ,
	BitisTarihi DATE,
	Butce DECIMAL(10,2),
	FOREIGN KEY (MusteriID) REFERENCES Musteriler(MusteriID)
	)
	
Create Table Faturalar(
	FaturaID INT PRIMARY KEY,
	ProjeID INT NOT NULL,
	Tarih Date,
	Tip VARCHAR(10) NOT NULL CHECK(Tip IN('Gelir','Gider')),
	ToplamTutar DECIMAL(10,2),
	FOREIGN KEY (ProjeID) REFERENCES Projeler(ProjeID)
	)
	
Create Table Hizmetler(
	HizmetID INT PRIMARY KEY,
	HizmetAdi VARCHAR(50),
	Fiyat DECIMAL(10,2)
	)
	
Create Table FaturaDetaylari(
	DetayID INT PRIMARY KEY,
	FaturaID INT,
	HizmetID INT,
	Adet INT,
	BirimFiyat DECIMAL(10,2),
	Toplam AS (Adet * BirimFiyat) PERSISTED,
	FOREIGN KEY (FaturaID) REFERENCES Faturalar(FaturaID),
	FOREIGN KEY (HizmetID) REFERENCES Hizmetler(HizmetID)
	)
	
Create Table OdemeIslemleri(
	OdemeID INT PRIMARY KEY,
	FaturaID INT,
	Tarih DATE,
	Tutar DECIMAL(10,2),
	OdemeYontemi VARCHAR(50),
	FOREIGN KEY (FaturaID) REFERENCES Faturalar(FaturaID)
	)
	
Create Table BankaHesaplari(
	HesapID INT PRIMARY KEY,
	BankaAdi VARCHAR(50),
	HesapNo VARCHAR(50),
	IBAN VARCHAR(50)
	)

---Tablolar olu�turuldu.
---Her tablo i�in 20 veri giri�i yapal�m.
---Musteriler i�in (MusteriID,Ad,Soyad,Telefon,Email,Adres)

INSERT INTO Musteriler(MusteriID,Ad,Soyad,Telefon,Email,Adres)
VALUES
	(1,'Beyza','Ceylan',11111111111,'bycyln7@email.com','Kastamonu'),
	(2,'Ay','Peri',11111111112,'Ayperi@email.com','�stanbul'),
	(3,'Ege','Kaya',11111111113,'Ege@email.com','�zmir'),
	(4,'Emine','Akp�nar',11111111114,'Akp�nar@email.com','Ardahan'),
	(5,'Ahmet','Kurt',11111111115,'Kurt@email.com','Ta�k�pr�'),
	(6,'Ali','�zkan',11111111116,'Ali@email.com','Ta�k�pr�'),
	(7,'Cemile','�zkan',11111111117,'CC@email.com','Ta�k�pr�'),
	(8,'Duru','Su',11111111118,'Durusu@email.com','Ankara'),
	(9,'Kenan','Kartal',11111111119,'Kenan@email.com','Van'),
	(10,'Kerem','Ahraz',11111111110,'Kerem@email.com','Giresun'),
	(11,'Ceyda','Y�lmaz',11111111101,'Ceyda@email.com','Konya'),
	(12,'Kadir','B�lb�l',11111111001,'b�lb�l@email.com','Kayseri'),
	(13,'Yaren','�ent�rk',11111110001,'�ent�rk@email.com','Sinop'),
	(14,'Emre','Toprak',11111100001,'Emre@email.com','Antep'),
	(15,'Tu�rul','B�cek',11111000001,'Tu�rul@email.com','Urfa'),
	(16,'�emsettin','Sade',11110000001,'�emsettin@email.com','Bart�n'),
	(17,'�rem','��lg�n',11100000001,'�rem@email.com','Sivas'),
	(18,'Metehan','G��l�',11000000001,'Metehan@email.com','Siirt'),
	(19,'S�la','S�sl�',10000000001,'s�la@email.com','Zonguldak'),
	(20,'Alp','Eren',10000000002,'AlpEren@email.com','Mersin')

---Tedarikciler i�in (TedarikciID,Ad,Soyad,Telefon,Email,Adres)

INSERT INTO Tedarikciler (TedarikciID, Ad, Soyad, Telefon, Email, Adres)
VALUES
	(1, 'Mehmet', 'Demir', 05001111111, 'demir@email.com', '�stanbul'),
	(2, 'Ay�e', 'Y�ld�z', 05002222222, 'yildiz@email.com', 'Ankara'),
	(3, 'Can', 'Kara', 05003333333, 'kara@email.com', '�zmir'),
	(4, 'Elif', 'Ayd�n', 05004444444, 'aydin@email.com', 'Bursa'),
	(5, 'Murat', 'Ko�', 05005555555, 'koc@email.com', 'Antalya'),
	(6, 'Zeynep', '�elik', 05006666666, 'celik@email.com', 'Adana'),
	(7, 'Ahmet', '�ahin', 05007777777, 'sahin@email.com', 'Trabzon'),
	(8, 'Fatma', 'Arslan', 05008888888, 'arslan@email.com', 'Konya'),
	(9, 'Emre', 'Polat', 05009999999, 'polat@email.com', 'Eski�ehir'),
	(10, 'H�lya', 'Do�an', 05001010101, 'dogan@email.com', 'Gaziantep'),
	(11, 'Kerem', 'Bulut', 05001112121, 'bulut@email.com', 'Kayseri'),
	(12, 'Selin', '�zt�rk', 05001213131, 'ozturk@email.com', 'Mersin'),
	(13, 'Berk', 'Aksoy', 05001314141, 'aksoy@email.com', 'Samsun'),
	(14, 'G�l', 'Ta�', 05001415151, 'tas@email.com', '�anakkale'),
	(15, 'Okan', 'Ergin', 05001516161, 'ergin@email.com', 'Edirne'),
	(16, 'Merve', 'Korkmaz', 05001617171, 'merve.korkmaz@email.com', 'Malatya'),
	(17, 'Hakan', 'G�ne�', 05001718181, 'gunes@email.com', 'Van'),
	(18, 'Sevgi', 'Yal��n', 05001819191, 'yalcin@email.com', 'Sivas'),
	(19, 'Burak', '�zdemir', 05001920202, 'ozdemir@email.com', 'Kocaeli'),
	(20, 'Deniz', 'Kaplan', 05002021212, 'kaplan@email.com', 'Hatay');

---Kullanicilar i�in (KullaniciID,KullaniciAdi,KullaniciSoyadi,KullaniciSifresi)

INSERT INTO Kullanicilar (KullaniciID, KullaniciAdi, KullaniciSoyadi, KullaniciSifresi)
VALUES
	(1, 'Beyza', 'Ceylan', 'Byz12345'),
	(2, 'Ahmet', 'Kara', 'Ahm67890'),
	(3, 'Ay�e', 'Demir', 'Ays45678'),
	(4, 'Mehmet', 'Polat', 'Meh13579'),
	(5, 'Zeynep', 'Y�ld�z', 'Zyn24680'),
	(6, 'Emre', 'Ko�', 'Emr98765'),
	(7, 'Elif', 'Arslan', 'Elf54321'),
	(8, 'Murat', '�elik', 'Mrt11223'),
	(9, 'Selin', '�ahin', 'Sln33445'),
	(10, 'Kerem', 'Ayd�n', 'Krm55667'),
	(11, 'Fatma', 'Ta�', 'Ftm77889'),
	(12, 'Burak', 'G�ne�', 'Brk99000'),
	(13, 'Cem', '�zt�rk', 'Cem11122'),
	(14, 'Gamze', 'Bulut', 'Gmz22334'),
	(15, 'Hakan', 'Ergin', 'Hkn44556'),
	(16, 'Deniz', 'Kaplan', 'Dnz66778'),
	(17, '�rem', 'Do�an', 'Irm88990'),
	(18, 'Kadir', 'Yal��n', 'Kdr10101'),
	(19, 'Ceyda', 'Aksoy', 'Cyd20202'),
	(20, 'Okan', 'Toprak', 'Okn30303');

---Projeler i�in (ProjeID,MusteriID,ProjeAdi,BaslangicTarihi,BitisTarihi,But�e)

INSERT INTO Projeler (ProjeID, MusteriID, ProjeAdi, BaslangicTarihi, BitisTarihi, Butce)
VALUES
	(1, 1, 'Web Sitesi Tasar�m�', '2023-01-10', '2023-03-15', 15000.00),
	(2, 2, 'Mobil Uygulama Geli�tirme', '2023-02-01', '2023-05-30', 45000.00),
	(3, 3, 'SEO Optimizasyonu', '2023-03-05', '2023-04-20', 8000.00),
	(4, 4, 'Kurumsal Kimlik Tasar�m�', '2023-01-20', '2023-02-28', 12000.00),
	(5, 5, 'E-Ticaret Sitesi', '2023-04-01', '2023-07-15', 60000.00),
	(6, 6, 'CRM Yaz�l�m�', '2023-05-10', '2023-08-25', 75000.00),
	(7, 7, 'Sosyal Medya Y�netimi', '2023-06-01', '2023-12-01', 20000.00),
	(8, 8, 'Reklam Kampanyas�', '2023-03-15', '2023-06-30', 18000.00),
	(9, 9, 'Veritaban� Optimizasyonu', '2023-07-01', '2023-09-15', 22000.00),
	(10, 10, 'ERP Entegrasyonu', '2023-08-10', '2023-12-20', 95000.00),
	(11, 11, 'UI/UX Tasar�m�', '2023-09-01', '2023-10-30', 10000.00),
	(12, 12, 'Veri Analizi Projesi', '2023-10-05', '2023-12-31', 30000.00),
	(13, 13, 'Siber G�venlik �al��mas�', '2023-11-01', '2024-01-15', 40000.00),
	(14, 14, 'Dijital Pazarlama', '2023-02-15', '2023-04-30', 25000.00),
	(15, 15, 'Bulut Ge�i� Projesi', '2023-05-01', '2023-09-01', 70000.00),
	(16, 16, 'Makine ��renmesi Modeli', '2023-06-10', '2023-09-20', 85000.00),
	(17, 17, 'E�itim Platformu', '2023-07-05', '2023-11-30', 50000.00),
	(18, 18, 'Sanal Ma�aza', '2023-08-01', '2023-11-01', 30000.00),
	(19, 19, 'Video Prod�ksiyon', '2023-09-10', '2023-10-25', 12000.00),
	(20, 20, 'Mobil Oyun', '2023-10-15', '2024-03-15', 100000.00);

---Faturalar i�in(FaturaID,ProjeID,Tarih,Tip,ToplamTutar)

INSERT INTO Faturalar (FaturaID, ProjeID, Tarih, Tip, ToplamTutar)
VALUES
	(1, 1, '2023-01-15', 'Gelir', 15000.00),
	(2, 2, '2023-02-10', 'Gelir', 45000.00),
	(3, 3, '2023-03-15', 'Gelir', 8000.00),
	(4, 4, '2023-02-25', 'Gelir', 12000.00),
	(5, 5, '2023-04-10', 'Gelir', 60000.00),
	(6, 6, '2023-05-20', 'Gelir', 75000.00),
	(7, 7, '2023-06-15', 'Gelir', 20000.00),
	(8, 8, '2023-07-01', 'Gelir', 18000.00),
	(9, 9, '2023-07-20', 'Gelir', 22000.00),
	(10, 10, '2023-08-15', 'Gelir', 95000.00),
	(11, 11, '2023-09-10', 'Gelir', 10000.00),
	(12, 12, '2023-10-01', 'Gelir', 30000.00),
	(13, 13, '2023-11-05', 'Gelir', 40000.00),
	(14, 14, '2023-02-20', 'Gider', 5000.00),
	(15, 15, '2023-05-15', 'Gider', 12000.00),
	(16, 16, '2023-06-20', 'Gider', 15000.00),
	(17, 17, '2023-08-10', 'Gider', 18000.00),
	(18, 18, '2023-09-15', 'Gider', 22000.00),
	(19, 19, '2023-10-05', 'Gider', 8000.00),
	(20, 20, '2023-11-20', 'Gider', 25000.00);

---Hizmetler i�in (HizmetID,HizmetAdi,Fiyat)

INSERT INTO Hizmetler (HizmetID, HizmetAdi, Fiyat)
VALUES
	(1, 'Web Sitesi Tasar�m�', 7500.00),
	(2, 'Mobil Uygulama Geli�tirme', 15000.00),
	(3, 'SEO Optimizasyonu', 5000.00),
	(4, 'Dijital Pazarlama Kampanyas�', 12000.00),
	(5, 'Grafik Tasar�m', 3000.00),
	(6, 'Logo Tasar�m�', 2000.00),
	(7, 'Kurumsal Kimlik Tasar�m�', 5500.00),
	(8, 'E-Ticaret Sitesi Kurulumu', 10000.00),
	(9, 'Bak�m ve Destek Hizmeti', 2500.00),
	(10, 'Sosyal Medya Y�netimi', 6000.00),
	(11, 'Reklam Y�netimi (Google Ads)', 8000.00),
	(12, 'Reklam Y�netimi (Meta Ads)', 7000.00),
	(13, 'Video Prod�ksiyon', 9000.00),
	(14, 'Foto�raf �ekimi', 4000.00),
	(15, '��erik Yazarl���', 1500.00),
	(16, 'Veritaban� Y�netimi', 8500.00),
	(17, 'Siber G�venlik Hizmeti', 12000.00),
	(18, 'Bulut Sistem Kurulumu', 14000.00),
	(19, 'Dan��manl�k Hizmeti', 4500.00),
	(20, 'Proje Y�netimi', 11000.00);

---FaturaDetaylari i�in (DetayID, FatuarID,HizmetID,Adet,BirimFiyat,Toplam)

INSERT INTO FaturaDetaylari (DetayID, FaturaID, HizmetID, Adet, BirimFiyat)
VALUES
	(1, 1, 1, 2, 7500.00),
	(2, 2, 3, 1, 5000.00),
	(3, 3, 5, 3, 3000.00),
	(4, 4, 2, 1, 15000.00),
	(5, 5, 7, 2, 5500.00),
	(6, 6, 10, 1, 6000.00),
	(7, 7, 8, 1, 10000.00),
	(8, 8, 6, 2, 2000.00),
	(9, 9, 4, 1, 12000.00),
	(10, 10, 11, 2, 8000.00),
	(11, 11, 12, 1, 7000.00),
	(12, 12, 14, 2, 4000.00),
	(13, 13, 15, 5, 1500.00),
	(14, 14, 9, 2, 2500.00),
	(15, 15, 13, 1, 9000.00),
	(16, 16, 16, 1, 8500.00),
	(17, 17, 17, 1, 12000.00),
	(18, 18, 18, 1, 14000.00),
	(19, 19, 19, 3, 4500.00),
	(20, 20, 20, 1, 11000.00);

---OdemeIslemleri i�in (OdemeID,FaturaID,Tarih,Tutar,OdemeYontemi)

INSERT INTO OdemeIslemleri (OdemeID, FaturaID, Tarih, Tutar, OdemeYontemi)
VALUES
	(1, 1, '2024-01-15', 15000.00, 'Kredi Kart�'),
	(2, 2, '2024-01-20', 5000.00, 'Havale/EFT'),
	(3, 3, '2024-02-01', 9000.00, 'Nakit'),
	(4, 4, '2024-02-05', 12000.00, 'Kredi Kart�'),
	(5, 5, '2024-02-12', 11000.00, 'Havale/EFT'),
	(6, 6, '2024-03-01', 6000.00, '�ek'),
	(7, 7, '2024-03-10', 10000.00, 'Kredi Kart�'),
	(8, 8, '2024-03-15', 4000.00, 'Nakit'),
	(9, 9, '2024-03-20', 12000.00, 'Havale/EFT'),
	(10, 10, '2024-04-01', 16000.00, 'Kredi Kart�'),
	(11, 11, '2024-04-07', 7000.00, 'Nakit'),
	(12, 12, '2024-04-15', 8000.00, 'Havale/EFT'),
	(13, 13, '2024-05-01', 7500.00, 'Kredi Kart�'),
	(14, 14, '2024-05-05', 5000.00, 'Nakit'),
	(15, 15, '2024-05-10', 9000.00, '�ek'),
	(16, 16, '2024-06-01', 8500.00, 'Havale/EFT'),
	(17, 17, '2024-06-10', 12000.00, 'Kredi Kart�'),
	(18, 18, '2024-06-15', 14000.00, 'Nakit'),
	(19, 19, '2024-07-01', 13500.00, 'Havale/EFT'),
	(20, 20, '2024-07-10', 11000.00, 'Kredi Kart�');

---BankaHesaplari i�in (HesapID,BankaAdi,HesapNo,IBAN)

INSERT INTO BankaHesaplari (HesapID, BankaAdi, HesapNo, IBAN)
VALUES
	(1, 'Ziraat Bankas�', '12345678', 'TR00 0001 0000 1234 5678 0000 01'),
	(2, 'Akbank', '87654321', 'TR00 0002 0000 8765 4321 0000 02'),
	(3, 'Vak�fBank', '11223344', 'TR00 0003 0000 1122 3344 0000 03'),
	(4, 'Ziraat Bankas�', '44332211', 'TR00 0004 0000 4433 2211 0000 04'),
	(5, 'Akbank', '55667788', 'TR00 0005 0000 5566 7788 0000 05'),
	(6, 'Vak�fBank', '99887766', 'TR00 0006 0000 9988 7766 0000 06'),
	(7, 'Ziraat Bankas�', '66778899', 'TR00 0007 0000 6677 8899 0000 07'),
	(8, 'Akbank', '22334455', 'TR00 0008 0000 2233 4455 0000 08'),
	(9, 'Vak�fBank', '33445566', 'TR00 0009 0000 3344 5566 0000 09'),
	(10, 'Ziraat Bankas�', '44556677', 'TR00 0010 0000 4455 6677 0000 10'),
	(11, 'Akbank', '55664488', 'TR00 0011 0000 5566 4488 0000 11'),
	(12, 'Vak�fBank', '77889900', 'TR00 0012 0000 7788 9900 0000 12'),
	(13, 'Ziraat Bankas�', '99001122', 'TR00 0013 0000 9900 1122 0000 13'),
	(14, 'Akbank', '11220099', 'TR00 0014 0000 1122 0099 0000 14'),
	(15, 'Vak�fBank', '22119988', 'TR00 0015 0000 2211 9988 0000 15'),
	(16, 'Ziraat Bankas�', '88997766', 'TR00 0016 0000 8899 7766 0000 16'),
	(17, 'Akbank', '33442211', 'TR00 0017 0000 3344 2211 0000 17'),
	(18, 'Vak�fBank', '44331122', 'TR00 0018 0000 4433 1122 0000 18'),
	(19, 'Ziraat Bankas�', '66554433', 'TR00 0019 0000 6655 4433 0000 19'),
	(20, 'Akbank', '77886655', 'TR00 0020 0000 7788 6655 0000 20');


---Her tablo i�in 10 adet veri g�ncellemessi yapal�m.
---Musteriler 

	UPDATE Musteriler SET Ad='Beyza Nur' WHERE MusteriID=1;
	UPDATE Musteriler SET Soyad='Peri�' WHERE MusteriID=2;
	UPDATE Musteriler SET Telefon='11111119999' WHERE MusteriID=3;
	UPDATE Musteriler SET Email='emine.akpinar@email.com' WHERE MusteriID=4;
	UPDATE Musteriler SET Adres='Ta�k�pr� Merkez' WHERE MusteriID=5;
	UPDATE Musteriler SET Ad='Ali Can' WHERE MusteriID=6;
	UPDATE Musteriler SET Soyad='�zcan' WHERE MusteriID=7;
	UPDATE Musteriler SET Telefon='11111118888' WHERE MusteriID=8;
	UPDATE Musteriler SET Email='kenan.kartal@email.com' WHERE MusteriID=9;
	UPDATE Musteriler SET Adres='Giresun Merkez' WHERE MusteriID=10;

---Tedarikciler

	UPDATE Tedarikciler SET Ad='Mehmet Ali' WHERE TedarikciID=1;
	UPDATE Tedarikciler SET Soyad='Y�ld�r�m' WHERE TedarikciID=2;
	UPDATE Tedarikciler SET Telefon='05005555556' WHERE TedarikciID=3;
	UPDATE Tedarikciler SET Email='elif.aydin@email.com' WHERE TedarikciID=4;
	UPDATE Tedarikciler SET Adres='Antalya Merkez' WHERE TedarikciID=5;
	UPDATE Tedarikciler SET Ad='Zeynep Nur' WHERE TedarikciID=6;
	UPDATE Tedarikciler SET Soyad='�ahin' WHERE TedarikciID=7;
	UPDATE Tedarikciler SET Telefon='05008888889' WHERE TedarikciID=8;
	UPDATE Tedarikciler SET Email='emre.polat@email.com' WHERE TedarikciID=9;
	UPDATE Tedarikciler SET Adres='Gaziantep Merkez' WHERE TedarikciID=10;

---Kullanicilar

	UPDATE Kullanicilar SET KullaniciAdi='Beyza C.' WHERE KullaniciID=1;
	UPDATE Kullanicilar SET KullaniciSoyadi='Kara' WHERE KullaniciID=2;
	UPDATE Kullanicilar SET KullaniciSifresi='Ays12345' WHERE KullaniciID=3;
	UPDATE Kullanicilar SET KullaniciAdi='Mehmet P.' WHERE KullaniciID=4;
	UPDATE Kullanicilar SET KullaniciSoyadi='Y�ld�z' WHERE KullaniciID=5;
	UPDATE Kullanicilar SET KullaniciSifresi='Emr54321' WHERE KullaniciID=6;
	UPDATE Kullanicilar SET KullaniciAdi='Elif A.' WHERE KullaniciID=7;
	UPDATE Kullanicilar SET KullaniciSoyadi='�elik' WHERE KullaniciID=8;
	UPDATE Kullanicilar SET KullaniciSifresi='Sln99999' WHERE KullaniciID=9;
	UPDATE Kullanicilar SET KullaniciAdi='Kerem A.' WHERE KullaniciID=10;

---Projeler

	UPDATE Projeler SET ProjeAdi='Web Site Tasar�m� Pro' WHERE ProjeID=1;
	UPDATE Projeler SET Butce=46000.00 WHERE ProjeID=2;
	UPDATE Projeler SET BaslangicTarihi='2023-03-10' WHERE ProjeID=3;
	UPDATE Projeler SET BitisTarihi='2023-03-01' WHERE ProjeID=4;
	UPDATE Projeler SET Butce=61000.00 WHERE ProjeID=5;
	UPDATE Projeler SET ProjeAdi='Yaz�l�m G�ncel' WHERE ProjeID=6;
	UPDATE Projeler SET BaslangicTarihi='2023-06-01' WHERE ProjeID=7;
	UPDATE Projeler SET BitisTarihi='2023-12-15' WHERE ProjeID=8;
	UPDATE Projeler SET Butce=22500.00 WHERE ProjeID=9;
	UPDATE Projeler SET ProjeAdi='Sistem Entegrasyonu' WHERE ProjeID=10;


---Faturalar

	UPDATE Faturalar SET ToplamTutar=16000.00 WHERE FaturaID=1;
	UPDATE Faturalar SET Tip='Gider' WHERE FaturaID=2;
	UPDATE Faturalar SET Tarih='2023-03-20' WHERE FaturaID=3;
	UPDATE Faturalar SET ToplamTutar=12500.00 WHERE FaturaID=4;
	UPDATE Faturalar SET Tip='Gelir' WHERE FaturaID=5;
	UPDATE Faturalar SET ToplamTutar=76000.00 WHERE FaturaID=6;
	UPDATE Faturalar SET Tarih='2023-06-20' WHERE FaturaID=7;
	UPDATE Faturalar SET Tip='Gider' WHERE FaturaID=8;
	UPDATE Faturalar SET ToplamTutar=23000.00 WHERE FaturaID=9;
	UPDATE Faturalar SET Tarih='2023-08-20' WHERE FaturaID=10;


---Hizmetler

	UPDATE Hizmetler SET Fiyat=8000.00 WHERE HizmetID=1;
	UPDATE Hizmetler SET HizmetAdi='Mobil Uygulama Dev.' WHERE HizmetID=2;
	UPDATE Hizmetler SET Fiyat=5200.00 WHERE HizmetID=3;
	UPDATE Hizmetler SET HizmetAdi='Dijital Pazarlama Proj.' WHERE HizmetID=4;
	UPDATE Hizmetler SET Fiyat=3200.00 WHERE HizmetID=5;
	UPDATE Hizmetler SET HizmetAdi='Logo Tasar�m �al��mas�' WHERE HizmetID=6;
	UPDATE Hizmetler SET Fiyat=5700.00 WHERE HizmetID=7;
	UPDATE Hizmetler SET HizmetAdi='E-Ticaret Sitesi Kur.' WHERE HizmetID=8;
	UPDATE Hizmetler SET Fiyat=2700.00 WHERE HizmetID=9;
	UPDATE Hizmetler SET HizmetAdi='Sosyal Medya Y�n.' WHERE HizmetID=10;


---FaturaDetaylari

	UPDATE FaturaDetaylari SET Adet=3 WHERE DetayID=1;
	UPDATE FaturaDetaylari SET BirimFiyat=5200.00 WHERE DetayID=2;
	UPDATE FaturaDetaylari SET Adet=4 WHERE DetayID=3;
	UPDATE FaturaDetaylari SET BirimFiyat=15500.00 WHERE DetayID=4;
	UPDATE FaturaDetaylari SET Adet=1 WHERE DetayID=5;
	UPDATE FaturaDetaylari SET BirimFiyat=6100.00 WHERE DetayID=6;
	UPDATE FaturaDetaylari SET Adet=2 WHERE DetayID=7;
	UPDATE FaturaDetaylari SET BirimFiyat=2200.00 WHERE DetayID=8;
	UPDATE FaturaDetaylari SET Adet=3 WHERE DetayID=9;
	UPDATE FaturaDetaylari SET BirimFiyat=8500.00 WHERE DetayID=10;

---OdemeIslemleri

	UPDATE OdemeIslemleri SET Tutar=15500.00 WHERE OdemeID=1;
	UPDATE OdemeIslemleri SET OdemeYontemi='Havale' WHERE OdemeID=2;
	UPDATE OdemeIslemleri SET Tutar=9500.00 WHERE OdemeID=3;
	UPDATE OdemeIslemleri SET OdemeYontemi='Kredi Kart�' WHERE OdemeID=4;
	UPDATE OdemeIslemleri SET Tutar=11500.00 WHERE OdemeID=5;
	UPDATE OdemeIslemleri SET OdemeYontemi='Nakit' WHERE OdemeID=6;
	UPDATE OdemeIslemleri SET Tutar=10200.00 WHERE OdemeID=7;
	UPDATE OdemeIslemleri SET OdemeYontemi='Havale' WHERE OdemeID=8;
	UPDATE OdemeIslemleri SET Tutar=12500.00 WHERE OdemeID=9;
	UPDATE OdemeIslemleri SET OdemeYontemi='�ek' WHERE OdemeID=10;


---BankaHesaplari

	UPDATE BankaHesaplari SET HesapNo='12349876' WHERE HesapID=1;
	UPDATE BankaHesaplari SET BankaAdi='Ziraat Bank' WHERE HesapID=2;
	UPDATE BankaHesaplari SET IBAN='TR00 0002 0000 8765 4321 0000 99' WHERE HesapID=3;
	UPDATE BankaHesaplari SET HesapNo='44331122' WHERE HesapID=4;
	UPDATE BankaHesaplari SET BankaAdi='Akbank Bank' WHERE HesapID=5;
	UPDATE BankaHesaplari SET IBAN='TR00 0006 0000 9988 7766 0000 99' WHERE HesapID=6;
	UPDATE BankaHesaplari SET HesapNo='66779900' WHERE HesapID=7;
	UPDATE BankaHesaplari SET BankaAdi='Vak�f Bank' WHERE HesapID=8;
	UPDATE BankaHesaplari SET IBAN='TR00 0009 0000 3344 5566 0000 99' WHERE HesapID=9;
	UPDATE BankaHesaplari SET HesapNo='44559977' WHERE HesapID=10;

---Her tablo i�in 10 adet veri silme i�lemi yap�lacak

---Musteriler 

	DELETE FROM Musteriler WHERE Telefon=11111111111;
	DELETE FROM Musteriler WHERE Telefon=11111111112;
	DELETE FROM Musteriler WHERE Telefon=11111111113;
	DELETE FROM Musteriler WHERE Telefon=11111111114;
	DELETE FROM Musteriler WHERE Telefon=11111111115;
	DELETE FROM Musteriler WHERE Telefon=11111111116;
	DELETE FROM Musteriler WHERE Telefon=11111111117;
	DELETE FROM Musteriler WHERE Telefon=11111111118;
	DELETE FROM Musteriler WHERE Telefon=10000000009;
	DELETE FROM Musteriler WHERE Telefon=11111111110;


---Tedarikciler

	DELETE FROM Tedarikciler WHERE TedarikciID=11;
	DELETE FROM Tedarikciler WHERE TedarikciID=12;
	DELETE FROM Tedarikciler WHERE TedarikciID=13;
	DELETE FROM Tedarikciler WHERE TedarikciID=14;
	DELETE FROM Tedarikciler WHERE TedarikciID=15;
	DELETE FROM Tedarikciler WHERE TedarikciID=16;
	DELETE FROM Tedarikciler WHERE TedarikciID=17;
	DELETE FROM Tedarikciler WHERE TedarikciID=18;
	DELETE FROM Tedarikciler WHERE TedarikciID=19;
	DELETE FROM Tedarikciler WHERE TedarikciID=20;

---Kullanicilar

	DELETE FROM Kullanicilar WHERE KullaniciID=11;
	DELETE FROM Kullanicilar WHERE KullaniciID=12;
	DELETE FROM Kullanicilar WHERE KullaniciID=13;
	DELETE FROM Kullanicilar WHERE KullaniciID=14;
	DELETE FROM Kullanicilar WHERE KullaniciID=15;
	DELETE FROM Kullanicilar WHERE KullaniciID=16;
	DELETE FROM Kullanicilar WHERE KullaniciID=17;
	DELETE FROM Kullanicilar WHERE KullaniciID=18;
	DELETE FROM Kullanicilar WHERE KullaniciID=19;
	DELETE FROM Kullanicilar WHERE KullaniciID=20;

---Projeler

	DELETE FROM Projeler WHERE ProjeID=11;
	DELETE FROM Projeler WHERE ProjeID=12;
	DELETE FROM Projeler WHERE ProjeID=13;
	DELETE FROM Projeler WHERE ProjeID=14;
	DELETE FROM Projeler WHERE ProjeID=15;
	DELETE FROM Projeler WHERE ProjeID=16;
	DELETE FROM Projeler WHERE ProjeID=17;
	DELETE FROM Projeler WHERE ProjeID=18;
	DELETE FROM Projeler WHERE ProjeID=19;
	DELETE FROM Projeler WHERE ProjeID=20;

---Faturalar

	DELETE FROM Faturalar WHERE FaturaID=11;
	DELETE FROM Faturalar WHERE FaturaID=12;
	DELETE FROM Faturalar WHERE FaturaID=13;
	DELETE FROM Faturalar WHERE FaturaID=14;
	DELETE FROM Faturalar WHERE FaturaID=15;
	DELETE FROM Faturalar WHERE FaturaID=16;
	DELETE FROM Faturalar WHERE FaturaID=17;
	DELETE FROM Faturalar WHERE FaturaID=18;
	DELETE FROM Faturalar WHERE FaturaID=19;
	DELETE FROM Faturalar WHERE FaturaID=20;

---Hizmetler

	DELETE FROM Hizmetler WHERE HizmetID=11;
	DELETE FROM Hizmetler WHERE HizmetID=12;
	DELETE FROM Hizmetler WHERE HizmetID=13;
	DELETE FROM Hizmetler WHERE HizmetID=14;
	DELETE FROM Hizmetler WHERE HizmetID=15;
	DELETE FROM Hizmetler WHERE HizmetID=16;
	DELETE FROM Hizmetler WHERE HizmetID=17;
	DELETE FROM Hizmetler WHERE HizmetID=18;
	DELETE FROM Hizmetler WHERE HizmetID=19;
	DELETE FROM Hizmetler WHERE HizmetID=20;

---FaturaDetaylari

	DELETE FROM FaturaDetaylari WHERE DetayID=11;
	DELETE FROM FaturaDetaylari WHERE DetayID=12;
	DELETE FROM FaturaDetaylari WHERE DetayID=13;
	DELETE FROM FaturaDetaylari WHERE DetayID=14;
	DELETE FROM FaturaDetaylari WHERE DetayID=15;
	DELETE FROM FaturaDetaylari WHERE DetayID=16;
	DELETE FROM FaturaDetaylari WHERE DetayID=17;
	DELETE FROM FaturaDetaylari WHERE DetayID=18;
	DELETE FROM FaturaDetaylari WHERE DetayID=19;
	DELETE FROM FaturaDetaylari WHERE DetayID=20;

---OdemeIslemleri

	DELETE FROM OdemeIslemleri WHERE OdemeID=11;
	DELETE FROM OdemeIslemleri WHERE OdemeID=12;
	DELETE FROM OdemeIslemleri WHERE OdemeID=13;
	DELETE FROM OdemeIslemleri WHERE OdemeID=14;
	DELETE FROM OdemeIslemleri WHERE OdemeID=15;
	DELETE FROM OdemeIslemleri WHERE OdemeID=16;
	DELETE FROM OdemeIslemleri WHERE OdemeID=17;
	DELETE FROM OdemeIslemleri WHERE OdemeID=18;
	DELETE FROM OdemeIslemleri WHERE OdemeID=19;
	DELETE FROM OdemeIslemleri WHERE OdemeID=20;

---BankaHesaplari

	DELETE FROM BankaHesaplari WHERE HesapID=11;
	DELETE FROM BankaHesaplari WHERE HesapID=12;
	DELETE FROM BankaHesaplari WHERE HesapID=13;
	DELETE FROM BankaHesaplari WHERE HesapID=14;
	DELETE FROM BankaHesaplari WHERE HesapID=15;
	DELETE FROM BankaHesaplari WHERE HesapID=16;
	DELETE FROM BankaHesaplari WHERE HesapID=17;
	DELETE FROM BankaHesaplari WHERE HesapID=18;
	DELETE FROM BankaHesaplari WHERE HesapID=19;
	DELETE FROM BankaHesaplari WHERE HesapID=20;

---Her tablo i�in 5 adet farkl� SQL fonksiyonlar� kullan�larak Select sorgular� yap�lacak.
---Musteriler 
	SELECT COUNT(*) AS ToplamMusteri FROM Musteriler;
	SELECT SUM(ToplamTutar) AS ToplamGelir FROM Faturalar WHERE Tip='Gelir';
	SELECT AVG(Fiyat) AS OrtalamaFiyat FROM Hizmetler;
	SELECT MIN(Butce) AS EnDusukButce FROM Projeler;
	SELECT MAX(Tutar) AS EnYuksekOdeme FROM OdemeIslemleri;

---Tedarikciler
	SELECT COUNT(*) AS ToplamTedarikci FROM Tedarikciler;
	SELECT MAX(Telefon) AS EnYuksekTelefon FROM Tedarikciler;
	SELECT MIN(Telefon) AS EnDusukTelefon FROM Tedarikciler;
	SELECT SUM(TedarikciID) AS IDToplami FROM Tedarikciler;
	SELECT AVG(CAST(Telefon AS BIGINT)) AS OrtalamaTelefon FROM Tedarikciler;

---Kullanicilar
	SELECT COUNT(*) AS ToplamKullanici FROM Kullanicilar;
	SELECT MAX(KullaniciID) AS EnYuksekKullaniciID FROM Kullanicilar;
	SELECT MIN(KullaniciID) AS EnDusukKullaniciID FROM Kullanicilar;
	SELECT SUM(KullaniciID) AS KullaniciIDToplami FROM Kullanicilar;
	SELECT AVG(KullaniciID) AS OrtalamaKullaniciID FROM Kullanicilar;

---Projeler
	SELECT COUNT(*) AS ToplamProje FROM Projeler;
	SELECT MAX(Butce) AS EnYuksekButce FROM Projeler;
	SELECT MIN(Butce) AS EnDusukButce FROM Projeler;
	SELECT SUM(Butce) AS ButceToplami FROM Projeler;
	SELECT AVG(Butce) AS OrtalamaButce FROM Projeler;

---Faturalar
	SELECT COUNT(*) AS ToplamFatura FROM Faturalar;
	SELECT MAX(ToplamTutar) AS EnYuksekFatura FROM Faturalar;
	SELECT MIN(ToplamTutar) AS EnDusukFatura FROM Faturalar;
	SELECT SUM(ToplamTutar) AS ToplamFaturaTutari FROM Faturalar;
	SELECT AVG(ToplamTutar) AS OrtalamaFaturaTutari FROM Faturalar;

---Hizmetler
	SELECT COUNT(*) AS ToplamHizmet FROM Hizmetler;
	SELECT MAX(Fiyat) AS EnYuksekHizmetFiyati FROM Hizmetler;
	SELECT MIN(Fiyat) AS EnDusukHizmetFiyati FROM Hizmetler;
	SELECT SUM(Fiyat) AS ToplamHizmetFiyati FROM Hizmetler;
	SELECT AVG(Fiyat) AS OrtalamaHizmetFiyati FROM Hizmetler;

---FaturaDetaylari
	SELECT COUNT(*) AS ToplamDetayKaydi FROM FaturaDetaylari;
	SELECT MAX(Toplam) AS EnYuksekToplam FROM FaturaDetaylari;
	SELECT MIN(Toplam) AS EnDusukToplam FROM FaturaDetaylari;
	SELECT SUM(Toplam) AS GenelToplam FROM FaturaDetaylari;
	SELECT AVG(Toplam) AS OrtalamaToplam FROM FaturaDetaylari;

---OdemeIslemleri
	SELECT COUNT(*) AS ToplamOdemeKaydi FROM OdemeIslemleri;
	SELECT MAX(Tutar) AS EnYuksekOdeme FROM OdemeIslemleri;
	SELECT MAX(Tutar) AS EnYuksekOdeme FROM OdemeIslemleri;
	SELECT MIN(Tutar) AS EnDusukOdeme FROM OdemeIslemleri;
	SELECT SUM(Tutar) AS GenelOdemeToplami FROM OdemeIslemleri;

---BankaHesaplari
	SELECT COUNT(*) AS ToplamHesapSayisi FROM BankaHesaplari;
	SELECT COUNT(*) AS ToplamHesapSayisi FROM BankaHesaplari;
	SELECT MIN(CAST(HesapNo AS BIGINT)) AS EnKucukHesapNo FROM BankaHesaplari;
	SELECT COUNT(DISTINCT BankaAdi) AS FarkliBankaSayisi FROM BankaHesaplari;
	SELECT COUNT(DISTINCT BankaAdi) AS FarkliBankaSayisi FROM BankaHesaplari;

---Projeler ve M��teriler aras�ndaki ili�ki:
	SELECT P.ProjeID, P.ProjeAdi, M.Ad AS MusteriAdi, M.Soyad AS MusteriSoyadi
	FROM Projeler P
		JOIN Musteriler M ON P.MusteriID = M.MusteriID;

---Faturalar ve Projeler:
	SELECT F.FaturaID, F.Tarih, F.Tip, P.ProjeAdi
	FROM Faturalar F
		JOIN Projeler P ON F.ProjeID = P.ProjeID;

---FaturaDetaylari ve Hizmetler:
	SELECT FD.DetayID, H.HizmetAdi, FD.Adet, FD.Toplam
	FROM FaturaDetaylari FD
		JOIN Hizmetler H ON FD.HizmetID = H.HizmetID;

---OdemeIslemleri ve Faturalar:
	SELECT O.OdemeID, F.FaturaID, F.ToplamTutar, O.Tutar AS OdemeTutari
	FROM OdemeIslemleri O
		JOIN Faturalar F ON O.FaturaID = F.FaturaID;

---Projeler ve Faturalar:
	SELECT P.ProjeID, P.ProjeAdi, F.FaturaID, F.ToplamTutar
	FROM Projeler P
		LEFT JOIN Faturalar F ON P.ProjeID = F.ProjeID;

-- M��teri ve faturalar�n�n detaylar�n� g�steren view
	CREATE VIEW MusteriFaturaDetay AS
	SELECT 
		m.MusteriID,
		m.Ad + ' ' + m.Soyad AS MusteriAdi,
		p.ProjeAdi,
		f.FaturaID,
		f.Tarih AS FaturaTarihi,
		f.Tip AS FaturaTipi,
		f.ToplamTutar,
		fd.HizmetID,
		h.HizmetAdi,
		fd.Adet,
		fd.BirimFiyat,
		fd.Toplam AS HizmetToplam
	FROM Musteriler m
	INNER JOIN Projeler p ON m.MusteriID = p.MusteriID
	INNER JOIN Faturalar f ON p.ProjeID = f.ProjeID
	INNER JOIN FaturaDetaylari fd ON f.FaturaID = fd.FaturaID
	INNER JOIN Hizmetler h ON fd.HizmetID = h.HizmetID;

	SELECT * FROM MusteriFaturaDetay;

---M��terilerin hangi projelerde �al��t���n� ve proje b�t�elerini
	CREATE VIEW vw_MusteriProjeler AS
	SELECT 
		m.MusteriID,
		m.Ad + ' ' + m.Soyad AS MusteriAdi,
		p.ProjeID,
		p.ProjeAdi,
		p.BaslangicTarihi,
		p.BitisTarihi,
		p.Butce
	FROM Musteriler m
	JOIN Projeler p ON m.MusteriID = p.MusteriID;

---Projelerle ili�kili faturalar�n ve �demelerin durumunu
	CREATE VIEW vw_FaturaOdeme AS
	SELECT 
		f.FaturaID,
		p.ProjeAdi,
		f.Tip,
		f.ToplamTutar AS FaturaTutari,
		o.Tutar AS OdemeTutari,
		o.OdemeYontemi,
		o.Tarih AS OdemeTarihi
	FROM Faturalar f
	JOIN Projeler p ON f.ProjeID = p.ProjeID
	LEFT JOIN OdemeIslemleri o ON f.FaturaID = o.FaturaID;

---Faturalar�n hangi hizmetlerden olu�tu�unu ve toplam fiyat�n�
	CREATE VIEW vw_HizmetFaturaDetay AS
	SELECT 
		f.FaturaID,
		h.HizmetAdi,
		fd.Adet,
		fd.BirimFiyat,
		fd.Toplam
	FROM FaturaDetaylari fd
	JOIN Hizmetler h ON fd.HizmetID = h.HizmetID
	JOIN Faturalar f ON fd.FaturaID = f.FaturaID;

---Kullan�c�lar�n projelerle ili�kili i�lemlerini
	CREATE VIEW vw_KullaniciProjeler AS
	SELECT 
		k.KullaniciID,
		k.KullaniciAdi + ' ' + k.KullaniciSoyadi AS KullaniciAdi,
		p.ProjeID,
		p.ProjeAdi,
		f.ToplamTutar AS FaturaTutari
	FROM Kullanicilar k
	JOIN Projeler p ON k.KullaniciID = p.MusteriID  
	JOIN Faturalar f ON p.ProjeID = f.ProjeID;

---Hangi �demelerin hangi banka hesab�ndan yap�ld���n�
	CREATE VIEW vw_BankaOdeme AS
	SELECT 
		b.HesapID,
		b.BankaAdi,
		b.IBAN,
		o.OdemeID,
		o.Tutar,
		o.Tarih,
		o.OdemeYontemi
	FROM BankaHesaplari b
	JOIN OdemeIslemleri o ON b.HesapID = o.OdemeID; 

-- Projeler ve Musteriler tablolar�n� JOIN ile birle�tirip proje adlar�n� ve m��teri isimlerini listeleme
	SELECT P.ProjeAdi, M.Ad AS MusteriAdi, M.Soyad AS MusteriSoyadi, P.Butce
	FROM Projeler P
	INNER JOIN Musteriler M ON P.MusteriID = M.MusteriID;

-- Faturalar ve Projeler tablolar�n� JOIN ile birle�tirip fatura tutarlar�n� ve proje adlar�n� listeleme
	SELECT F.FaturaID, F.ToplamTutar, P.ProjeAdi
	FROM Faturalar F
	INNER JOIN Projeler P ON F.ProjeID = P.ProjeID;

-- FaturaDetaylari ve Hizmetler tablolar�n� JOIN ile birle�tirip toplam tutar� ve hizmet adlar�n� listeleme
	SELECT FD.DetayID, H.HizmetAdi, FD.Adet, FD.Toplam
	FROM FaturaDetaylari FD
	INNER JOIN Hizmetler H ON FD.HizmetID = H.HizmetID;

-- OdemeIslemleri ve Faturalar tablolar�n� JOIN ile birle�tirip �deme miktar�n� ve fatura tipini g�sterme
	SELECT O.OdemeID, O.Tutar, F.Tip
	FROM OdemeIslemleri O
	INNER JOIN Faturalar F ON O.FaturaID = F.FaturaID;

-- Her proje i�in sa�lanan hizmetlerin toplam gelirini g�sterme
	SELECT P.ProjeAdi, SUM(FD.Toplam) AS ToplamHizmetGeliri
	FROM Projeler P
	INNER JOIN Faturalar F ON P.ProjeID = F.ProjeID
	INNER JOIN FaturaDetaylari FD ON F.FaturaID = FD.FaturaID
	GROUP BY P.ProjeAdi;

---T�m m��teriler ve projeleri
	SELECT * FROM vw_MusteriProjeler;

---B�t�esi 50.000 TL �zeri projeler
	SELECT MusteriAdi, ProjeAdi, Butce
	FROM vw_MusteriProjeler
	WHERE Butce > 50000;

---Belirli m��terinin projeleri
	SELECT ProjeAdi, BaslangicTarihi, BitisTarihi
	FROM vw_MusteriProjeler
	WHERE MusteriAdi LIKE 'Beyza Ceylan';

---T�m fatura ve �deme bilgileri
	SELECT * FROM vw_FaturaOdeme;

---�demesi tamamlanmam�� faturalar
	SELECT FaturaID, ProjeAdi, FaturaTutari, OdemeTutari
	FROM vw_FaturaOdeme
	WHERE OdemeTutari IS NULL OR OdemeTutari < FaturaTutari;

---Belirli bir proje i�in fatura ve �demeler
	SELECT FaturaID, Tip, FaturaTutari, OdemeTutari
	FROM vw_FaturaOdeme
	WHERE ProjeAdi = 'Web Sitesi Tasar�m�';

---T�m fatura hizmet detaylar�
	SELECT * FROM vw_HizmetFaturaDetay;

---Toplam maliyeti 10.000 TL �zeri hizmetler
	SELECT FaturaID, HizmetAdi, Adet, Toplam
	FROM vw_HizmetFaturaDetay
	WHERE Toplam > 10000;

---Belirli bir hizmetin faturalar�
	SELECT FaturaID, Adet, Toplam
	FROM vw_HizmetFaturaDetay
	WHERE HizmetAdi = 'SEO Optimizasyonu';

---T�m kullan�c� ve proje faturalar�
	SELECT * FROM vw_KullaniciProjeler;

---En fazla fatura tutar�na sahip kullan�c�lar
	SELECT KullaniciAdi, SUM(FaturaTutari) AS ToplamFatura
	FROM vw_KullaniciProjeler
	GROUP BY KullaniciAdi
	ORDER BY ToplamFatura DESC;

---Belirli bir kullan�c�ya ait projeler
	SELECT ProjeAdi, FaturaTutari
	FROM vw_KullaniciProjeler
	WHERE KullaniciAdi LIKE 'Beyza Ceylan';

---T�m banka hesap ve �demeler
	SELECT * FROM vw_BankaOdeme;

---Belirli bir bankadan yap�lan �demeler
	SELECT HesapID, Tutar, Tarih
	FROM vw_BankaOdeme
	WHERE BankaAdi = 'Akbank Bankas�';

---Belirli tarihler aras� �demeler
	SELECT BankaAdi, IBAN, Tutar, Tarih
	FROM vw_BankaOdeme
	WHERE Tarih BETWEEN '2025-01-01' AND '2025-08-31';





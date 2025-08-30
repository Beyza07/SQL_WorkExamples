Create database beyzacyln

USE beyzacyln

CREATE TABLE Musteriler (
    MusteriID INT PRIMARY KEY,
    Ad VARCHAR(50),
    Soyad VARCHAR(50),
    Telefon VARCHAR(15),
    Email VARCHAR(50),
    Adres VARCHAR(100)
)

CREATE TABLE Araclar (
    AracID INT PRIMARY KEY,
    Marka VARCHAR(50),
    Model VARCHAR(50),
    Plaka VARCHAR(10),
    Durum VARCHAR(20), 
    GunlukFiyat DECIMAL(10, 2)
)

CREATE TABLE Kiralama (
    KiralamaID INT PRIMARY KEY,
    MusteriID INT,
    AracID INT,
    BaslangicTarihi DATE,
    BitisTarihi DATE,
    ToplamTutar DECIMAL(10, 2),
    FOREIGN KEY (MusteriID) REFERENCES Musteriler(MusteriID),
    FOREIGN KEY (AracID) REFERENCES Araclar(AracID)
)

CREATE TABLE KiraDetay (
    KiraDetayID INT PRIMARY KEY,
    KiralamaID INT,
    GunlukFiyat DECIMAL(10, 2),
    GunSayisi INT,
    ToplamTutar DECIMAL(10, 2),
	AracID INT,
    FOREIGN KEY (KiralamaID) REFERENCES Kiralama(KiralamaID)
)

CREATE TABLE Sube (
    SubeID INT PRIMARY KEY,
    SubeAdi VARCHAR(50),
    Adres VARCHAR(100),
    Telefon VARCHAR(15)
)

CREATE TABLE Calisanlar (
    CalisanID INT PRIMARY KEY,
    Ad VARCHAR(50),
    Soyad VARCHAR(50),
    Telefon VARCHAR(15),
    Email VARCHAR(50),
    SubeID INT,
    FOREIGN KEY (SubeID) REFERENCES Sube(SubeID)
)

CREATE TABLE Bakim (
    BakimID INT PRIMARY KEY,
    AracID INT,
    BakimTarihi DATE,
    Aciklama VARCHAR(200),
    FOREIGN KEY (AracID) REFERENCES Araclar(AracID)
)

CREATE TABLE Sigorta (
    SigortaID INT PRIMARY KEY,
    AracID INT,
    BaslangicTarihi DATE,
    BitisTarihi DATE,
    PrimMiktari DECIMAL(10, 2),
    FOREIGN KEY (AracID) REFERENCES Araclar(AracID)
)

INSERT INTO Musteriler(MusteriID, Ad, Soyad, Telefon,Email,Adres)
VALUES (1, 'Beyza', 'Ceylan', '5551234567', 'bycyln7@email.com', 'Kastamonu'),
(2, 'Ayþe', 'Fatma', '5557654321', 'ayse@email.com', 'Ankara'),
(3, 'Mehmet', 'Kaya', '5559876543', 'mehmet@email.com', 'Ýzmir'),
(4, 'Zeynep', 'Demir', '5557890123', 'zeynep@email.com', 'Bursa'),
(5, 'Merve', 'Acar', '5559900111', 'merve@email.com', 'Bursa'),
(6, 'Deniz', 'Yýlmaz', '5551122334', 'deniz@email.com', 'Antalya'),
(7, 'Kemal', 'Ozturk', '5553344555', 'kemal@email.com', 'Ýzmir'),
(8, 'Aslý', 'Bilgin', '5555566777', 'asli@email.com', 'Bursa'),
(9, 'Merve', 'Arslan', '5557788999', 'merve@email.com', 'Ankara'),
(10, 'Can', 'Demir', '5559900111', 'can@email.com', 'Ýstanbul'),
(11, 'Gizem', 'Yýldýz', '5552233445', 'gizem@email.com', 'Eskiþehir'),
(12, 'Okan', 'Kara', '5551122334', 'okan@email.com', 'Trabzon'),
(13, 'Nihan', 'Kurt', '5553344555', 'nihan@email.com', 'Gaziantep'),
(14, 'Burak', 'Yücel', '5555566777', 'burak@email.com', 'Antalya'),
(15, 'Ezgi', 'Öztürk', '5557788999', 'ezgi@email.com', 'Ýstanbul'),
(16, 'Arda', 'Yýlmaz', '5553344555', 'arda@email.com', 'Ýzmir'),
(17, 'Dilara', 'Acar', '5555566777', 'dilara@email.com', 'Bursa'),
(18, 'Yunus', 'Demir', '5557788999', 'yunus@email.com', 'Ankara'),
(19, 'Sena', 'Oktay', '5559900111', 'sena@email.com', 'Eskiþehir'),
(20, 'Ali', 'Kara', '5552233445', 'ali@email.com', 'Trabzon')


INSERT INTO Araclar (AracID,Marka,Model,Plaka,Durum,GunlukFiyat)
VALUES(1, 'Toyota', 'Corolla', '34ABC123', 'Uygun', 150.00),
(2, 'Renault', 'Clio', '06XYZ789', 'Uygun', 120.00),
(3, 'Ford', 'Focus', '07DEF456', 'Uygun', 130.00),
(4, 'Volkswagen', 'Golf', '16JKL789', 'Uygun', 140.00),
(5, 'Hyundai', 'i20', '35GHI678', 'Uygun', 110.00),
(6, 'Peugeot', '308', '26JKL345', 'Uygun', 130.00),
(7, 'Renault', 'Megane', '34JKL123', 'Uygun', 160.00),
(8, 'Ford', 'Fiesta', '06ABC789', 'Uygun', 140.00),
(9, 'Hyundai', 'Accent', '35XYZ456', 'Uygun', 130.00),
(10, 'Volkswagen', 'Passat', '16DEF789', 'Uygun', 180.00),
(11, 'Toyota', 'Yaris', '34GHI234', 'Uygun', 150.00),
(12, 'Honda', 'Civic', '06JKL567', 'Uygun', 170.00),
(13, 'Mazda', '3', '35ABC123', 'Uygun', 155.00),
(14, 'Chevrolet', 'Cruze', '16XYZ789', 'Uygun', 160.00),
(15, 'Peugeot', '208', '34DEF234', 'Uygun', 145.00),
(16, 'Nissan', 'Qashqai', '06GHI567', 'Uygun', 175.00),
(17, 'Kia', 'Rio', '35JKL123', 'Uygun', 135.00),
(18, 'Suzuki', 'Swift', '16ABC789', 'Uygun', 125.00),
(19, 'Mercedes', 'A-Class', '34XYZ456', 'Uygun', 200.00),
(20, 'Audi', 'A3', '06DEF789', 'Uygun', 190.00)


INSERT INTO Kiralama (KiralamaID,MusteriID,AracID,BaslangicTarihi,BitisTarihi,ToplamTutar)
VALUES (1, 1, 1, '2023-01-01', '2023-01-07', 900.00),
(2, 2, 2, '2023-01-05', '2023-01-10', 600.00),
(3, 3, 3, '2023-02-10', '2023-02-15', 650.00),
(4, 2, 4, '2023-02-15', '2023-02-20', 700.00),
(5, 4, 5, '2023-03-10', '2023-03-15', 550.00),
(6, 5, 6, '2023-03-15', '2023-03-20', 650.00),
(7, 6, 7, '2023-04-10', '2023-04-15', 800.00),
(8, 7, 8, '2023-04-15', '2023-04-20', 700.00),
(9, 8, 9, '2023-04-20', '2023-04-25', 650.00),
(10, 9, 10, '2023-04-25', '2023-04-30', 900.00),
(11, 10, 11, '2023-05-01', '2023-05-06', 850.00),
(12, 11, 12, '2023-05-06', '2023-05-11', 950.00),
(13, 12, 13, '2023-05-11', '2023-05-16', 870.00),
(14, 13, 14, '2023-05-16', '2023-05-21', 880.00),
(15, 14, 15, '2023-05-21', '2023-05-26', 800.00),
(16, 15, 16, '2023-05-26', '2023-05-31', 950.00),
(17, 16, 17, '2023-06-01', '2023-06-06', 920.00),
(18, 17, 18, '2023-06-06', '2023-06-11', 720.00),
(19, 18, 19, '2023-06-11', '2023-06-16', 670.00),
(20, 19, 20, '2023-06-16', '2023-06-21', 910.00)


INSERT INTO KiraDetay (KiraDetayID,KiralamaID,GunlukFiyat,GunSayisi,ToplamTutar,AracID)
VALUES (11, 1, 150.00, 6, 900.00,1),
(12, 2, 120.00, 5, 600.00,2),
(13, 3, 130.00, 5, 650.00,3),
(14, 4, 140.00, 5, 700.00,4),
(15, 5, 110.00, 5, 550.00,5),
(16, 6, 130.00, 5, 650.00,6),
(17, 7, 160.00, 5, 800.00,7),
(18, 8, 140.00, 5, 700.00,8),
(19, 9, 130.00, 5, 650.00,9),
(20, 10, 180.00, 5, 900.00,10),
(21, 11, 150.00, 5, 750.00,11),
(22, 12, 170.00, 5, 850.00,12),
(23, 13, 155.00, 5, 775.00,13),
(24, 14, 160.00, 5, 800.00,14),
(25, 15, 145.00, 5, 725.00,15),
(26, 16, 175.00, 5, 875.00,16),
(27, 17, 135.00, 5, 675.00,17),
(28, 18, 125.00, 5, 625.00,18),
(29, 19, 200.00, 5, 1000.00,19),
(30, 20, 190.00, 5, 950.00,20)


INSERT INTO Sube(SubeID,SubeAdi,Adres,Telefon)
VALUES (1, 'Kastamonu Þubesi', 'Kastamonu', '5551112233'),
(2, 'Ankara Þubesi', 'Ankara', '5553322111'),
(3, 'Ýzmir Þubesi', 'Ýzmir', '5553344555'),
(4, 'Bursa Þubesi', 'Bursa', '5555566777'),
(5, 'Adana Þubesi', 'Adana', '5557788999'),
(6, 'Eskiþehir Þubesi', 'Eskiþehir', '5559900111'),
(7, 'Ýzmir Þubesi', 'Ýzmir', '5558899000'),
(8, 'Bursa Þubesi', 'Bursa', '5550011223'),
(9, 'Ankara Þubesi', 'Ankara', '5553344556'),
(10, 'Ýstanbul Þubesi', 'Ýstanbul', '5555566778'),
(11, 'Eskiþehir Þubesi', 'Eskiþehir', '5557788999'),
(12, 'Trabzon Þubesi', 'Trabzon', '5559900111'),
(13, 'Gaziantep Þubesi', 'Gaziantep', '5551122334'),
(14, 'Adana Þubesi', 'Adana', '5553344555'),
(15, 'Mersin Þubesi', 'Mersin', '5555566777'),
(16, 'Konya Þubesi', 'Konya', '5557788999'),
(17, 'Denizli Þubesi', 'Denizli', '5559900111'),
(18, 'Kayseri Þubesi', 'Kayseri', '5551122334'),
(19, 'Samsun Þubesi', 'Samsun', '5553344555'),
(20, 'Malatya Þubesi', 'Malatya', '5555566777')


INSERT INTO Calisanlar (CalisanID,Ad,Soyad,Telefon,Email,SubeID)
VALUES (1, 'Beyza', 'Ceylan', '5554441122', 'bycyln@email.com', 1),
(2, 'Ayþe', 'Kaya', '5552211334', 'ayse@email.com', 2),
(3, 'Mustafa', 'Yýldýz', '5551122334', 'mustafa@email.com', 3),
(4, 'Fatma', 'Aydýn', '5552233445', 'fatma@email.com', 4),
(5, 'Cem', 'Kurt', '5553344555', 'cem@email.com', 5),
(6, 'Deniz', 'Acar', '5555566777', 'deniz@email.com', 6),
(7, 'Ahmet', 'Yýlmaz', '5551122334', 'ahmet@email.com', 7),
(8, 'Ayþe', 'Kara', '5553344555', 'ayse@email.com', 8),
(9, 'Mehmet', 'Demir', '5555566777', 'mehmet@email.com', 9),
(10, 'Fatma', 'Arslan', '5557788999', 'fatma@email.com', 10),
(11, 'Cem', 'Can', '5550011223', 'cem@email.com', 11),
(12, 'Zeynep', 'Yýldýz', '5552233445', 'zeynep@email.com', 12),
(13, 'Murat', 'Koç', '5553344556', 'murat@email.com', 13),
(14, 'Sevgi', 'Sönmez', '5554455667', 'sevgi@email.com', 14),
(15, 'Eren', 'Güneþ', '5555566778', 'eren@email.com', 15),
(16, 'Deniz', 'Kurt', '5556677889', 'deniz@email.com', 16),
(17, 'Gizem', 'Acar', '5557788990', 'gizem@email.com', 17),
(18, 'Ozan', 'Kýlýç', '5558899001', 'ozan@email.com', 18),
(19, 'Nil', 'Kaya', '5550011224', 'nil@email.com', 19),
(20, 'Ali', 'Erdem', '5551122335', 'ali@email.com', 20)


INSERT INTO Bakim (BakimID,AracID,BakimTarihi,Aciklama)
VALUES (1, 1, '2023-02-01', 'Periyodik bakým'),
(2, 2, '2023-02-05', 'Arýzanýn giderilmesi'),
(3, 3, '2023-03-01', 'Motor bakýmý'),
(4, 4, '2023-03-05', 'Lastik deðiþimi'),
(5, 5, '2023-04-01', 'Fren bakýmý'),
(6, 6, '2023-04-05', 'Yað deðiþimi'),
(7, 6, '2023-08-10', 'Jant bakýmý'),
(8, 7, '2023-08-15', 'Far deðiþimi'),
(9, 8, '2023-08-20', 'Egzoz temizliði'),
(10, 9, '2023-08-25', 'Fren kontrolü'),
(11, 10, '2023-09-01', 'Yað deðiþimi'),
(12, 11, '2023-09-06', 'Radyatör kontrolü'),
(13, 12, '2023-09-11', 'Motor ayarý'),
(14, 13, '2023-09-16', 'Akü deðiþimi'),
(15, 14, '2023-09-21', 'Stepne kontrolü'),
(16, 15, '2023-09-26', 'Elektrik aksamý bakýmý'),
(17, 16, '2023-10-01', 'Yakýt sistemi kontrolü'),
(18, 17, '2023-10-06', 'Filtre deðiþimi'),
(19, 18, '2023-10-11', 'Þanzýman bakýmý'),
(20, 19, '2023-10-16', 'Diferansiyel kontrolü')


INSERT INTO Sigorta (SigortaID,AracID,BaslangicTarihi,BitisTarihi,PrimMiktari)
VALUES (1, 1, '2023-01-01', '2023-12-31', 200.00),
(2, 2, '2023-02-01', '2023-11-30', 150.00),
(3, 3, '2023-02-15', '2023-08-14', 180.00),
(4, 4, '2023-03-01', '2023-09-30', 160.00),
(5, 5, '2023-03-15', '2023-09-14', 150.00),
(6, 6, '2023-04-01', '2023-10-31', 180.00),
(7, 6, '2023-08-10', '2024-08-09', 180.00),
(8, 7, '2023-08-15', '2024-08-14', 200.00),
(9, 8, '2023-08-20', '2024-08-19', 150.00),
(10, 9, '2023-08-25', '2024-08-24', 170.00),
(11, 10, '2023-09-01', '2024-08-31', 190.00),
(12, 11, '2023-09-06', '2024-09-05', 160.00),
(13, 12, '2023-09-11', '2024-09-10', 175.00),
(14, 13, '2023-09-16', '2024-09-15', 185.00),
(15, 14, '2023-09-21', '2024-09-20', 170.00),
(16, 15, '2023-09-26', '2024-09-25', 195.00),
(17, 16, '2023-10-01', '2024-09-30', 180.00),
(18, 17, '2023-10-06', '2024-10-05', 190.00),
(19, 18, '2023-10-11', '2024-10-10', 155.00),
(20, 19, '2023-10-16', '2024-10-15', 165.00)


UPDATE Musteriler SET Ad = 'Beyza' WHERE MusteriID = 1;
UPDATE Musteriler SET Soyad = 'Yýlmaz' WHERE MusteriID = 2;
UPDATE Musteriler SET Telefon = '5550001122' WHERE MusteriID = 3;
UPDATE Musteriler SET Email = 'ahmet.yilmaz@email.com' WHERE MusteriID = 4;
UPDATE Musteriler SET Adres = 'Ýstanbul' WHERE MusteriID = 5;
UPDATE Musteriler SET Ad = 'Ayþe' WHERE MusteriID = 6;
UPDATE Musteriler SET Soyad = 'Kara' WHERE MusteriID = 7;
UPDATE Musteriler SET Telefon = '5551112233' WHERE MusteriID = 8;
UPDATE Musteriler SET Email = 'ayse.kara@email.com' WHERE MusteriID = 9;
UPDATE Musteriler SET Adres = 'Ankara' WHERE MusteriID = 10;



UPDATE Araclar SET Marka = 'Toyota' WHERE AracID = 1;
UPDATE Araclar SET Model = 'Corolla' WHERE AracID = 2;
UPDATE Araclar SET Plaka = '34JKL987' WHERE AracID = 3;
UPDATE Araclar SET Durum = 'Uygun' WHERE AracID = 4;
UPDATE Araclar SET GunlukFiyat = 170.00 WHERE AracID = 5;
UPDATE Araclar SET Marka = 'Ford' WHERE AracID = 6;
UPDATE Araclar SET Model = 'Focus' WHERE AracID = 7;
UPDATE Araclar SET Plaka = '34ABC123' WHERE AracID = 8;
UPDATE Araclar SET Durum = 'Uygun' WHERE AracID = 9;
UPDATE Araclar SET GunlukFiyat = 160.00 WHERE AracID = 10;



UPDATE Kiralama SET AracID = 5 WHERE KiralamaID = 1;
UPDATE Kiralama SET MusteriID = 6 WHERE KiralamaID = 2;
UPDATE Kiralama SET BaslangicTarihi = '2023-06-01' WHERE KiralamaID = 3;
UPDATE Kiralama SET BitisTarihi = '2023-06-06' WHERE KiralamaID = 4;
UPDATE Kiralama SET ToplamTutar = 720.00 WHERE KiralamaID = 5;
UPDATE Kiralama SET AracID = 10 WHERE KiralamaID = 6;
UPDATE Kiralama SET MusteriID = 7 WHERE KiralamaID = 7;
UPDATE Kiralama SET BaslangicTarihi = '2023-06-06' WHERE KiralamaID = 8;
UPDATE Kiralama SET BitisTarihi = '2023-06-11' WHERE KiralamaID = 9;
UPDATE Kiralama SET ToplamTutar = 670.00 WHERE KiralamaID = 10;


UPDATE KiraDetay SET AracID = 8, GunlukFiyat = 145.00, GunSayisi = 4, ToplamTutar = 580.00 WHERE KiraDetayID = 11;
UPDATE KiraDetay SET GunlukFiyat = 145.00 WHERE DetayID = 12;
UPDATE KiraDetay SET GunSayisi = 4 WHERE DetayID = 13;
UPDATE KiraDetay SET GunSayisi = 5, ToplamFiyat = 725.00 WHERE DetayID = 14;
UPDATE KiraDetay SET AracID = 9 WHERE DetayID = 5;
UPDATE KiraDetay SET GunlukFiyat = 130.00 WHERE DetayID = 6;
UPDATE KiraDetay SET GunSayisi = 6 WHERE DetayID = 7;
UPDATE KiraDetay SET ToplamFiyat = 780.00 WHERE DetayID = 8;
UPDATE KiraDetay SET AracID = 10 WHERE DetayID = 9;
UPDATE KiraDetay SET GunlukFiyat = 180.00 WHERE DetayID = 10;


UPDATE Sube SET SubeAdi = 'Yeni Ýstanbul Þubesi', Telefon = '5551122333' WHERE SubeID = 1;
UPDATE Sube SET Adres = 'Yeni Ankara Adresi' WHERE SubeID = 2;
UPDATE Sube SET Telefon = '5554445566' WHERE SubeID = 3;
UPDATE Sube SET Adres = 'Yeni Bursa Adresi', Telefon = '5558889999' WHERE SubeID = 4;
UPDATE Sube SET Adres = 'Yeni Adana Adresi' WHERE SubeID = 5;
UPDATE Sube SET SubeAdi = 'Yeni Eskiþehir Þubesi' WHERE SubeID = 6;
UPDATE Sube SET Telefon = '5550001111' WHERE SubeID = 7;
UPDATE Sube SET Adres = 'Yeni Ýzmir Adresi', Telefon = '5557778888' WHERE SubeID = 8;
UPDATE Sube SET Adres = 'Yeni Bursa Adresi' WHERE SubeID = 9;
UPDATE Sube SET Adres = 'Yeni Ankara Adresi', Telefon = '5552223333' WHERE SubeID = 10;


UPDATE Calisanlar SET Ad = 'Yeni Ad1', Telefon = '5551112233' WHERE CalisanID = 1;
UPDATE Calisanlar SET Ad = 'Yeni Ad2', Telefon = '5552223344' WHERE CalisanID = 2;
UPDATE Calisanlar SET Ad = 'Yeni Ad3', Telefon = '5553334455' WHERE CalisanID = 3;
UPDATE Calisanlar SET Ad = 'Yeni Ad4', Telefon = '5554445566' WHERE CalisanID = 4;
UPDATE Calisanlar SET Ad = 'Yeni Ad5', Telefon = '5555556677' WHERE CalisanID = 5;
UPDATE Calisanlar SET Ad = 'Yeni Ad6', Telefon = '5556667788' WHERE CalisanID = 6;
UPDATE Calisanlar SET Ad = 'Yeni Ad7', Telefon = '5557778899' WHERE CalisanID = 7;
UPDATE Calisanlar SET Ad = 'Yeni Ad8', Telefon = '5558889000' WHERE CalisanID = 8;
UPDATE Calisanlar SET Ad = 'Yeni Ad9', Telefon = '5559990111' WHERE CalisanID = 9;
UPDATE Calisanlar SET Ad = 'Yeni Ad10', Telefon = '5550011222' WHERE CalisanID = 10;



UPDATE Bakim SET BakimTarihi = '2023-02-10', Aciklama = 'Yýllýk bakým' WHERE BakimID = 1;
UPDATE Bakim SET Aciklama = 'Motor arýzasý giderildi' WHERE BakimID = 2;
UPDATE Bakim SET BakimTarihi = '2023-03-05', Aciklama = 'Genel bakým' WHERE BakimID = 3;
UPDATE Bakim SET Aciklama = 'Lastik basýncý kontrolü' WHERE BakimID = 4;
UPDATE Bakim SET BakimTarihi = '2023-04-10', Aciklama = 'Fren hidroliði deðiþimi' WHERE BakimID = 5;
UPDATE Bakim SET Aciklama = 'Yað filtresi deðiþimi' WHERE BakimID = 6;
UPDATE Bakim SET BakimTarihi = '2023-08-12', Aciklama = 'Jant temizliði' WHERE BakimID = 7;
UPDATE Bakim SET Aciklama = 'Far ampulü deðiþimi' WHERE BakimID = 8;
UPDATE Bakim SET BakimTarihi = '2023-08-22', Aciklama = 'Egzoz deðiþimi' WHERE BakimID = 9;
UPDATE Bakim SET BakimTarihi = '2023-08-28', Aciklama = 'Fren balatasý kontrolü' WHERE BakimID = 10;

UPDATE Sigorta SET PrimMiktari = 250.00 WHERE SigortaID = 11;
UPDATE Sigorta SET PrimMiktari = 250.00 WHERE SigortaID = 12;
UPDATE Sigorta SET PrimMiktari = 250.00 WHERE SigortaID = 13;
UPDATE Sigorta SET PrimMiktari = 250.00 WHERE SigortaID = 14;
UPDATE Sigorta SET PrimMiktari = 250.00 WHERE SigortaID = 15;
UPDATE Sigorta SET PrimMiktari = 250.00 WHERE SigortaID = 16;
UPDATE Sigorta SET PrimMiktari = 250.00 WHERE SigortaID = 17;
UPDATE Sigorta SET PrimMiktari = 250.00 WHERE SigortaID = 18;
UPDATE Sigorta SET PrimMiktari = 250.00 WHERE SigortaID = 19;
UPDATE Sigorta SET PrimMiktari = 250.00 WHERE SigortaID = 20;


DELETE FROM Musteriler WHERE MusteriID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

DELETE FROM Araclar WHERE AracID IN (11,12,13,14,15,16,17,18,19,20);

DELETE FROM Kiralama WHERE KiralamaID IN (11, 12, 13, 14, 15, 16, 17, 18, 19, 20);

DELETE FROM KiraDetay WHERE KiraDetayID IN (11, 12, 13, 14, 15, 16, 17, 18, 19, 20);

DELETE FROM Sube WHERE SubeID IN (11, 12, 13, 14, 15, 16, 17, 18, 19, 20);

DELETE FROM Calisanlar WHERE CalisanID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

DELETE FROM Bakim WHERE BakimID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

DELETE FROM Sigorta WHERE SigortaID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

SELECT COUNT(*) AS ToplamMusteriSayisi FROM Musteriler;
SELECT DISTINCT Adres FROM Musteriler;
SELECT MAX(MusteriID) AS EnBuyukID, MIN(MusteriID) AS EnKucukID FROM Musteriler WHERE Telefon LIKE '555%';
SELECT Adres, COUNT(*) AS MusteriSayisi FROM Musteriler GROUP BY Adres;
SELECT * FROM Musteriler ORDER BY Adres ASC;


SELECT CURDATE() AS CurrentDate;
SELECT CURRENT_TIMESTAMP AS CurrentDateTime;
SELECT TO_DATE('2023-01-01', 'YYYY-MM-DD') AS BaslangicTarihi,
       TO_DATE('2023-12-31', 'YYYY-MM-DD') AS BitisTarihi
FROM dual;
SELECT DATEADD(day, 7, GETDATE()) AS DateAfter7Days;
SELECT DATE_FORMAT(NOW(), '%d-%m-%Y') AS FormattedDate;


SELECT KiralamaID, MusteriID, AracID, BaslangicTarihi, BitisTarihi, (BitisTarihi - BaslangicTarihi) AS GunSayisi FROM Kiralama;
SELECT TO_CHAR(BaslangicTarihi, 'DD Mon YYYY') AS Baslangic, TO_CHAR(BitisTarihi, 'DD Mon YYYY') AS Bitis FROM Kiralama;
SELECT * FROM Kiralama WHERE BaslangicTarihi BETWEEN '2023-02-01' AND '2023-04-01';
SELECT SUM(ToplamTutar) AS ToplamTutar FROM Kiralama WHERE BaslangicTarihi BETWEEN '2023-04-01' AND '2023-06-01';
SELECT GETDATE() AS CurrentDateTime;


SELECT * FROM KiraDetay WHERE GunSayisi = 5;
SELECT CURRENT_TIMESTAMP AS CurrentDateTime;
SELECT * FROM KiraDetay WHERE ToplamTutar > 800.00;
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd HH:mm:ss') AS FormattedDateTime;
SELECT SUM(ToplamTutar) AS ToplamTutar FROM KiraDetay;



SELECT CURDATE() AS CurrentDate;
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') AS FormattedDateTime;
SELECT GETDATE() AS CurrentDateTime;
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd HH:mm:ss') AS FormattedDateTime;
SELECT CURRENT_DATE AS CurrentDate;
SELECT TO_CHAR(NOW(), 'YYYY-MM-DD HH:MI:SS') AS FormattedDateTime;


SELECT CURDATE() AS CurrentDate;
SELECT NOW() AS CurrentDateTime;
SELECT GETDATE() AS CurrentDateTime;
SELECT CURRENT_DATE AS CurrentDate;
SELECT CURRENT_TIMESTAMP AS CurrentDateTime;

SELECT CURDATE() AS CurrentDate;
SELECT NOW() AS CurrentDateTime;
SELECT GETDATE() AS CurrentDateTime;
SELECT CURRENT_DATE AS CurrentDate;
SELECT CURRENT_TIMESTAMP AS CurrentDateTime;


SELECT CURDATE() AS CurrentDate;
SELECT NOW() AS CurrentDateTime;
SELECT GETDATE() AS CurrentDateTime;
SELECT CURRENT_DATE AS CurrentDate;
SELECT CURRENT_TIMESTAMP AS CurrentDateTime;


SELECT Musteriler.Ad, Musteriler.Soyad, Kiralama.BaslangicTarihi, Kiralama.BitisTarihi
FROM Musteriler
INNER JOIN Kiralama ON Musteriler.MusteriID = Kiralama.MusteriID;

SELECT Araclar.Marka, Araclar.Model, Bakim.BakimTarihi, Bakim.Aciklama
FROM Araclar
LEFT JOIN Bakim ON Araclar.AracID = Bakim.AracID;

SELECT Sube.SubeAdi, Calisanlar.Ad, Calisanlar.Soyad
FROM Sube
INNER JOIN Calisanlar ON Sube.SubeID = Calisanlar.SubeID;




-- CREATE DATABASE TOKO_ONLINE;
-- use TOKO_ONLINE;
-- show databases;
-- drop database TOKO_ONLINE;

create table User( -- Angga
	Username varchar(50) not null,
    primary key(Username),
	No_telpon varchar(20),
	Nama varchar(50),
	Password varchar(15),
	Alamat varchar(100),
	Jenis_kelamin Char(2)
);

create table pembeli( -- Angga
	id_pembeli INTEGER,
    unique key(id_pembeli),
    Username varchar(50),
    primary key(Username),
	foreign key (Username)
	references User(Username)
);

create table penjual( -- Martvelino
	Username varchar(50),
    primary key(Username),
	id_penjual int,
    unique key(id_penjual),
	foreign key (Username) references
	User(Username)
);

CREATE TABLE Produk ( -- Dare
	ID_Produk INTEGER NOT NULL,
	PRIMARY KEY(ID_Produk),
	Nama_Produk VARCHAR(50),
	Stok_Awal INTEGER(255),
	Jumlah_Produk INTEGER,
	Laku INTEGER,
	Harga INTEGER
);

CREATE TABLE Penjual_has_Produk ( -- Hilmi
	id_penjual INTEGER,
	id_produk INTEGER,
	Username VARCHAR(50),
    foreign key(Username) references User(Username),
	FOREIGN KEY(id_penjual) REFERENCES penjual(id_penjual),
	FOREIGN KEY(id_produk) REFERENCES Produk(id_produk)
);



CREATE TABLE Pembeli_has_Produk ( -- Dare
	id_pembeli INTEGER,
	id_produk INTEGER,
	Username VARCHAR(50),
	FOREIGN KEY(id_pembeli) REFERENCES pembeli(id_pembeli),
	FOREIGN KEY(id_produk) REFERENCES Produk(id_produk),
    foreign key(Username) references User(Username)
);

CREATE TABLE Toko ( -- HILMI
	id_toko INTEGER NOT NULL,
	PRIMARY KEY(id_toko),
	Username VARCHAR(50),
	id_penjual INTEGER,
	FOREIGN KEY(Username) REFERENCES penjual(Username),
	FOREIGN KEY(id_penjual) REFERENCES penjual(id_penjual),
	Nama VARCHAR(50),
	Alamat VARCHAR(100),
	No_Telpon VARCHAR(20)
);


CREATE TABLE Toko_has_Produk ( -- Hilmi
	ID_Toko INTEGER,
	ID_Produk INTEGER,
	FOREIGN KEY(ID_Toko) REFERENCES Toko(ID_Toko),
	FOREIGN KEY(ID_Produk) REFERENCES Produk(ID_Produk)
);

create table pembayaran( -- Martvelino
	id_pembayaran int,
    primary key(id_pembayaran),
	pembeli_user_username varchar(50),
	pembeli_id_pembeli int,
	total_pembayaran int,
	tanggal_pembayaran date
);

create table tunai( -- Ajeng
	 id_pembayaran int,
	 foreign key (id_pembayaran) references pembayaran(id_pembayaran),
	 jumlah_uang int
);

create table kredit( -- Ajeng
	 id_pembayaran int,
	 foreign key (id_pembayaran) references pembayaran(id_pembayaran),
	 nomor_kartu_kredit varchar(50) unique key
);

create table e_money( -- Ajeng
	 id_pembayaran int,
	 foreign key (id_pembayaran) references pembayaran(id_pembayaran),
	 nomor_pelanggan varchar(50) unique key
);

insert into Toko (id_toko, Username, id_penjual, Nama, Alamat, No_Telpon)
values (1, 'fathiabrnsa', 9, 'keripik.id', 'jl bukit bunga, genteng, surabaya', '081788999789'),
	   (2, 'cakaradh', 2, 'sayur.id', 'jl pondoh indah, sawahan, yogyakarta', '082678556778'),
       (3, 'mgennad0', 5, 'wearme.id', 'jl dekat nadi, lakarsantri, tulungagung','085778998665'),
       (4, 'calistazlf', 7, 'pijakanmu.id', 'jl terusan kenanga, gayungan, kediri', '085674435556'),
       (5, 'afrareyy3', 6, 'kebutuhanmu.id', 'jl anak bunga, wiyung, tuban', '087789889550');
	
select * from Toko;
       
insert into Penjual_has_Produk (id_penjual, id_produk, Username)
values 	(9,1, 'fathiabrnsa'),
		(2,2, 'cakaradh'),
        (5,3, 'mgennad0'),
        (7,4, 'calistazlf'),
        (6,5, 'afrareyy3');
select * from Penjual_has_Produk;
        
insert into Toko_has_Produk(id_Toko, id_Produk)
values	(1,1),(1,2),(1,3),
		(2,4),(2,5),(2,6),
        (3,7),(3,8),(3,9),
        (4,10),(4,11),(4,12);
select * from Toko_has_Produk;
        
insert into User(Username, No_telpon, Nama, Password, Alamat, Jenis_kelamin)
values 	('a.fathian_', '085678452289', 'Aftbah Fathian', 'akufathian', 'Jl kenanga bunga no 4, sukamaju, malang', 'Lk'),
		('cakaradh', '087905433111', 'Caka Radhitya', 'inicaka', 'Jl danau kenanga no 11, sukasuka, madiun', 'Lk'),
        ('Jazmindra', '081127865990','Jazmi Kalandra' ,'jazmijazmi' ,'jl bunga asoka no 1, mulyorejo, surabaya', 'Lk'),
        ('luthfisqy2', '085663554612','Luthfi Rafisqy' ,'luthfi2' ,'jl bukit danau no 11, deron, jakarta', 'Lk'),
        ('mgennad0', '087897564342','Mikhail Gennadi' ,'mikhaka' ,'jl teluk indah no 2, blimbing, magetan', 'Lk'),
        ('afrareyy3', '081668553776','Afra Rainey' ,'afrage' ,'jl hore no 8, kedungkandang, blitar', 'Pr'),
        ('calistazlf', '085669007870','Calista Zalfa ' ,'calistacal' ,'jl taman anak, multimulyo, kediri', 'Pr'),
        ('denadaprmdh', '087398760186','Denada Parmadita ' ,'denaad' ,'jl anak raja, sukorejo, yogyakarta', 'Pr'),
        ('fathiabrnsa', '081007998563','Fathia Bernessa' ,'nessaber' ,'jl cilele, ciledug, cianjur', 'Pr'),
        ('inarakaaa', '082786998445','Inara Kalea' ,'ininara' ,'jl dekat jauh, tulusrejo, lamongan', 'Pr');

select * from User;
drop table User;

insert into tunai
values 	(1, 15000),
		(4, 20000);
        
insert into kredit
values (2, 30000);

insert into e_money
values (3, '6080085663554612'),		
		(5, '6080082786998445');
        
insert into Produk
values 	(1, 'keripik pisang', 70, (Stok_Awal - Laku), 20, 19000),
 	 	(2, 'keripik nangka', 50, (Stok_Awal - Laku), 20, 15000),
		(3, 'keripik semangka', 50, (Stok_Awal - Laku), 30, 13000),
 		(4, 'wortel', 40, (Stok_Awal - Laku), 10, 15000),
 		(5, 'toge', 50, (Stok_Awal - Laku), 25, 10000),
 		(6, 'bawang merah', 50, (Stok_Awal - Laku), 40, 20000),
 		(7, 'rok serut', 25, (Stok_Awal - Laku), 10, 45000),
		(8, 'kemeja balon', 25, (Stok_Awal - Laku), 14, 55000),
 		(9, 'kaos pendek', 25,(Stok_Awal - Laku), 18, 30000),
 		(10, 'sendal jepit', 50, (Stok_Awal - Laku), 20, 25000),
 		(11, 'sendal slop', 25, (Stok_Awal - Laku), 25, 30000),
 		(12, 'sepatu sneakers', 50, (Stok_Awal - Laku), 40, 70000);
        
select * from Produk;

insert into Pembeli_has_Produk
values 	(1,1,'a.fathian_'),
		(3,2,'Jazmindra'),
		(4,3,'luthfisqy2'),
        (8,4,'denadaprmdh'),
        (10,5,'inarakaaa');
        
select * from Pembeli_has_Produk;
        
insert into penjual (id_penjual,Username)
values 	(2,'cakaradh'),
		(5,'mgennad0'),
		(6,'afrareyy3'),
		(7,'calistazlf'),
		(9,'fathiabrnsa');
select * from penjual;
        

    
insert into pembayaran
values (1,'a.fathian_',1,15000,'2022-01-01'),
	(2,'Jazmindra',3,30000,'2022-12-12'),
    (3,'luthfisqy2',4,20000,'2022-11-11'),
    (4,'denadaprmdh',8,20000,'2022-08-08'),
    (5,'inarakaaa',10,45000,'2022-03-03');
    
select * from pembayaran;
    
insert into pembeli
values  (1, 'a.fathian_'),
		(3, 'Jazmindra'),
        (4, 'luthfisqy2'),
        (8, 'denadaprmdh'),
        (10, 'inarakaaa');
        

        
select * from pembeli;
	
use TOKO_ONLINE;

create view PemilikToko as
select penjual.Username, Toko.Nama
from penjual
right join Toko
on penjual.id_penjual = Toko.id_penjual;
-- TOKO DAN NAMA PENJUAL TOKO

create view StokSekarang as
select Nama_Produk, (Stok_Awal - Laku) as Stok
from Produk;
-- STOK YANG TERSEDIA SEKARANG

create view Product_lowDemand as
select Nama_Produk, Laku
from Produk
where Laku = (select min(Laku) from Produk);
-- PRODUK  LOW DEMAND

create view Product_highDemand as
select Nama_Produk, Laku
from Produk
where Laku = (select max(Laku) from Produk);

select * from Pembeli_has_Produk;

create view Jualan as
select Nama, Penjual_has_Produk.id_produk, Produk.Nama_Produk
from User 
right join Penjual_has_Produk
on Penjual_has_Produk.Username = User.Username
left join Produk
on Produk.id_Produk = Penjual_has_Produk.id_produk;

create view EtalaseToko as 
select Toko.nama, Produk.Nama_Produk
from Toko_has_Produk join Toko join Produk
where Toko_has_Produk.ID_Produk = Produk.id_produk and Toko_has_Produk.ID_Toko = Toko.id_Toko;

show tables;
select * from pembayaran;
select * from tunai;
select * from pembeli;
select * from kredit;
select * from e_money;
select * from pembayaran;
select * from penjual;
select * from pembeli;
select * from Pembeli_has_Produk;
select * from Penjual_has_Produk;
select * from Toko;
select * from Toko_has_Produk;
select * from Produk;

update Produk 
set Jumlah_Produk = Stok_Awal - Laku
where ID_Produk <= 12;

select id_pembayaran as 'ID Pembayaran', pembeli_user_username as Username, 
case when total_pembayaran >= total_harga then "Lunas"
	 when total_pembayaran = 0 then "Belum dibayar"
	 when total_pembayaran < total_harga and total_pembayaran > 0 then "Dibayar sebagian"
	 else "ERROR INPUT"
	 end as "Status Pembayaran"
from pembayaran;

insert into pembayaran
value(6, 'a.fathian_', 1, -10000, '2000-01-02', 3, 5, 350000);

update pembayaran
set total_pembayaran = 0
where id_pembayaran = 5;

select * from pembayaran; 

create view Status_Produk as
select Nama_Produk, if(Stok_Awal - Laku > 0, "Stok Tersedia", "Stok Habis") as Ketersediaan
from Produk;

alter table penjual
drop column user_username;

alter table pembayaran
drop column IDbarang_dibeli,
drop column jumlah_barang;

select * from pembayaran;

alter table pembayaran
add column IDbarang_dibeli integer, 
add column jumlah_barang integer,
add unique (IDbarang_dibeli);

alter table pembayaran
add column total_harga integer;

update pembayaran
set IDbarang_dibeli = 2, jumlah_barang = 2, total_harga = 30000
where id_pembayaran = 1;

update pembayaran
set IDbarang_dibeli = 4, jumlah_barang = 1, total_harga = 15000
where id_pembayaran = 2;

update pembayaran
set IDbarang_dibeli = 9, jumlah_barang = 3, total_harga = 90000
where id_pembayaran = 3;

update pembayaran
set IDbarang_dibeli = 11, jumlah_barang = 1, total_harga = 30000
where id_pembayaran = 4;

update pembayaran
set IDbarang_dibeli = 12, jumlah_barang = 1, total_harga = 70000
where id_pembayaran = 5;

select * from pembayaran;
select * from Produk; 

create view Riwayat_Pembelian as
select id_pembayaran as 'ID Pembayaran', pembeli_user_username as Username, IDbarang_dibeli as "ID Barang", 
jumlah_barang as "Jumlah dibeli", Jumlah_Produk as "Jumlah awal", 
if((Jumlah_Produk - jumlah_barang) > 0, (Jumlah_Produk - jumlah_barang), "Produk Tidak Tersedia") as "Sisa Produk"
from pembayaran join Produk
where IDbarang_dibeli = ID_Produk;

create view Status_Produk as
select Nama_Produk, if(Stok_Awal - Laku > 0, "Stok Tersedia", "Stok Habis") as Ketersediaan
from Produk;

insert into pembayaran
value(7, 'a.fathian_', 1, 15000, '2022-01-01', 1, 1, 19000);

insert into pembayaran
value(8, 'Jazmindra', 3, 15000, '2022-12-12', 5, 1, 10000),
	 (9, 'Jazmindra', 3, 40000, '2022-12-12', 6, 5, 20000);
     
insert into pembayaran
value(10, 'denadaprmdh', 8, 30000, '2022-08-08', 1, 1, 30000),
	 (11, 'Jazmindra', 3, 40000, '2022-12-12', 3, 5, 1000000);
     
ALTER TABLE pembayaran DROP INDEX IDbarang_dibeli;

select * from pembayaran
order by total_harga;

select pembeli_user_username as Pembeli, count(pembeli_user_username) as 'Intensitas Pembeli'
from pembayaran
group by pembeli_id_pembeli
order by count(pembeli_user_username) desc;



select ID_Toko, sum(Laku * Harga) as "Penghasilan Toko"
from Toko_has_Produk join Produk
where Produk.ID_Produk = Toko_has_Produk.ID_Produk
group by ID_Toko;

select * from Toko;
select * from Toko_has_Produk;
select * from Produk;

show tables;
update kredit
set nomor_kartu_kredit = 012938193
where id_pembayaran = 2;

insert into kredit
value(8, 1283912089),
	 (9, 1209312393);

insert into tunai
value(4, 30000);

select * from kredit;
select * from tunai;
select * from e_money;

select "Kredit" as "Metode Pembayaran" , count(*) as Jumlah from kredit;
select "Tunai" as "Metode Pembayaran" , count(*) as Jumlah from tunai;
select "E-Money" as "Metode Pembayaran" , count(*) as Jumlah from e_money;

select Jenis_kelamin as Gender, count(Jenis_Kelamin) as Jumlah
from User
group by Jenis_kelamin;

select * from pembayaran;



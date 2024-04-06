CREATE DATABASE perpustakaan1;
-- Database: perpustakaan

use perpustakaan1;
CREATE TABLE anggota (
  id_anggota int(11) NOT NULL,
  nama_anggota varchar(100) NOT NULL,
  jk_anggota char(1) NOT NULL,
  jurusan_anggota varchar(2) NOT NULL,
  no_telp_anggota varchar(13) NOT NULL,
  alamat_anggota varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE buku (
  id_buku int(11) NOT NULL,
  judul_buku varchar(50) NOT NULL,
  penulis_buku varchar(50) NOT NULL,
  penerbit_buku varchar(50) NOT NULL,
  tahun_penerbit char(4) NOT NULL,
  stok int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE peminjaman (
  id_peminjaman int(11) NOT NULL,
  tanggal_pinjam date NOT NULL,
  tanggal_kembali date NOT NULL,
  id_buku int(11) NOT NULL,
  id_anggota int(11) NOT NULL,
  id_petugas int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE pengembalian (
  id_pengembalian int(11) NOT NULL,
  tanggal_pengembalian date NOT NULL,
  denda int(11) NOT NULL,
  id_buku int(11) NOT NULL,
  id_anggota int(11) NOT NULL,
  id_petugas int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE petugas (
  id_petugas int(11) NOT NULL,
  nama_petugas varchar(50) NOT NULL,
  jabatan_petugas varchar(50) NOT NULL,
  no_telp_petugas char(13) NOT NULL,
  alamat_petugas varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE rak (
  id_rak int(11) NOT NULL,
  nama_rak varchar(50) NOT NULL,
  lokasi_rak varchar(50) NOT NULL,
  id_buku int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE anggota
  ADD PRIMARY KEY (id_anggota);

ALTER TABLE buku
  ADD PRIMARY KEY (id_buku);

ALTER TABLE peminjaman
  ADD PRIMARY KEY (id_peminjaman),
  ADD KEY id_buku (id_buku),
  ADD KEY id_anggota (id_anggota),
  ADD KEY id_petugas (id_petugas);

ALTER TABLE pengembalian
  ADD PRIMARY KEY (id_pengembalian),
  ADD KEY id_petugas (id_petugas),
  ADD KEY id_anggota (id_anggota),
  ADD KEY id_buku (id_buku);

ALTER TABLE petugas
  ADD PRIMARY KEY (id_petugas);

ALTER TABLE rak
  ADD PRIMARY KEY (id_rak),
  ADD KEY id_buku (id_buku);

ALTER TABLE anggota
  MODIFY id_anggota int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE buku
  MODIFY id_buku int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE peminjaman
  MODIFY id_peminjaman int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE petugas
  MODIFY id_petugas int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE rak
  MODIFY id_rak int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE peminjaman
  ADD CONSTRAINT peminjaman_ibfk_1 FOREIGN KEY (id_buku) REFERENCES buku (id_buku),
  ADD CONSTRAINT peminjaman_ibfk_2 FOREIGN KEY (id_petugas) REFERENCES petugas (id_petugas),
  ADD CONSTRAINT peminjaman_ibfk_3 FOREIGN KEY (id_anggota) REFERENCES anggota (id_anggota);

ALTER TABLE pengembalian
  ADD CONSTRAINT pengembalian_ibfk_1 FOREIGN KEY (id_buku) REFERENCES buku (id_buku),
  ADD CONSTRAINT pengembalian_ibfk_2 FOREIGN KEY (id_petugas) REFERENCES petugas (id_petugas),
  ADD CONSTRAINT pengembalian_ibfk_3 FOREIGN KEY (id_anggota) REFERENCES anggota (id_anggota);

ALTER TABLE rak
  ADD CONSTRAINT rak_ibfk_1 FOREIGN KEY (id_buku) REFERENCES buku (id_buku);

INSERT INTO anggota (id_anggota, nama_anggota, jk_anggota, jurusan_anggota, no_telp_anggota, alamat_anggota) 
VALUES
(022048,  'Nels', 'P', 'Farmasi Lanjut', '1234567890', 'muko-muko'),
(022062, 'Akbar Agpranata', 'L', 'Bahasa dan Sastra', '0987654321', 'bengkulu'),
(022034, 'Apek', 'L', 'Arsitektur', '9876543210', 'bengkulu'),
(022054,  'Alex', 'P', 'Ilmu Kelautan', '0123456789', 'Kepahiang'),
(022055,  'Arie Pramana', 'L', 'Kedokteran', '5678901234', 'Rejang Lebong');

INSERT INTO buku (id_buku, judul_buku, penulis_buku, penerbit_buku, tahun_penerbit, stok) 
VALUES
(1,  'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', 65),
(2,  'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', 50),
(3,  'Tetralogi Pulau Buru', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1981-1988', 40),
(4,  'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Penerbit Republika', '2004', 60),
(5,  'Ronggeng Dukuh Paruk', 'Ahmad Tohari', 'Hasta Mitra', '1982', 55),
(6,'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2008', 70),
(7, 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2006', 45),
(8, 'Rindu', 'Tere Liye', 'Gramedia Pustaka Utama', '2013', 55),
(9, 'Matahari', 'Tere Liye', 'Gramedia Pustaka Utama', '2014', 60),
(10, '5cm', 'Donny Dhirgantoro', 'Grasindo', '2005', 50),
(11, 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', '2009', 65),
(12, 'Tenggelamnya Kapal Van Der Wijck', 'Hamka', 'Pustaka Nasional', '1938', 30),
(13, 'Padang Bulan', 'Andrea Hirata', 'Bentang Pustaka', '2005', 40),
(14, 'Dilan: Dia adalah Dilanku Tahun 1990', 'Pidi Baiq', 'Penerbit Dar! Mizan', '2014', 75),
(15, 'Raden Mandasia Si Pencuri Daging Sapi', 'YB Mangunwijaya', 'Dian Rakyat', '1986', 35);

INSERT INTO petugas (id_petugas, nama_petugas, jabatan_petugas, no_telp_petugas, alamat_petugas) 
VALUES
(1, 'John Doe', 'Librarian', '1234567890123', '123 Main St, City'),
(2, 'Jane Smith', 'Assistant Librarian', '9876543210987', '456 Elm St, Town'),
(3, 'Michael Johnson', 'Library Clerk', '4567890123456', '789 Oak St, Village'),
(4, 'Emily Brown', 'Library Technician', '3456789012345', '101 Pine St, County'),
(5, 'David Lee', 'Cataloger', '2345678901234', '246 Maple St, Country');

INSERT INTO peminjaman (id_peminjaman, tanggal_pinjam, tanggal_kembali, id_buku, id_anggota, id_petugas) 
VALUES
(1, '2024-04-01', '2024-04-15', 5, 022048, 1),
(2, '2024-04-02', '2024-04-16', 11, 022062, 2),
(3, '2024-04-03', '2024-04-17', 4, 022034, 1),
(4, '2024-04-04', '2024-04-18', 13, 022062, 3),
(5, '2024-04-05', '2024-04-19', 15, 022048, 2);

INSERT INTO pengembalian (id_pengembalian, tanggal_pengembalian, denda, id_buku, id_anggota, id_petugas) 
VALUES
(1, '2024-04-15', 5000, 5, 022048, 1),
(2, '2024-04-16', 0, 11, 022062, 2),
(3, '2024-04-17', 0, 4, 022034, 1),
(4, '2024-04-18', 10000, 13, 022062, 3),
(5, '2024-04-19', 0, 15, 022048, 2);

INSERT INTO rak (id_rak, nama_rak, lokasi_rak, id_buku) 
VALUES
(1, 'Rak Ki Hajar Dewantara', 'Lantai 1', 1),
(2, 'Rak Tut Wuri Handayani', 'Lantai 2', 2),
(3, 'Rak Radar Bengkulu', 'Lantai 3', 3),
(4, 'Rak WARTA UNIB', 'Lantai 4', 4),
(5, 'Rak Majalah Indonesia', 'Lantai 5', 5),
(6, 'Rak Jurnal', 'Lantai 1', 6),
(7, 'Rak Cerita Pendek', 'Lantai 2', 7),
(8, 'Rak Skripsi', 'Lantai 3', 8),
(9, 'Rak Sarjana Muda', 'Lantai 4', 9),
(10, 'Rak Mahasiswa', 'Lantai 5', 10),
(11, 'Rak Abadi', 'Lantai 1', 11),
(12, 'Rak Demonstrasi', 'Lantai 2', 12),
(13, 'Rak Teknik', 'Lantai 3', 13),
(14, 'Rak Hukum', 'Lantai 4', 14),
(15, 'Rak Pertanian', 'Lantai 5', 15);

-- Awal Join
SELECT buku.id_buku, buku.judul_buku, buku.penulis_buku, buku.penerbit_buku, buku.tahun_penerbit, buku.stok,
       rak.id_rak, rak.nama_rak, rak.lokasi_rak
FROM buku
INNER JOIN rak ON buku.id_buku = rak.id_buku;

SELECT buku.judul_buku, buku.penulis_buku, rak.nama_rak, rak.lokasi_rak
FROM buku
LEFT JOIN rak ON buku.id_buku = rak.id_buku;

SELECT buku.judul_buku, buku.penulis_buku, rak.nama_rak, rak.lokasi_rak
FROM buku
RIGHT JOIN rak ON buku.id_buku = rak.id_buku;

-- Akhir Join

-- Nested Query
SELECT buku.judul_buku, buku.penulis_buku
FROM buku
WHERE buku.id_buku IN (
    SELECT rak.id_buku
    FROM rak
    WHERE rak.nama_rak = 'Rak Majalah Indonesia'
);
-- Akhir Nested Query


-- Stored Procedure
DELIMITER //

CREATE PROCEDURE InputPeminjaman(
    IN p_id_peminjaman INT,
    IN p_tanggal_pinjam DATE,
    IN p_tanggal_kembali DATE,
    IN p_id_buku INT,
    IN p_id_anggota INT,
    IN p_id_petugas INT
)
BEGIN
    INSERT INTO peminjaman (id_peminjaman, tanggal_pinjam, tanggal_kembali, id_buku, id_anggota, id_petugas)
    VALUES (p_id_peminjaman, p_tanggal_pinjam, p_tanggal_kembali, p_id_buku, p_id_anggota, p_id_petugas);
END//

CREATE PROCEDURE InputPengembalian(
    IN p_id_pengembalian INT,
    IN p_tanggal_pengembalian DATE,
    IN p_denda INT,
    IN p_id_buku INT,
    IN p_id_anggota INT,
    IN p_id_petugas INT
)
BEGIN
    INSERT INTO pengembalian (id_pengembalian, tanggal_pengembalian, denda, id_buku, id_anggota, id_petugas)
    VALUES (p_id_pengembalian, p_tanggal_pengembalian, p_denda, p_id_buku, p_id_anggota, p_id_petugas);
END//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE update_rak(
    IN p_id_rak INT,
    IN p_nama_rak VARCHAR(255),
    IN p_lokasi_rak VARCHAR(255),
    IN p_id_buku INT
)
BEGIN
    UPDATE rak
    SET nama_rak = p_nama_rak,
        lokasi_rak = p_lokasi_rak,
        id_buku = p_id_buku
    WHERE id_rak = p_id_rak;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE delete_rak(
    IN p_id_rak INT
)
BEGIN
    DELETE FROM rak
    WHERE id_rak = p_id_rak;
END //

DELIMITER ;

-- Akhir Stored Procedure


-- Pemanggilan Procedure
CALL InputPeminjaman(6, '2024-04-05', '2024-04-19', 15, 022048, 2);

CALL InputPengembalian(6, '2024-04-15', 0, 1, 022034, 1);

CALL update_rak(1, 'Rak Kelompok1', 'Lantai 7', 3);

CALL delete_rak(1);
-- Akhir Pemanggilan Procedure

-- Data Control Language
CREATE USER 'pok5'@'localhost' IDENTIFIED BY 'pok5_alex';

GRANT SELECT ON perpustakaan1.* TO 'pok5'@'localhost';

REVOKE SELECT ON perpustakaan1.* FROM 'pok5'@'localhost';
-- Akhir Data Control Language

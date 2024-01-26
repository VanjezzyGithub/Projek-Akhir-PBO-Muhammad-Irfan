-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jan 2024 pada 23.25
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_uas_laundry_muhammadirfan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `username`, `password`) VALUES
(1, 'Muhammad Irfan', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cucian`
--

CREATE TABLE `cucian` (
  `id_cucian` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `tanggal_masuk` varchar(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `statuspembayaran` varchar(30) NOT NULL,
  `statustransaksi` varchar(30) NOT NULL,
  `tanggal_keluar` varchar(20) DEFAULT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `cucian`
--

INSERT INTO `cucian` (`id_cucian`, `berat`, `tanggal_masuk`, `harga`, `statuspembayaran`, `statustransaksi`, `tanggal_keluar`, `id_pelanggan`, `id_admin`) VALUES
(2, 1, '20/11/2018', 5000, 'Belum Lunas', 'On Process', NULL, 1, 1),
(3, 1, '24/01/2024', 5000, 'Lunas', 'Selesai', '25/01/2024', 2, 1),
(4, 4, '24/11/2024', 20000, 'Lunas', 'Selesai', '25/11/2024', 3, 1),
(5, 3, '26/01/2024', 15000, 'Lunas', 'Selesai', '27/01/2024', 10, 1),
(6, 5, '26/01/2024', 25000, 'Lunas', 'Selesai', '27/01/2024', 11, 1),
(7, 5, '26/01/2024', 25000, 'Lunas', 'Selesai', '27/01/2024', 12, 1),
(8, 5, '26/01/2024', 25000, 'Lunas', 'Selesai', '27/01/2024', 13, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `alamat_pelanggan` varchar(50) NOT NULL,
  `nomer_hp` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `nomer_hp`, `jenis_kelamin`) VALUES
(1, 'Novra Irvan', 'Jl. Parak Pisang', '081276500123', 'Laki-Laki'),
(2, 'Alfian Salim', 'Jl. Parak Gadang', '085325633101', 'Laki-Laki'),
(3, 'Diva Cisco', 'Jl. Jati Nangor', '081276500321', 'Laki-Laki'),
(4, 'Riski Putra', 'Jl. Pasar Baru', '085325642101', 'Laki-Laki'),
(9, 'Wildan Jaya', 'Jl. Gunung Pengilun', '081276400329', 'Laki-Laki'),
(10, 'Putri Rahayu', 'Jl. Parak Laweh', '081276599021', 'Perempuan'),
(11, 'Wardoni', 'Jl. Parak Gadang', '081266128798', 'Laki-Laki'),
(12, 'Soimah', 'Jl. Pasar Baru', '081267654734', 'Perempuan'),
(13, 'Wardoni', 'Jl. Parak Gadang', '081266128798', 'Laki-Laki');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `cucian`
--
ALTER TABLE `cucian`
  ADD PRIMARY KEY (`id_cucian`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `cucian`
--
ALTER TABLE `cucian`
  MODIFY `id_cucian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cucian`
--
ALTER TABLE `cucian`
  ADD CONSTRAINT `cucian_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cucian_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

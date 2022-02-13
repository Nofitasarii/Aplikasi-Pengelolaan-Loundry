-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Feb 2022 pada 03.26
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zerolaundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_transaksi`
--

CREATE TABLE `tb_detail_transaksi` (
  `id_detail_transaksi` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` double NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_member`
--

CREATE TABLE `tb_member` (
  `id_member` int(11) NOT NULL,
  `nama_member` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `tlp` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_member`
--

INSERT INTO `tb_member` (`id_member`, `nama_member`, `alamat`, `jenis_kelamin`, `tlp`) VALUES
(28, 'Thomas', 'Gunung Badag', 'Perempuan', '098562736712'),
(31, 'Aceng', 'Munjul', 'Laki-Laki', '098562736712'),
(32, 'Asep', 'Munjul', 'Laki-Laki', '098562736712'),
(33, 'Ilham God', 'Munjul', 'Perempuan', '098562736712'),
(41, 'Nanang', 'Bogor', 'Laki-Laki', '089655189349'),
(42, 'Baba', 'Bandung', 'Perempuan', '08135013'),
(43, 'Bilek', 'Padang', 'Perempuan', '012704012'),
(44, 'Mamank', 'Bekasi', 'Perempuan', '018278041'),
(45, 'Katak Bizher', 'Jakarta', 'Perempuan', '01973412'),
(46, 'Gusti', 'Bandung', 'Laki-Laki', '01787841532'),
(47, 'Rehan Wangsaff', 'Bogor', 'Laki-Laki', '55646563733'),
(49, 'GON', 'Bandung', 'Laki-Laki', '934619364653'),
(50, 'Raja Satir', 'Medan', 'Perempuan', '1023748107'),
(51, 'Udin', 'Bandung', 'Laki-Laki', '912849123'),
(52, 'Xie njie', 'China', 'Perempuan', '0172401241');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_outlet`
--

CREATE TABLE `tb_outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama_outlet` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `tlp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_outlet`
--

INSERT INTO `tb_outlet` (`id_outlet`, `nama_outlet`, `alamat`, `tlp`) VALUES
(1, 'Laundry Suka Maju Mundur', 'Manggahang', '089655758386'),
(2, 'Laundry Sari Mekar', 'Pasar Rabu', '098562736712'),
(3, 'Laundry Jaya Abadi', 'Bekasi', '098562736712'),
(4, 'Washingless Laundry', 'Jeroan Manggang', '098562736712');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_paket`
--

CREATE TABLE `tb_paket` (
  `id_paket` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `jenis` enum('Kiloan','Satuan') NOT NULL,
  `nama_paket` text NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_paket`
--

INSERT INTO `tb_paket` (`id_paket`, `id_outlet`, `jenis`, `nama_paket`, `harga`) VALUES
(1, 3, 'Satuan', 'Cuci Lambat', 30000),
(2, 2, 'Kiloan', 'Cuci Cepat', 40000),
(4, 2, 'Kiloan', 'Nyantu', 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `kode_invoice` varchar(100) NOT NULL,
  `id_member` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `tgl_bayar` date NOT NULL,
  `biaya_tambahan` int(11) NOT NULL,
  `diskon` int(11) NOT NULL,
  `status` enum('baru','proses','selesai','diambil') NOT NULL,
  `id_user` int(11) NOT NULL,
  `total_harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id`, `id_outlet`, `kode_invoice`, `id_member`, `id_paket`, `tgl`, `tgl_bayar`, `biaya_tambahan`, `diskon`, `status`, `id_user`, `total_harga`) VALUES
(52, 2, 'INVC-9094388411', 49, 4, '2022-02-12', '2022-02-13', 10000, 10, 'diambil', 3, 36000),
(53, 2, 'INVC-5263277502', 50, 2, '2022-02-12', '2022-02-13', 20000, 5, 'baru', 8, 57000),
(54, 1, 'INVC-3684910881', 51, 2, '2022-02-13', '2022-02-13', 0, 0, 'diambil', 6, 40000),
(55, 1, 'INVC-6056631582', 52, 2, '2022-02-13', '2022-02-13', 10000, 5, 'diambil', 6, 47500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `role` enum('Admin','Owner','Kasir') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama`, `username`, `password`, `id_outlet`, `role`) VALUES
(3, 'Yosel', 'admin', '21232f297a57a5a743894a0e4a801fc3', 2, 'Admin'),
(6, 'windah', 'windah', 'd64bbae37412587ff6e42585a3d72dd2', 1, 'Kasir'),
(8, 'Rehan Wangsaff', 'kasir', 'c7911af3adbd12a035b289556d96470a', 3, 'Kasir'),
(9, 'Ayonima', 'owner', '72122ce96bfec66e2396d2e25225d70a', 4, 'Owner');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  ADD PRIMARY KEY (`id_detail_transaksi`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indeks untuk tabel `tb_member`
--
ALTER TABLE `tb_member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `tb_outlet`
--
ALTER TABLE `tb_outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indeks untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD PRIMARY KEY (`id_paket`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relasi member dengan transaksi` (`id_member`),
  ADD KEY `relasi user dengan transaksi` (`id_user`),
  ADD KEY `id_outlet` (`id_outlet`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  MODIFY `id_detail_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_member`
--
ALTER TABLE `tb_member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `tb_outlet`
--
ALTER TABLE `tb_outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  ADD CONSTRAINT `tb_detail_transaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `tb_transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_detail_transaksi_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `tb_paket` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD CONSTRAINT `tb_paket_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id_outlet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `relasi member dengan transaksi` FOREIGN KEY (`id_member`) REFERENCES `tb_member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi user dengan transaksi` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_transaksi_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id_outlet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_transaksi_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `tb_paket` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id_outlet`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

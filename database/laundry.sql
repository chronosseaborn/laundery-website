/*
 Navicat Premium Dump SQL

 Source Server         : ramon
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : laundry

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 14/08/2024 07:49:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jpakaian
-- ----------------------------
DROP TABLE IF EXISTS `jpakaian`;
CREATE TABLE `jpakaian`  (
  `id_jpakaian` int NOT NULL AUTO_INCREMENT,
  `jenis_pakaian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` int NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `delete_by` int NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_jpakaian`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jpakaian
-- ----------------------------
INSERT INTO `jpakaian` VALUES (1, 'Baju Lengan Panjang', NULL, 1, NULL, NULL, '2024-07-31 09:32:43', NULL);
INSERT INTO `jpakaian` VALUES (2, 'Celana', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jpakaian` VALUES (3, 'Celana Dalam', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jpakaian` VALUES (8, 'leather jacket', 1, 3, NULL, '2024-08-06 13:20:07', '2024-08-06 13:26:38', NULL);
INSERT INTO `jpakaian` VALUES (9, 'selimut', 1, NULL, NULL, '2024-08-12 13:05:39', NULL, NULL);

-- ----------------------------
-- Table structure for jpelayanan
-- ----------------------------
DROP TABLE IF EXISTS `jpelayanan`;
CREATE TABLE `jpelayanan`  (
  `id_jpelayanan` int NOT NULL AUTO_INCREMENT,
  `jenis_pelayanan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_by` int NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `deleted_by` int NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_jpelayanan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jpelayanan
-- ----------------------------
INSERT INTO `jpelayanan` VALUES (1, 'Cuci Basah', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jpelayanan` VALUES (2, 'Cuci Kering', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jpelayanan` VALUES (3, 'Cuci Basah + Setrika', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jpelayanan` VALUES (4, 'Setrika', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jpelayanan` VALUES (5, 'Cuci Kering + Setrika', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jpelayanan` VALUES (7, 'Cuci Kering Setengah Matang', 1, 1, NULL, '2024-07-31 09:29:00', '2024-07-31 09:29:39', NULL);
INSERT INTO `jpelayanan` VALUES (9, 'full wash', 1, NULL, NULL, '2024-08-06 13:20:34', NULL, NULL);
INSERT INTO `jpelayanan` VALUES (10, 'complete set', 1, NULL, NULL, '2024-08-12 13:06:01', NULL, NULL);

-- ----------------------------
-- Table structure for pemesanan
-- ----------------------------
DROP TABLE IF EXISTS `pemesanan`;
CREATE TABLE `pemesanan`  (
  `id_pemesanan` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `id_jpakaian` int NULL DEFAULT NULL,
  `berat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga` int NULL DEFAULT NULL,
  `id_jpelayanan` int NULL DEFAULT NULL,
  `status` enum('DiKerjakan','DiAntar','Selesai') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kode_pemesanan` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` int NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `deleted_by` int NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `tipe` enum('Antar & Bayar Nanti','Pickup & Bayar Nanti','Antar & Bayar Langsung','Pickup & Bayar Langsung') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pemesanan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pemesanan
-- ----------------------------
INSERT INTO `pemesanan` VALUES (2, 2, 2, '1kg', 20000, 2, 'Selesai', 'PS00000002', NULL, 1, NULL, NULL, '2024-08-04 19:06:50', NULL, 'Antar & Bayar Nanti');
INSERT INTO `pemesanan` VALUES (28, 8, 3, '10kg', 250000, 5, 'Selesai', 'PS00000004', NULL, 1, NULL, NULL, '2024-08-04 19:06:43', NULL, 'Pickup & Bayar Nanti');
INSERT INTO `pemesanan` VALUES (31, 8, 1, '20kg', 80000, 2, 'Selesai', 'PS00000006', NULL, 1, NULL, NULL, '2024-08-04 19:06:36', NULL, 'Antar & Bayar Nanti');
INSERT INTO `pemesanan` VALUES (38, 15, 2, '15kg', 20000, 3, 'Selesai', 'PS00000010', 1, NULL, NULL, '2024-08-03 04:26:36', NULL, NULL, 'Pickup & Bayar Nanti');
INSERT INTO `pemesanan` VALUES (39, 15, 2, '15kg', 20000, 3, 'Selesai', 'PS00000010', 1, NULL, NULL, '2024-08-04 20:25:30', '2024-07-23 20:26:09', '2024-08-04 20:26:14', 'Pickup & Bayar Nanti');
INSERT INTO `pemesanan` VALUES (40, 17, 3, '100g', 10000, 7, 'Selesai', 'PS00000011', 1, 1, NULL, '2024-08-05 10:49:46', '2024-08-05 10:51:21', NULL, 'Antar & Bayar Nanti');
INSERT INTO `pemesanan` VALUES (41, 17, 2, '1kg', 250000, 1, 'Selesai', 'PS00000011', 1, 1, NULL, '2024-08-05 10:49:46', '2024-08-05 10:50:57', NULL, 'Pickup & Bayar Langsung');
INSERT INTO `pemesanan` VALUES (44, 8, 3, '100g', 20000, 7, 'DiKerjakan', 'PS00000014', 1, NULL, NULL, '2024-08-05 12:40:14', NULL, NULL, 'Antar & Bayar Langsung');
INSERT INTO `pemesanan` VALUES (45, 16, 2, '1kg', 20000, 2, 'Selesai', 'PS00000015', 1, NULL, NULL, '2024-08-05 13:50:25', NULL, NULL, 'Antar & Bayar Nanti');
INSERT INTO `pemesanan` VALUES (51, 16, 1, '100g', 10000, 2, 'Selesai', 'PS00000016', 1, NULL, NULL, '2024-08-05 20:01:46', NULL, NULL, 'Pickup & Bayar Langsung');
INSERT INTO `pemesanan` VALUES (52, 16, 1, '100g', 10000, 3, 'Selesai', 'PS00000016', 1, NULL, NULL, '2024-08-05 20:01:46', NULL, NULL, 'Pickup & Bayar Langsung');
INSERT INTO `pemesanan` VALUES (53, 16, 3, '100g', 10000, 2, 'Selesai', 'PS00000016', 1, NULL, NULL, '2024-08-05 20:01:46', NULL, NULL, 'Pickup & Bayar Langsung');
INSERT INTO `pemesanan` VALUES (54, 16, 3, '100g', 10000, 1, 'Selesai', 'PS00000016', 1, NULL, NULL, '2024-08-05 20:01:46', NULL, NULL, 'Pickup & Bayar Langsung');
INSERT INTO `pemesanan` VALUES (55, 16, 2, '100g', 10000, 3, 'Selesai', 'PS00000016', 1, NULL, NULL, '2024-08-05 20:01:46', NULL, NULL, 'Pickup & Bayar Langsung');
INSERT INTO `pemesanan` VALUES (58, 14, 0, '', 0, 0, 'DiKerjakan', 'PS00000017', 1, NULL, NULL, '2024-08-05 21:06:46', NULL, NULL, 'Pickup & Bayar Langsung');
INSERT INTO `pemesanan` VALUES (62, 16, 1, '1kg', 10000, 4, 'DiKerjakan', 'PS00000018', 1, NULL, NULL, '2024-08-05 21:09:12', NULL, NULL, 'Pickup & Bayar Nanti');
INSERT INTO `pemesanan` VALUES (63, 16, 1, '2kg', 20000, 4, 'DiKerjakan', 'PS00000018', 1, NULL, NULL, '2024-08-05 21:09:12', NULL, NULL, 'Pickup & Bayar Nanti');
INSERT INTO `pemesanan` VALUES (64, 17, 3, '1kg', 10000, 2, 'Selesai', 'PS00000019', 1, NULL, NULL, '2024-08-05 21:15:53', NULL, NULL, 'Antar & Bayar Nanti');
INSERT INTO `pemesanan` VALUES (65, 17, 2, '1kg', 10000, 5, 'Selesai', 'PS00000019', 1, NULL, NULL, '2024-08-05 21:15:53', NULL, NULL, 'Antar & Bayar Nanti');
INSERT INTO `pemesanan` VALUES (66, 20, 2, '10kg', 10000, 1, 'Selesai', 'PS00000020', 3, NULL, NULL, '2024-08-07 11:18:52', NULL, NULL, 'Antar & Bayar Langsung');
INSERT INTO `pemesanan` VALUES (67, 20, 2, '10kg', 100000, 1, 'DiKerjakan', 'PS00000021', 1, NULL, NULL, '2024-08-12 12:37:44', NULL, NULL, '');
INSERT INTO `pemesanan` VALUES (68, 21, 1, '1kg', 10000, 2, 'DiKerjakan', 'PS00000022', 1, 1, NULL, '2024-08-12 13:03:30', '2024-08-12 13:04:11', NULL, '');
INSERT INTO `pemesanan` VALUES (69, 21, 2, '10kg', 100000, 1, 'DiKerjakan', 'PS00000022', 1, NULL, NULL, '2024-08-12 13:03:30', NULL, NULL, '');

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id_setting` int NOT NULL AUTO_INCREMENT,
  `nama_website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `logo_website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tab_icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `login_icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_by` int NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `deleted_by` int NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_setting`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, 'Family Laundry', '1723004711_bcf8bd1b4e1c01a627e8.jpeg', '1723004711_642a76c545e268ef912c.jpeg', '1723004711_7173003ebc14288a0b12.jpeg', NULL, 1, NULL, NULL, '2024-08-12 13:06:50', NULL);

-- ----------------------------
-- Table structure for transaksi
-- ----------------------------
DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE `transaksi`  (
  `id_transaksi` int NOT NULL AUTO_INCREMENT,
  `no_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal_nota` datetime NULL DEFAULT NULL,
  `total_harga` int NULL DEFAULT NULL,
  `id_user` int NULL DEFAULT NULL,
  `kode_pemesanan` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bayar` int NULL DEFAULT NULL,
  `kembalian` int NULL DEFAULT NULL,
  `create_by` int NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `deleted_by` int NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `pelanggan` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaksi
-- ----------------------------
INSERT INTO `transaksi` VALUES (90, '0124080401', '2024-08-04 20:43:20', 40000, 1, 'PS00000010', 50000, 10000, 1, NULL, NULL, '2024-08-04 20:43:22', NULL, NULL, 15);
INSERT INTO `transaksi` VALUES (91, '0124080402', '2024-08-04 20:46:39', 250000, 1, 'PS00000004', 300000, 50000, 8, NULL, NULL, '2024-08-04 20:46:42', NULL, NULL, 8);
INSERT INTO `transaksi` VALUES (92, '0124080501', '2024-08-05 13:47:44', 260000, 1, 'PS00000011', 300000, 40000, 1, NULL, NULL, '2024-08-05 13:48:02', NULL, NULL, 17);
INSERT INTO `transaksi` VALUES (93, '0124080502', '2024-08-05 13:51:14', 20000, 1, 'PS00000015', 20000, 0, 1, NULL, NULL, '2024-08-05 13:51:18', NULL, NULL, 16);
INSERT INTO `transaksi` VALUES (94, '0124080503', '2024-08-05 20:38:56', 50000, 1, 'PS00000016', 100000, 50000, 1, NULL, NULL, '2024-08-05 20:39:00', NULL, NULL, 16);
INSERT INTO `transaksi` VALUES (95, '0124080504', '2024-08-05 21:16:25', 20000, 1, 'PS00000019', 20000, 0, 1, NULL, NULL, '2024-08-05 21:16:27', NULL, NULL, 17);
INSERT INTO `transaksi` VALUES (96, '0124080601', '2024-08-06 13:17:25', 20000, 1, 'PS00000002', 200000, 180000, 1, NULL, NULL, '2024-08-06 13:17:43', NULL, NULL, 2);
INSERT INTO `transaksi` VALUES (97, '0124080701', '2024-08-07 11:19:21', 10000, 3, 'PS00000020', 10000, 0, 3, NULL, NULL, '2024-08-07 11:19:22', NULL, NULL, 20);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` enum('Admin','Pelanggan','Karyawan') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nohp` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'c4ca4238a0b923820dcc509a6f75849b', 'admin@gmail.com', 'Admin', '085157206615', 'Batam Centre', '1722492978_ea8f1452bc82faad9ceb.jpeg', 1, '2024-08-01 01:17:44');
INSERT INTO `user` VALUES (2, 'pelanggan', 'c4ca4238a0b923820dcc509a6f75849b', 'pelanggan@gmail.com', 'Pelanggan', '087216617', 'Nagoya', NULL, NULL, NULL);
INSERT INTO `user` VALUES (3, 'karyawan1', 'c4ca4238a0b923820dcc509a6f75849b', '123@gmail.com', 'Karyawan', '0811', 'Bengkong', '1722925737_e1050503dab0eaaea5c2.png', 3, '2024-08-06 13:27:15');
INSERT INTO `user` VALUES (8, 'deren', 'c4ca4238a0b923820dcc509a6f75849b', 'deren@gmail.com', 'Pelanggan', '0812712', 'Nagoya', NULL, NULL, NULL);
INSERT INTO `user` VALUES (15, 'Sterling', 'c4ca4238a0b923820dcc509a6f75849b', 'sterling@gmail.com', 'Pelanggan', '08576288191', 'London', NULL, NULL, NULL);
INSERT INTO `user` VALUES (16, 'Ahmad', 'c4ca4238a0b923820dcc509a6f75849b', 'ahmad@gmail.com', 'Pelanggan', '0821997212', 'London', NULL, 16, '2024-08-05 21:29:05');
INSERT INTO `user` VALUES (17, 'Messi2', 'c4ca4238a0b923820dcc509a6f75849b', 'messi2@gmail.com', 'Pelanggan', '911', 'Amerika, Inter Miami Blok M', NULL, NULL, NULL);
INSERT INTO `user` VALUES (18, '12345', 'c4ca4238a0b923820dcc509a6f75849b', 'bob@gmail.com', 'Pelanggan', '123412341234', '2345', NULL, NULL, NULL);
INSERT INTO `user` VALUES (20, 'ramon123', '202cb962ac59075b964b07152d234b70', '123@gmail.com', 'Pelanggan', '122', '123', NULL, NULL, NULL);
INSERT INTO `user` VALUES (21, 'tester12', '81dc9bdb52d04dc20036dbd8313ed055', '123@gmail.com', 'Pelanggan', '122', '2345', NULL, NULL, NULL);

-- ----------------------------
-- Triggers structure for table transaksi
-- ----------------------------
DROP TRIGGER IF EXISTS `tes`;
delimiter ;;
CREATE TRIGGER `tes` AFTER INSERT ON `transaksi` FOR EACH ROW UPDATE pemesanan
    SET status = 'Selesai'
    WHERE kode_pemesanan = NEW.kode_pemesanan
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

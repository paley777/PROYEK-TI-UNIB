-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2024 at 06:07 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubes_kelompok4`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_freelancer` (IN `f_id` INT, IN `f_nama` VARCHAR(50), IN `f_email` VARCHAR(50))   BEGIN
    INSERT INTO freelancers (id_fr, nama, email)
    VALUES (f_id, f_nama, f_email);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_proyek` (IN `P_id_proyek` INT, IN `P_nama` VARCHAR(50), IN `P_deskripsi` TEXT, IN `P_start_date` DATE, IN `P_end_date` DATE, IN `P_deadline` DATE, IN `P_deal_clearance` DATE)   BEGIN
    INSERT INTO proyek (id_proyek,nama, deskripsi, start_date, end_date, deadline, deal_clearance)
    VALUES (P_id_proyek, P_nama, P_deskripsi, P_start_date, P_end_date, P_deadline, P_deal_clearance);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_proyek_freelancer` (IN `pf_id` INT, IN `pf_proyek_id` INT, IN `pf_freelancer_id` INT, IN `pf_role` VARCHAR(50))   BEGIN
    INSERT INTO proyek_freelancers (id, proyek_id, freelancer_id, role)
    VALUES (pf_id, pf_proyek_id, pf_freelancer_id, role);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_task` (IN `t_id` INT, IN `t_proyek_id` INT, IN `t_nama` VARCHAR(50), IN `t_deskripsi` TEXT, IN `t_start_date` DATE, IN `t_end_date` DATE, IN `t_status` VARCHAR(50))   BEGIN
    INSERT INTO tasks (id_task, proyek_id, nama_task, deskripsi, start_date, end_date, status)
    VALUES (t_id, t_proyek_id, t_nama, t_deskripsi, t_start_date, t_end_date, t_status);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_proyek` (IN `p_id_proyek` INT)   BEGIN
    DELETE FROM proyek_freelancers WHERE proyek_id = p_id_proyek;
    DELETE FROM tasks WHERE proyek_id = p_id_proyek;
    DELETE FROM proyek WHERE id_proyek = p_id_proyek;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_proyek` (IN `P_id_proyek` INT, IN `P_nama` VARCHAR(50), IN `P_deskripsi` TEXT, IN `P_start_date` DATE, IN `P_end_date` DATE, IN `P_deadline` DATE, IN `P_deal_clearance` DATE)   BEGIN
    UPDATE proyek
    SET nama = p_nama, deskripsi = p_deskripsi,
        start_date = p_start_date, end_date = p_end_date,
        deadline = p_deadline, deal_clearance = p_deal_clearance
    WHERE id_proyek = p_id_proyek;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `freelancers`
--

CREATE TABLE `freelancers` (
  `id_fr` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `freelancers`
--

INSERT INTO `freelancers` (`id_fr`, `nama`, `email`) VALUES
(201, 'Apri Agriansyah', 'Apria@gmail.com'),
(202, 'Carli Margareta', 'CarliKim@gmail.com'),
(203, 'Kevin Abdiansyah', 'Kevina@gmail.com'),
(204, 'Zahrah Hafizah', 'Zarara@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `proyek`
--

CREATE TABLE `proyek` (
  `id_proyek` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `deal_clearance` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proyek`
--

INSERT INTO `proyek` (`id_proyek`, `nama`, `deskripsi`, `start_date`, `end_date`, `deadline`, `deal_clearance`) VALUES
(102, 'Content Marketing Campaign', 'mengembangkan dan menjalankan Content Marketing Campaign untuk meningkatkan visibilitas merek dan mengarahkan lalu lintas ke situs web.', '2024-05-01', '2024-07-31', '2024-06-30', '2024-05-01'),
(103, 'Mobile App Development Updated', 'pengembangan aplikasi seluler yang lebih baik.', '2024-06-01', '2024-08-31', '2024-07-15', '2024-06-01');

-- --------------------------------------------------------

--
-- Table structure for table `proyek_freelancers`
--

CREATE TABLE `proyek_freelancers` (
  `id` int(11) NOT NULL,
  `proyek_id` int(11) DEFAULT NULL,
  `freelancer_id` int(11) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proyek_freelancers`
--

INSERT INTO `proyek_freelancers` (`id`, `proyek_id`, `freelancer_id`, `role`) VALUES
(33, 102, 202, 'Content Writer'),
(44, 102, 203, 'Marketing Specialist'),
(55, 103, 204, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id_task` int(11) NOT NULL,
  `proyek_id` int(11) DEFAULT NULL,
  `nama_task` varchar(50) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id_task`, `proyek_id`, `nama_task`, `deskripsi`, `start_date`, `end_date`, `status`) VALUES
(303, 102, 'Content Strategy', 'Kembangkan strategi konten marketing campaign.', '2024-05-05', '2024-05-15', 'In Progress'),
(401, 103, 'UI/UX Design', 'Rancang antarmuka pengguna dan pengalaman pengguna untuk aplikasi seluler.', '2024-06-05', '2024-06-15', 'To Do');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `freelancers`
--
ALTER TABLE `freelancers`
  ADD PRIMARY KEY (`id_fr`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `proyek`
--
ALTER TABLE `proyek`
  ADD PRIMARY KEY (`id_proyek`);

--
-- Indexes for table `proyek_freelancers`
--
ALTER TABLE `proyek_freelancers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proyek_id` (`proyek_id`),
  ADD KEY `freelancer_id` (`freelancer_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id_task`),
  ADD KEY `proyek_id` (`proyek_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `proyek_freelancers`
--
ALTER TABLE `proyek_freelancers`
  ADD CONSTRAINT `proyek_freelancers_ibfk_1` FOREIGN KEY (`proyek_id`) REFERENCES `proyek` (`id_proyek`),
  ADD CONSTRAINT `proyek_freelancers_ibfk_2` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancers` (`id_fr`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`proyek_id`) REFERENCES `proyek` (`id_proyek`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

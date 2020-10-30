-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2020 at 07:46 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `car_transfer`
--

CREATE TABLE `car_transfer` (
  `id` int(11) NOT NULL,
  `brand_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intake_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displacement` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drive_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_power` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `engine_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `curise_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pic_address` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `car_transfer`
--

INSERT INTO `car_transfer` (`id`, `brand_id`, `price`, `intake_id`, `displacement`, `drive_id`, `max_power`, `engine_id`, `curise_id`, `pic_address`) VALUES
(1, 'Audi A3 paragraphs 2020 to 35 TFSI Sportback VI aggressive countries', '193200', 'turbo', '1.4', 'Lead precursor', '110', '1.4 T 150 horsepower L4', 'Cruise control', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/1-audi-a3-sportback-tdi-2020-fd-hero-front.jpg?itok=F6B-ZIxc'),
(2, 'Audi A4 2020 Avant avant-garde 40 TFSI kinetic model', '341800', 'turbo', '2', 'Lead precursor', '140', '2.0 T 190 horsepower L4', 'Cruise control adaptive cruise at full speed', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/audi-a4-rt-2015-0024_0.jpg?itok=4Mp5c5H7'),
(3, 'Audi A5 Coupe 2020 paragraph 40 TFSI fashion type VI', '379800', 'turbo', '2', 'Lead precursor', '140', '2.0 T 190 horsepower L4', 'Cruise control', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.motor1.com%2Fimages%2Fmgl%2FQE373%2Fs3%2F2020-audi-a5-coupe.jpg&f=1&nofb=1'),
(4, 'Audi A6 Avant 2020 paragraph avant-garde 40 TFSI luxurious movement type', '449800', 'turbo', '2', 'Lead precursor', '140', '2.0 T 190 horsepower L4', 'Cruise control adaptive cruise at full speed', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/1-audi-a6-2019-rt-hero-front.jpg?itok=YbZgMLLp'),
(5, 'Audi A7 2020 40 TFSI luxury', '573800', 'turbo', '2', 'Lead precursor', '140', '2.0 T 190 horsepower L4', 'Cruise control', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/1-audi-a7-sportback-2018-rt-hero-front.jpg?itok=8QFVAU5S'),
(6, 'Audi A8 paragraphs 2019 change Plus 50 TFSI A8L quattro comfort', '838800', 'turbo', '3', 'Front all-wheel-drive', '-', '3.0 T 286 horsepower V6', 'Adaptive cruise control full speed cruise', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/1-audi-a8-tfsie-2020-rt-hero-front.jpg?itok=DF5GaDtx'),
(7, 'Audi S3 2019 S3 2.0 T Limousine', '363800', 'turbo', '2', 'Front all-wheel-drive', '213', '2.0 T 290 horsepower L4', 'Cruise control adaptive cruise', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/audi-s3_0.jpg?itok=XjjQWGA1'),
(8, 'Audi S4 2018 S4 3.0 TFSI', '459800', 'turbo', '3', 'Front all-wheel-drive', '260', '3.0 T 354 horsepower V6', 'Cruise control', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/1-audi-s4-tdi-2019-rt-hero-front.jpg?itok=QBT2VPl5'),
(9, 'Audi S5 2017 S5 3.0 T Sportback', '622800', 'turbo', '3', 'Front all-wheel-drive', '260', '3.0 T 354 horsepower V6', 'Cruise control adaptive cruise at full speed', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/198101016384851600x1060_0.jpg?itok=3BAdeHy1'),
(10, 'Audi S6 2020 S6 2.9 T', '930000', 'Twin turbo', '2.9', 'Front all-wheel-drive', '-', '2.9 T 450 horsepower V6', 'Adaptive cruise at full speed', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/audi-s6-avant-2014-001_0.jpg?itok=8OB4np7K'),
(11, 'Audi TT 2017 TT Coupe 40 TFSI', '453800', 'turbo', '1.8', 'Lead precursor', '132', '1.8 T 180 horsepower L4', 'Cruise control', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/audi-tt-road-test-2015-018.jpg?itok=tWqGaV3j'),
(12, 'Audi TTS 2017 TTS Coupe 2.0 TFSI quattro', '597800', 'turbo', '2', 'Front all-wheel-drive', '210', '2.0 T 286 horsepower L4', 'Cruise control', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/audi-tts.jpg?itok=9xXRIVp2'),
(13, 'Audi E-tron 2019 type 55 quattro fashion', '692800', '-', '-', 'Double motor all-wheel-drive', '300', '-', 'Cruise control', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/1-audi-e-tron-2019-rt-hero-front_0.jpg?itok=f25hASRy'),
(14, 'Audi Q3 2020 35 TFSI enterprising to type', '271800', 'turbo', '1.4', 'Lead precursor', '110', '1.4 T 150 horsepower L4', 'Cruise control', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/audi-q3-2018-890-front.jpg?itok=okDnFs4w'),
(15, 'Audi Q5L 2020 40 TFSI rong aggressive', '387800', 'turbo', '2', 'Front all-wheel-drive', '140', '2.0 T 190 horsepower L4', 'Cruise control', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/audi-q5_4.jpg?itok=GK_joMOK'),
(16, 'Audi Q7 2020 45 TFSI quattro S limited edition line movement', '689800', 'turbo', '2', 'Front all-wheel-drive', '180', '2.0 T 245 horsepower L4', 'Cruise control', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/audi-q7-rt-2015-004.jpg?itok=2gaQw273'),
(17, 'Audi R8 V10 in paragraph 2017 Coupe', '1.9528 million', 'Naturally aspirated', '5.2', 'Four-wheel drive of', '397', '5.2 L 540 horsepower V10', 'Cruise control', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/audi-r8-rad-test-2016-0003_0.jpg?itok=6wReBsbM'),
(18, 'Audi TT RS 2017 TT RS 2.5 T Coupe', '769800', 'turbo', '2.5', 'Front all-wheel-drive', '294', '2.5 T 400 horsepower L5', 'Cruise control', 'https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/audi-tt-rs.jpg?itok=4m1x4Nl0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car_transfer`
--
ALTER TABLE `car_transfer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car_transfer`
--
ALTER TABLE `car_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

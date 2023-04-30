

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFlightStatistics` (IN `j_date` DATE) 
BEGIN
select flight_no,departure_date,IFNULL(no_of_passengers, 0) as no_of_passengers,total_capacity from (
select f.flight_no,f.departure_date,sum(t.no_of_passengers) as no_of_passengers,j.total_capacity 
from flight_details f left join ticket_details t 
on t.booking_status='CONFIRMED' 
and t.flight_no=f.flight_no 
and f.departure_date=t.journey_date 
inner join jet_details j on j.jet_id=f.jet_id
group by flight_no,journey_date) k where departure_date=j_date;
END
$$ DELIMITER ;


--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(20) NOT NULL,
  `pwd` varchar(20000) DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `pwd`, `staff_id`, `name`, `email`) VALUES
('Shamla', '7aa4d9bdac8dde3cae4395a9da62a82e', '101', 'Shamla', 'shamla@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(20) NOT NULL,
  `pwd` varchar(20000) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `address` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `pwd`, `name`, `email`, `phone_no`, `address`) VALUES
('Jazzi', '8a0a75354563439d6f00b399e0f59ae1', 'Jazeela', 'jazzijazzi@gmail.com', '9902989546', 'B-10,B Block, IT quarters'),
('Maryam', 'b2113ad6ffdbefd544ce165c29704595', 'Maryam', 'chemistry@sdmit.in', '9090909090', 'B-10,B Block, IT quarters'),
('meghana', 'dd4e7c2659f985bbb65c7bcb3e5606e3', 'Meghana', 'meghana@gmail.com', '9485564764', 'Koppa'),
('Mia', '86ee6a4f63459a77a249b30ff889f161', 'Mia Meher', 'miali@gmail.com', '8976543212', 'Udupi'),
('Mialisha', 'f2f7e3fa1e081aea7f52f4039c08740e', 'meher', 'chemistry@sdmit.in', '9876905643', 'B-10,B Block, IT quarters'),
('Nihala', '24a5eca60a039074e485d877612cb709', 'Nihala', 'nihala@gmail.com', '9812345678', 'B-10,B Block, IT quarters'),
('nisarga', '159e1dec8be7ba707d101cc7bd5e6e90', 'Nisarga', 'nisarga@gmail.com', '9434985709', 'Shimoga'),
('ramashree', '5663fc55ada766e7b2ef5ebf30b93d5b', 'Ramashree', 'ramashree@gmail.com', '9445713736', 'Thirthahalli'),
('Razia', '4afa5a4540ab598dd3a2f21d3292eb43', 'Razia Sulthana', 'razia@gmail.com', '8876568906', 'Berlin'),
('samla', '6b1673974f0fdfae2d3b6d1067f33e97', 'Shamla', 'shamla@gmail', '9456238745', 'Vitala'),
('shamla', 'ad1d388afeb423d75f7a19c2ca505754', 'Shamla', 'mariyammathul.samla@gmail.com', '9902989546', 'B-10,B Block, IT quarters'),
('Shiza', '7ce96141c044c004dc161b236c1a99d9', 'Shiza Fathima', 'Shiza@gmail.com', '9090909090', 'Mumbai'),
('Suhana', 'abcb2a363ab626c70e6e436b81a0089f', 'Suhana', 'suha@gmail.com', '9008329832', 'Koppala'),
('Sulthana', '20646ef8d14370f36c790aaa72380d7d', 'Mubeena Sulthana', 'sulthana@gmail.com', '9876905643', 'B-10,B Block, IT quarters Koppala'),

-- --------------------------------------------------------

--
-- Table structure for table `flight_details`
--

CREATE TABLE `flight_details` (
  `flight_no` varchar(10) NOT NULL,
  `from_city` varchar(20) DEFAULT NULL,
  `to_city` varchar(20) DEFAULT NULL,
  `departure_date` date NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `admin_id` varchar(11) NOT NULL,
  `seats_economy` int(5) DEFAULT NULL,
  `seats_business` int(5) DEFAULT NULL,
  `price_economy` int(10) DEFAULT NULL,
  `price_business` int(10) DEFAULT NULL,
  `jet_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `flight_details`
--

INSERT INTO `flight_details` (`flight_no`, `from_city`, `to_city`, `departure_date`, `arrival_date`, `departure_time`, `arrival_time`, `admin_id`, `seats_economy`, `seats_business`, `price_economy`, `price_business`, `jet_id`) VALUES
('AA101', 'bangalore', 'mumbai', '2023-01-31', '2023-01-31', '21:00:00', '01:00:00', 'Shamla', 193, 96, 5000, 7500, '10001'),
('AA102', 'bangalore', 'mumbai', '2023-02-01', '2023-02-01', '10:00:00', '12:00:00', 'Shamla', 200, 73, 2500, 3000, '10002'),
('AA103', 'bangalore', 'chennai', '2023-02-03', '2023-02-03', '17:00:00', '17:45:00', 'Shamla', 150, 75, 1200, 1500, '10004'),
('AA104', 'bangalore', 'mysore', '2023-03-03', '2023-03-03', '09:00:00', '09:17:00', 'Shamla', 37, 4, 500, 750, '10003'),
('AA106', 'bangalore', 'Paris', '2023-01-31', '2023-02-01', '20:45:00', '01:50:00', 'Shamla', 100, 40, 50000, 100000, '10001'),
('AA106', 'bangalore', 'hyderabad', '2023-12-01', '2023-12-01', '13:00:00', '14:00:00', 'Shamla', 150, 75, 3000, 3750, '10004'),
('AA107', 'Delhi', 'mangalore', '2023-01-31', '2023-02-01', '02:10:00', '07:20:00', 'Shamla', 100, 50, 1000000, 1500000, '10001'),
('AA108', 'bangalore', 'hyderabad', '2023-02-01', '2023-02-02', '15:10:00', '18:10:00', 'Shamla', 90, 50, 50000, 70000, '10002');

-- --------------------------------------------------------

--
-- Table structure for table `frequent_flier_details`
--

CREATE TABLE `frequent_flier_details` (
  `frequent_flier_no` varchar(20) NOT NULL,
  `customer_id` varchar(20) DEFAULT NULL,
  `mileage` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `frequent_flier_details`
--

INSERT INTO `frequent_flier_details` (`frequent_flier_no`, `customer_id`, `mileage`) VALUES
('10001000', 'samla', 375),
('20002000', 'ramashree', 150);

-- --------------------------------------------------------

--
-- Table structure for table `jet_details`
--

CREATE TABLE `jet_details` (
  `jet_id` varchar(10) NOT NULL,
  `jet_type` varchar(20) DEFAULT NULL,
  `total_capacity` int(5) DEFAULT NULL,
  `active` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jet_details`
--

INSERT INTO `jet_details` (`jet_id`, `jet_type`, `total_capacity`, `active`) VALUES
('10001', 'Dreamliner', 300, 'Yes'),
('10002', 'Airbus A380', 275, 'Yes'),
('10003', 'ATR', 50, 'Yes'),
('10004', 'Boeing 737', 225, 'Yes'),
('10007', 'Test_Model', 250, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `passenger_id` int(10) NOT NULL,
  `pnr` varchar(15) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `meal_choice` varchar(5) DEFAULT NULL,
  `frequent_flier_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`passenger_id`, `pnr`, `name`, `age`, `gender`, `meal_choice`, `frequent_flier_no`) VALUES
(1, '1669050', 'vaibhav', 20, 'male', 'yes', '20002000'),
(1, '2369143', 'ganesh', 20, 'male', 'yes', NULL),
(1, '3027167', 'avinash', 30, 'male', 'yes', NULL),
(1, '3773951', 'himesh', 51, 'male', 'yes', NULL),
(1, '4797983', 'arun', 34, 'male', 'yes', NULL),
(1, '5014399', 'Shamla', 23, 'female', 'yes', NULL),
(1, '5421865', 'varun', 10, 'male', 'yes', NULL),
(1, '6980157', 'roshan', 20, 'male', 'yes', NULL),
(1, '7489819', 'Shamla', 23, 'male', 'yes', NULL),
(1, '8503285', 'avinash', 21, 'male', 'yes', '10001000'),
(2, '1669050', 'harish', 45, 'female', 'yes', NULL),
(2, '2369143', 'kiran', 51, 'male', 'yes', NULL),
(2, '3027167', 'roshan', 20, 'male', 'yes', NULL),
(2, '3773951', 'bindu', 42, 'female', 'yes', NULL),
(2, '4797983', 'swaroop', 20, 'male', 'yes', '20002000'),
(2, '5421865', 'sakshi', 20, 'female', 'yes', NULL),
(2, '6980157', 'avinash', 9, 'male', 'yes', NULL),
(2, '8503285', 'roshan', 20, 'male', 'yes', NULL),
(3, '1669050', 'avinash', 10, 'male', 'yes', NULL),
(3, '2369143', 'akash', 20, 'male', 'yes', NULL),
(3, '3773951', 'aravind', 21, 'male', 'yes', '10001000'),
(3, '4797983', 'avinash', 20, 'male', 'yes', '10001000'),
(3, '5421865', 'darshan', 30, 'male', 'yes', NULL),
(4, '2369143', 'sindu', 42, 'female', 'yes', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `payment_id` varchar(20) NOT NULL,
  `pnr` varchar(15) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` int(6) DEFAULT NULL,
  `payment_mode` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`payment_id`, `pnr`, `payment_date`, `payment_amount`, `payment_mode`) VALUES
('120000248', '4797983', '2023-01-29', 4200, 'credit card'),
('142539461', '3773951', '2023-01-29', 4050, 'credit card'),
('165125569', '8503285', '2023-01-29', 7500, 'net banking'),
('417942604', '7489819', '2023-01-28', 5850, 'credit card'),
('467972527', '2369143', '2023-01-30', 33400, 'debit card'),
('557778944', '6980157', '2023-01-30', 11700, 'credit card'),
('620041544', '1669050', '2023-01-29', 4800, 'debit card'),
('665360715', '5421865', '2023-01-27', 15750, 'net banking'),
('837542348', '5014399', '2023-01-28', 5850, 'credit card'),
('862686553', '3027167', '2023-01-29', 10700, 'debit card');

--
-- Triggers `payment_details`
--
DELIMITER $$
CREATE TRIGGER `update_ticket_after_payment` AFTER INSERT ON `payment_details` FOR EACH ROW UPDATE ticket_details
     SET booking_status='CONFIRMED', payment_id= NEW.payment_id
   WHERE pnr = NEW.pnr
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_details`
--

CREATE TABLE `ticket_details` (
  `pnr` varchar(15) NOT NULL,
  `date_of_reservation` date DEFAULT NULL,
  `flight_no` varchar(10) DEFAULT NULL,
  `journey_date` date DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `booking_status` varchar(20) DEFAULT NULL,
  `no_of_passengers` int(5) DEFAULT NULL,
  `lounge_access` varchar(5) DEFAULT NULL,
  `priority_checkin` varchar(5) DEFAULT NULL,
  `insurance` varchar(5) DEFAULT NULL,
  `payment_id` varchar(20) DEFAULT NULL,
  `customer_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ticket_details`
--

INSERT INTO `ticket_details` (`pnr`, `date_of_reservation`, `flight_no`, `journey_date`, `class`, `booking_status`, `no_of_passengers`, `lounge_access`, `priority_checkin`, `insurance`, `payment_id`, `customer_id`) VALUES
('1669050', '2023-01-29', 'AA104', '2023-03-03', 'business', 'CONFIRMED', 3, 'yes', 'yes', 'yes', '620041544', 'ramashree'),
('2369143', '2023-01-30', 'AA101', '2023-01-31', 'business', 'CONFIRMED', 4, 'yes', 'yes', 'yes', '467972527', 'nisarga'),
('3027167', '2023-01-29', 'AA101', '2023-01-31', 'economy', 'CONFIRMED', 2, 'no', 'no', 'yes', '862686553', 'samla'),
('3773951', '2023-01-29', 'AA104', '2023-03-03', 'economy', 'CONFIRMED', 3, 'yes', 'yes', 'yes', '142539461', 'samla'),
('4797983', '2023-01-29', 'AA104', '2023-03-03', 'business', 'CONFIRMED', 3, 'yes', 'no', 'yes', '120000248', 'ramashree'),
('5014399', '2023-01-28', 'AA101', '2023-01-31', 'economy', 'CONFIRMED', 1, 'yes', 'yes', 'yes', '837542348', 'Maryam'),
('5421865', '2023-01-27', 'AA101', '2023-01-31', 'economy', 'CONFIRMED', 3, 'no', 'no', 'no', '665360715', 'ramashree'),
('6980157', '2023-01-30', 'AA101', '2023-01-31', 'economy', 'CANCELED', 2, 'yes', 'yes', 'yes', '557778944', 'samla'),
('7489819', '2023-01-28', 'AA101', '2023-01-31', 'economy', 'CONFIRMED', 1, 'yes', 'yes', 'yes', '417942604', 'shamla'),
('8503285', '2023-01-29', 'AA102', '2023-02-01', 'business', 'CONFIRMED', 2, 'yes', 'yes', 'no', '165125569', 'samla');




--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `flight_details`
--
ALTER TABLE `flight_details`
  ADD PRIMARY KEY (`flight_no`,`departure_date`),
  ADD KEY `jet_id` (`jet_id`),
  ADD KEY `flight_details_ibfk_2` (`admin_id`);

--
-- Indexes for table `frequent_flier_details`
--
ALTER TABLE `frequent_flier_details`
  ADD PRIMARY KEY (`frequent_flier_no`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `jet_details`
--
ALTER TABLE `jet_details`
  ADD PRIMARY KEY (`jet_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passenger_id`,`pnr`),
  ADD KEY `pnr` (`pnr`),
  ADD KEY `frequent_flier_no` (`frequent_flier_no`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `pnr` (`pnr`);

--
-- Indexes for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD PRIMARY KEY (`pnr`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `journey_date` (`journey_date`),
  ADD KEY `flight_no` (`flight_no`),
  ADD KEY `flight_no_2` (`flight_no`,`journey_date`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flight_details`
--
ALTER TABLE `flight_details`
  ADD CONSTRAINT `flight_details_ibfk_1` FOREIGN KEY (`jet_id`) REFERENCES `jet_details` (`jet_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flight_details_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `frequent_flier_details`
--
ALTER TABLE `frequent_flier_details`
  ADD CONSTRAINT `frequent_flier_details_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `ticket_details` (`pnr`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passengers_ibfk_2` FOREIGN KEY (`frequent_flier_no`) REFERENCES `frequent_flier_details` (`frequent_flier_no`) ON UPDATE CASCADE;

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `ticket_details` (`pnr`) ON UPDATE CASCADE;

--
-- Constraints for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_details_ibfk_3` FOREIGN KEY (`flight_no`,`journey_date`) REFERENCES `flight_details` (`flight_no`, `departure_date`) ON DELETE SET NULL ON UPDATE CASCADE;
  
COMMIT;


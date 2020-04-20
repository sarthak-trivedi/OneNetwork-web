-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2020 at 05:01 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onenetwork`
--

-- --------------------------------------------------------

--
-- Table structure for table `applied_users`
--

CREATE TABLE `applied_users` (
  `user_id` varchar(50) NOT NULL,
  `project_id` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `resume` tinyint(1) NOT NULL,
  `message` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `create_users`
--

CREATE TABLE `create_users` (
  `code1` varchar(50) NOT NULL,
  `code2` varchar(50) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(39) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forgot_passwords`
--

CREATE TABLE `forgot_passwords` (
  `code1` varchar(50) NOT NULL,
  `code2` varchar(50) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `time` int(11) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`id`, `name`, `category`) VALUES
(6, 'java', 1),
(7, 'php', 1),
(8, 'mysql', 1),
(9, 'Artificial intelligence', 2),
(10, 'Image processing', 2),
(11, 'javascript', 1),
(12, 'python', 1),
(13, 'c', 1),
(14, 'c++', 1),
(15, 'c#', 1),
(16, 'Asp.net', 1),
(17, 'Kotlin', 1),
(18, 'React', 1),
(19, 'Ruby', 1),
(20, 'Visual Basic .NET', 1),
(21, 'Spring', 3),
(22, 'Hibernate', 3),
(23, 'Struts', 3),
(24, 'JavaServer Faces', 3),
(25, 'Grails', 3),
(26, 'Angular', 3),
(27, 'React', 3),
(28, 'Vue.js', 3),
(29, 'Ember.js', 3),
(30, 'Node.js', 3),
(31, 'Backbone.js', 3),
(32, 'Ruby on Rails', 3),
(33, 'Django', 3),
(34, 'Laravel', 3),
(35, 'ExpressJs', 3),
(36, 'CodeIgniter', 3);

-- --------------------------------------------------------

--
-- Table structure for table `interest_categories`
--

CREATE TABLE `interest_categories` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interest_categories`
--

INSERT INTO `interest_categories` (`id`, `name`) VALUES
(1, 'languages'),
(2, 'technologies'),
(3, 'framework');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `owner_id` varchar(50) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `mentor` varchar(50) DEFAULT NULL,
  `project_type` int(11) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_in_interests`
--

CREATE TABLE `project_in_interests` (
  `project_id` int(11) NOT NULL,
  `interest_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

CREATE TABLE `project_members` (
  `project_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_status`
--

CREATE TABLE `project_status` (
  `id` int(11) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_status`
--

INSERT INTO `project_status` (`id`, `status`) VALUES
(1, 'open'),
(2, 'closed');

-- --------------------------------------------------------

--
-- Table structure for table `project_types`
--

CREATE TABLE `project_types` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_types`
--

INSERT INTO `project_types` (`id`, `name`) VALUES
(1, 'Summer internship'),
(2, 'Winter internship');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'faculty'),
(2, 'student');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(50) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(11) NOT NULL,
  `firsttime` tinyint(1) NOT NULL DEFAULT '1',
  `profile_pic` varchar(50) NOT NULL DEFAULT 'img_avatar.png',
  `resume` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

CREATE TABLE `user_interests` (
  `user_id` varchar(50) NOT NULL,
  `interest_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applied_users`
--
ALTER TABLE `applied_users`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `create_users`
--
ALTER TABLE `create_users`
  ADD PRIMARY KEY (`code1`,`code2`);

--
-- Indexes for table `forgot_passwords`
--
ALTER TABLE `forgot_passwords`
  ADD PRIMARY KEY (`code1`,`code2`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `interest_categories`
--
ALTER TABLE `interest_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`owner_id`,`project_id`,`user_id`,`type`,`time`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `project_type` (`project_type`),
  ADD KEY `creator` (`creator`),
  ADD KEY `mentor` (`mentor`);

--
-- Indexes for table `project_in_interests`
--
ALTER TABLE `project_in_interests`
  ADD PRIMARY KEY (`project_id`,`interest_id`),
  ADD KEY `interest_id` (`interest_id`);

--
-- Indexes for table `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`project_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `project_status`
--
ALTER TABLE `project_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_types`
--
ALTER TABLE `project_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `user_interests`
--
ALTER TABLE `user_interests`
  ADD PRIMARY KEY (`user_id`,`interest_id`),
  ADD KEY `interest_id` (`interest_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `interest_categories`
--
ALTER TABLE `interest_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `project_status`
--
ALTER TABLE `project_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_types`
--
ALTER TABLE `project_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applied_users`
--
ALTER TABLE `applied_users`
  ADD CONSTRAINT `applied_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `applied_users_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `forgot_passwords`
--
ALTER TABLE `forgot_passwords`
  ADD CONSTRAINT `forgot_passwords_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);

--
-- Constraints for table `interests`
--
ALTER TABLE `interests`
  ADD CONSTRAINT `interests_ibfk_1` FOREIGN KEY (`category`) REFERENCES `interest_categories` (`id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`status`) REFERENCES `project_status` (`id`),
  ADD CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`project_type`) REFERENCES `project_types` (`id`),
  ADD CONSTRAINT `projects_ibfk_4` FOREIGN KEY (`creator`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `projects_ibfk_5` FOREIGN KEY (`mentor`) REFERENCES `users` (`id`);

--
-- Constraints for table `project_in_interests`
--
ALTER TABLE `project_in_interests`
  ADD CONSTRAINT `project_in_interests_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `project_in_interests_ibfk_2` FOREIGN KEY (`interest_id`) REFERENCES `interests` (`id`);

--
-- Constraints for table `project_members`
--
ALTER TABLE `project_members`
  ADD CONSTRAINT `project_members_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `project_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_interests`
--
ALTER TABLE `user_interests`
  ADD CONSTRAINT `user_interests_ibfk_1` FOREIGN KEY (`interest_id`) REFERENCES `interests` (`id`),
  ADD CONSTRAINT `user_interests_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

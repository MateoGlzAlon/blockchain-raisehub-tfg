-- Volcando estructura para tabla crowdfund_db.bookmarks
CREATE TABLE IF NOT EXISTS `bookmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2e83pys34l1inuejvk0s0yp18` (`project_id`),
  KEY `FKdbsho2e05w5r13fkjqfjmge5f` (`user_id`),
  CONSTRAINT `FK2e83pys34l1inuejvk0s0yp18` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `FKdbsho2e05w5r13fkjqfjmge5f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla crowdfund_db.bookmarks: ~7 rows (aproximadamente)
INSERT INTO `bookmarks` (`id`, `project_id`, `user_id`) VALUES
	(1, 1, 1),
	(2, 8, 1),
	(3, 2, 1),
	(4, 3, 1),
	(5, 9, 4),
	(6, 4, 6),
	(15, 3, 6);

-- Volcando estructura para tabla crowdfund_db.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` float NOT NULL,
  `payment_date` datetime(6) NOT NULL,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  `tx_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7h0as5hqhn845eewc7usiy0x3` (`project_id`),
  KEY `FKj94hgy9v5fw1munb90tar2eje` (`user_id`),
  CONSTRAINT `FK7h0as5hqhn845eewc7usiy0x3` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKj94hgy9v5fw1munb90tar2eje` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla crowdfund_db.payments: ~25 rows (aproximadamente)
INSERT INTO `payments` (`id`, `amount`, `payment_date`, `project_id`, `user_id`, `tx_hash`) VALUES
	(1, 0.05, '2025-02-11 20:49:38.486000', 6, 1, '0x9be4d1f8ee2bfbc867e625d4ec38119411aef95725f8e79cc263744916a9b920'),
	(2, 0.01, '2025-02-11 20:50:20.309000', 6, 4, '0x17ba03f0fe142d0693aa2fdda6d0140db3ccb7105988eec0f925b107103903ab'),
	(3, 0.15, '2025-02-11 20:50:54.707000', 6, 2, '0x7ab2846f9f43288cd068dbf12add179212541713fa431e5ed6b1b016ef6ecb77'),
	(4, 0.1, '2025-02-11 20:51:27.317000', 6, 1, '0x9e6068e10ccd106331823e6f5f4e7eb20f6867acc542f090e2893d587428bbd6'),
	(5, 0.12, '2025-02-11 20:53:07.960000', 2, 3, '0x705bb7cb4ae8617333dda4b78c5c54f495acbda059282eaafbd15d2f294374e5'),
	(6, 0.05, '2025-02-11 20:54:09.328000', 4, 1, '0xff0b5c2e83e9cdf72a7c63ddef966ecf27b7e1b931fe8007f587b90a14a37721'),
	(7, 0.25, '2025-02-11 20:55:03.296000', 4, 5, '0x6e4324e01585ea256f421c31ab11143b3ee9c94d351831eb10eb5e6df9d68890'),
	(8, 0.12, '2025-02-11 20:55:17.131000', 4, 2, '0x968a5abb37ede1840a0456269f893bf0a4a28740f11c193cc4e91886ba5041c4'),
	(9, 0.22, '2025-02-11 20:55:55.450000', 4, 3, '0x8d05442286cb75249ac6c14d24b9e3405e0441087b0bb75c08a30503affd2ffe'),
	(10, 0.3, '2025-02-11 21:00:25.386000', 3, 1, '0x401b5752bd69a35533316cce84093d3dca56c8f1a74c5acf7ab967fc16b5f438'),
	(11, 0.05, '2025-02-11 21:01:00.068000', 3, 4, '0x1dcf07c53fa1f9798238c6538ef92ba28f1bfc69b45af64d309901bb4804ee99'),
	(12, 0.1, '2025-02-11 21:01:30.512000', 3, 3, '0x9f881cc6818237227a47bb701e2b5cf53c0721c0765a20696f18733269274e60'),
	(13, 0.2, '2025-02-11 21:02:02.875000', 3, 4, '0xb5708dd5c435e3b7921de9cafd0ded74f89c332a562e8280fddcadef0ea8b701'),
	(14, 0.1, '2025-02-11 21:02:30.479000', 3, 1, '0xc0b14af92fd2a9c4358330386f6ff671422b231e45c91fba84073db5bbfcdf12'),
	(15, 0.08, '2025-02-11 21:03:35.358000', 1, 5, '0x4b834def5434898ea754f7caef58093a4c2d3b1aa10a25cc4233296cfc313c56'),
	(16, 0.02, '2025-02-11 21:04:14.894000', 9, 3, '0x683c8a836e227a429ca8d2a11a356f8b26d7a1f73de6868736e35d0e7d7d0e47'),
	(17, 0.1, '2025-02-11 21:06:09.312000', 2, 1, '0x3bac81a5ad51decaf95e73d988357a53ffc16d0ae86b77e252bbb52dac3e82de'),
	(18, 0.05, '2025-02-11 21:06:48.148000', 2, 1, '0x19e8a5446c38af9390fa13b7dd3e32ac43b2263ae8d3af0ee1af9152fc95491b'),
	(19, 0.03, '2025-02-11 21:07:05.354000', 2, 1, '0x2bd6ed78e80afd556c805540c48d1dfce7505a6ff089b2eddaec04cb0bf58d1b'),
	(20, 0.3, '2025-02-11 21:07:30.616000', 2, 6, '0xe28de794f2eb5359f378f3ea0d562ef84c2960951d4a27aa85b52209924599d1'),
	(21, 0.1, '2025-02-11 21:10:15.732000', 1, 1, '0xc6aa87a8d2bfd88329916d656573a2d53e28c41d1e3b7a2492a0acb4e37bf375'),
	(22, 0.15, '2025-02-11 21:11:18.011000', 1, 2, '0x668b5cfaadd319bbf778dee489562a1e247cf8df7b7d10d24f03beef00c7d8b5'),
	(23, 0.2, '2025-02-11 21:12:38.302000', 6, 6, '0x4e42d3172eefee556d8396b8f3eb6f0788fc9b5bb692eb2be9e4cab699e4f7c3'),
	(24, 0.1, '2025-02-11 21:15:04.365000', 2, 6, '0x0e23cd19351445023e36a94b5303951f1efb92c52deb6d00e6a23f6a610988f8'),
	(25, 0.15, '2025-02-11 21:15:19.415000', 2, 6, '0x0d91d152f69834b2a9a4519f4beb627638713d3edaa9ad1d13f78c6e4847d04b');

-- Volcando estructura para tabla crowdfund_db.projects
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text,
  `funding_goal` float NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `money_raised` float NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `percentage_funded` double GENERATED ALWAYS AS (((`money_raised` / `funding_goal`) * 100)) VIRTUAL,
  `user_id` int NOT NULL,
  `creator_wallet` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhswfwa3ga88vxv1pmboss6jhm` (`user_id`),
  CONSTRAINT `FKhswfwa3ga88vxv1pmboss6jhm` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla crowdfund_db.projects: ~9 rows (aproximadamente)
INSERT INTO `projects` (`id`, `name`, `date_created`, `description`, `funding_goal`, `location`, `money_raised`, `type`, `user_id`, `creator_wallet`) VALUES
	(1, 'Community Garden Project', '2024-09-15 12:00:00', 'This initiative focuses on establishing a sustainable community garden designed to address multiple issues such as food insecurity, urban environmental challenges, and community engagement. By transforming vacant lots and underutilized urban spaces into vibrant, productive gardens, the project aims to provide fresh, organic produce to local families while promoting environmentally friendly practices. Educational workshops will teach residents about composting, crop rotation, and organic pest control, empowering them to grow their own food and reduce their carbon footprint. Additionally, the garden will serve as a hub for community interaction, fostering stronger social ties and offering opportunities for volunteerism, skill-sharing, and outdoor recreation.', 0.8, 'Downtown Area', 0.33, 'Environment', 1, '0xB3b2197f965A982dA514b6f5107bA9a39640d59A'),
	(2, 'School Library Fundraiser', '2024-09-20 13:30:00', 'This fundraiser is dedicated to transforming the school library into a modern learning center that meets the diverse needs of students in the 21st century. With the funds raised, the project will renovate the library\'s physical space, creating dedicated zones for collaborative work, quiet study, and digital learning. A significant portion of the funds will go toward expanding the collection of books, e-books, and audiobooks, ensuring students have access to a wide range of educational and recreational materials. Additionally, new technology, including tablets, computers, and interactive whiteboards, will be introduced to enhance the learning experience. The project also aims to host literacy programs, author visits, and workshops to inspire a lifelong love of reading and learning among students.', 1.5, 'Springfield High School', 0.83, 'Education', 1, '0xB3b2197f965A982dA514b6f5107bA9a39640d59A'),
	(3, 'Clean Water Initiative', '2024-09-25 16:15:00', 'This vital initiative addresses the urgent need for access to clean and safe drinking water in communities that suffer from contaminated or insufficient water supplies. The project plans to implement sustainable water solutions, including drilling wells, installing filtration systems, and repairing existing infrastructure. Beyond providing immediate access to potable water, the initiative will educate community members on proper sanitation practices, water conservation, and maintenance of the systems to ensure long-term success. By targeting rural and underserved regions, the program seeks to drastically reduce waterborne diseases, improve overall health outcomes, and enhance the quality of life for thousands of people. This initiative underscores the belief that access to clean water is a fundamental human right, and it aims to create lasting change for future generations.', 2, 'Various Locations', 0.6, 'Health', 2, '0xB3b2197f965A982dA514b6f5107bA9a39640d59A'),
	(4, 'Renewable Energy Campaign', '2024-10-05 14:00:00', 'This forward-thinking campaign is dedicated to accelerating the adoption of renewable energy technologies across the community, with a focus on sustainability, cost savings, and environmental impact. The project plans to install solar panels on public buildings, provide subsidies for residential solar systems, and introduce community wind and geothermal projects to reduce dependency on fossil fuels. Educational workshops and seminars will be conducted to inform residents about the benefits of renewable energy, including long-term savings and reduced carbon emissions. Additionally, the campaign aims to collaborate with local businesses and policymakers to create incentives for adopting green energy solutions. By fostering a culture of sustainability, the project envisions a future where renewable energy is not only accessible but also embraced as the norm in every household and organization in the community.', 1.25, 'Citywide', 0.62, 'Energy', 3, '0xB3b2197f965A982dA514b6f5107bA9a39640d59A'),
	(5, 'Tech for All Initiative', '2024-12-08 01:55:32', 'This innovative campaign focuses on bridging the digital divide by providing access to technology, digital literacy training, and career development resources to underserved communities. The project aims to distribute refurbished laptops, offer free coding and software development bootcamps, and create mentorship programs connecting tech professionals with aspiring students. Public tech hubs equipped with high-speed internet and learning materials will be established in local libraries and community centers. In collaboration with educational institutions and tech companies, the campaign will facilitate job placement programs and internships to empower individuals with employable digital skills. By fostering tech inclusivity, the project envisions a future where technological advancement is a shared opportunity for all.', 2, 'Community Centers and Schools', 0, 'Education', 5, '0xB3b2197f965A982dA514b6f5107bA9a39640d59A'),
	(6, 'Green City Gardens Project', '2024-12-08 01:56:28', 'This eco-friendly campaign aims to transform underutilized urban spaces into thriving community gardens, promoting food security, sustainability, and environmental stewardship. The project will establish rooftop gardens, vertical farms, and community plots where residents can grow fruits, vegetables, and herbs. Workshops on organic farming, composting, and water conservation will be conducted to educate participants on sustainable gardening practices. The initiative plans to partner with local restaurants, schools, and community organizations to distribute surplus produce and reduce food waste. By fostering a culture of urban agriculture, the project envisions greener neighborhoods, healthier diets, and stronger community bonds through shared gardening experiences.', 1.15, 'Urban Neighborhoods and Public Spaces', 0.84, 'Environment', 3, '0xB3b2197f965A982dA514b6f5107bA9a39640d59A'),
	(7, 'Youth Arts Empowerment Program', '2024-12-20 19:24:20', 'A project designed to offer free art classes, music lessons, and creative workshops for young people from low-income families. This initiative promotes self-expression and career development in the arts.', 0.5, 'Art District Center', 0, 'Education', 2, '0xB3b2197f965A982dA514b6f5107bA9a39640d59A'),
	(8, 'Eco-Friendly Housing Initiative', '2024-12-20 20:17:48', 'An innovative effort to construct eco-friendly, affordable housing units using sustainable materials and energy-efficient designs. The project targets low-income families to provide safe, green homes.', 4, 'Greenwood Residential Area', 0, 'Environment', 5, '0xB3b2197f965A982dA514b6f5107bA9a39640d59A'),
	(9, 'Local History Preservation Project', '2024-12-20 20:21:42', 'This project aims to document and preserve the local community\'s rich historical heritage through archival work, oral histories, and cultural exhibitions, ensuring future generations learn about their roots.', 1, 'City Archives and Museums', 0.12, 'Culture', 1, '0xB3b2197f965A982dA514b6f5107bA9a39640d59A');

-- Volcando estructura para tabla crowdfund_db.project_images
CREATE TABLE IF NOT EXISTS `project_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_order` int NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `project_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoej10untas4roy2rqxcmbdj42` (`project_id`),
  CONSTRAINT `FKoej10untas4roy2rqxcmbdj42` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla crowdfund_db.project_images: ~21 rows (aproximadamente)
INSERT INTO `project_images` (`id`, `image_order`, `image_url`, `project_id`) VALUES
	(1, 1, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/community-garden-1.jpg', 1),
	(2, 2, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/community-garden-2.jpg', 1),
	(3, 3, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/community-garden-3.jpg', 1),
	(4, 1, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/school-library-1.jpg', 2),
	(5, 2, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/school-library-2.jpg', 2),
	(6, 1, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/clean-water-1.png', 3),
	(7, 2, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/clean-water-2.jpg', 3),
	(8, 3, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/clean-water-3.jpg', 3),
	(9, 1, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/renewable-energy-1.jpg', 4),
	(10, 2, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/renewable-energy-2.webp', 4),
	(11, 1, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/01d7ba7683552438f121d27552193424b11f57e6e568dde00ba8792feecb17bd', 5),
	(12, 3, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/fdac2894253ebe972e098e94aad6fa028435d63dba6b308849ff7e67fd6da980', 6),
	(13, 1, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/0d584c7016d7d722ff9f0b62eba4245b7647de9636e8a738669ca77e6d47ed52', 6),
	(14, 2, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/f60c94be8315b7ec442c90b04096e0509d22cf7ccb6de25404fa1be4f75593a3', 6),
	(15, 1, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/88a6a229399633a0d90425a08313cfe9dce4bf64d36a8b7aeda2515f7991f7f7', 7),
	(16, 2, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/4c05124425b9d0256e7b7b06b6d1e7cbdedc243fe61b926b33210e5605a899c4', 7),
	(17, 1, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/33b4f447dbeb1ad7584af96b78e54ab13dd147466bcc4b4e90b98710a5a3a752', 8),
	(18, 2, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/db87a9aa357f6e0da645d9383541faed067754af5e07e8203c075655dbc37734', 8),
	(19, 1, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/7b54f58121677ad25697c2126049c1b35d6e776e44eb91859025800ea9b0d708', 9),
	(20, 2, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/8f2080a9b108a5034cf9e0461f96b92c2a44df876b2a613231be3e8e2e1beead', 9),
	(21, 3, 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/2e09f384d55063f9ec0d92042606008a617118caa21e61d5d581f8f9ac71de0e', 9);

-- Volcando estructura para tabla crowdfund_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla crowdfund_db.users: ~6 rows (aproximadamente)
INSERT INTO `users` (`id`, `email`, `name`, `password`, `profile_picture`, `role`) VALUES
	(1, 'user@example.com', 'Mateo Gonzalez', '$2a$10$h3Zw3WLE/6R0wF2.h.l/ZeubLSjCu1doyLe9Mqkfsuwttm1S5KF12', 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/f92830967c5c0cd3514cb2ef821f1718e3fa79f16682b2ae204dd5e65064f83d', 'user'),
	(2, 'emilyjohnson@example.com', 'Emily Johnson', '$2a$10$wTXVMuYycfB/VWB0p6iLMeYNoOk6qhLHpWbPw61.Wlgx6oEVHv.pi', 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/emilyjohnson.jpg', 'user'),
	(3, 'albertanderson@example.com', 'Albert Anderson', '$2a$10$554qcpFTmL7So3iv7JWa4.n8U1O2LdGdJAS.ypTX0PDb1p/uXKJKe', 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/albertanderson.jpg', 'user'),
	(4, 'sophiadavis@example.com', 'Sophia Davis', '$2a$10$v8/Pv34ERCb20X3ptnX0XeZZNg2wh1v2uEarLDGswjWVVRmZpsTRe', 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/sophiadavis.jpg', 'user'),
	(5, 'jameswilson@example.com', 'James Wilson', '$2a$10$ZrszqlQPBWHLK7mcioj9Fe4yJ5No4E/5maEJBvRt0DD10XvWr6nBO', 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/jameswilson.jpg', 'user'),
	(6, 'admin@example.com', 'The Admin', '$2a$10$uuFJMUl0/.Zv/bs4mH3ZUee5NAZSsf06ow6oymFreAFbv6wj/EP7a', 'https://raisehub-crowdfunding-bucket.s3.eu-west-3.amazonaws.com/placeholder_raisehub.png', 'admin');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

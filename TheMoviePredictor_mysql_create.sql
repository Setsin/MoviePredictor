CREATE TABLE `movies` (
	`id` int NOT NULL AUTO_INCREMENT,
	`title` varchar(255) NOT NULL,
	`original_title` varchar(255) NOT NULL,
	`rating` enum('TP','-12','-16','-18') NOT NULL,
	`production_budget` int,
	`marketing_budget` int,
	`duration` int NOT NULL,
	`release_date` DATE NOT NULL,
	`3d` bool NOT NULL DEFAULT '0',
	`synopsis` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `people` (
	`id` int NOT NULL,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `movies_people` (
	`movie_id` int NOT NULL,
	`people_id` int NOT NULL,
	`role_id` int NOT NULL
);

CREATE TABLE `role` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `movies_origin_countries` (
	`movie_id` int NOT NULL,
	`country_iso2` char(2) NOT NULL
);

CREATE TABLE `companies` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `movies_companies_roles` (
	`movie_id` int NOT NULL,
	`company_id` int NOT NULL,
	`role_id` int NOT NULL
);

ALTER TABLE `movies_people` ADD CONSTRAINT `movies_people_fk0` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`id`);

ALTER TABLE `movies_people` ADD CONSTRAINT `movies_people_fk1` FOREIGN KEY (`people_id`) REFERENCES `people`(`id`);

ALTER TABLE `movies_people` ADD CONSTRAINT `movies_people_fk2` FOREIGN KEY (`role_id`) REFERENCES `role`(`id`);

ALTER TABLE `movies_origin_countries` ADD CONSTRAINT `movies_origin_countries_fk0` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`id`);

ALTER TABLE `movies_companies_roles` ADD CONSTRAINT `movies_companies_roles_fk0` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`id`);

ALTER TABLE `movies_companies_roles` ADD CONSTRAINT `movies_companies_roles_fk1` FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`);

ALTER TABLE `movies_companies_roles` ADD CONSTRAINT `movies_companies_roles_fk2` FOREIGN KEY (`role_id`) REFERENCES `role`(`id`);

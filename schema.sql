CREATE TABLE IF NOT EXISTS `null_template_users`(
    `identifier` VARCHAR(60) NOT NULL,
    `name` VARCHAR(50) DEFAULT 'Unknown',
    `money` INT(12) DEFAULT 0,
    `job` VARCHAR(20) DEFAULT 'unemployed',

    PRIMARY KEY(`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
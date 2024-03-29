CREATE DATABASE notes;

CREATE USER 'notes'@'%' IDENTIFIED BY 'N9mpnvEyTtaGxfsznEBh';
GRANT SELECT,INSERT ON notes.* TO 'notes'@'%';

CREATE TABLE notes.users(
	id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username    VARCHAR(50) NOT NULL UNIQUE,
    password    VARCHAR(256) NOT NULL,
    upload_dir  VARCHAR(256) NOT NULL,
	created		DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE notes.notes (
	id 		SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id SMALLINT UNSIGNED NOT NULL,
	title	VARCHAR(50) NOT NULL,
	content	VARCHAR(500) NOT NULL,
	file	VARCHAR(500), 
	created DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
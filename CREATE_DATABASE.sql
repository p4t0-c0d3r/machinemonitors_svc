DROP TABLE machinemonitors.role_user;
DROP TABLE machinemonitors.employer_user;
DROP TABLE machinemonitors.user;
DROP TABLE machinemonitors.role;
DROP TABLE machinemonitors.employer;

CREATE TABLE IF NOT EXISTS machinemonitors.user
(
user_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
country_code_phone VARCHAR(10) NOT NULL,
personal_phone VARCHAR(15) NOT NULL,
register_state VARCHAR(25) NOT NULL,
register_date DATETIME
);

CREATE TABLE IF NOT EXISTS machinemonitors.role
(
	role_id INT AUTO_INCREMENT PRIMARY KEY,
    position VARCHAR(50) NOT NULL,
    position_description VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS machinemonitors.role_user
(
	role_id INT NOT NULL,
	user_id INT NOT NULL,
    CONSTRAINT fk_role_user_role FOREIGN KEY(role_id) REFERENCES machinemonitors.role(role_id),
    CONSTRAINT fk_role_user_user FOREIGN KEY(user_id) REFERENCES machinemonitors.user(user_id),
    CONSTRAINT pk_role_user PRIMARY KEY (role_id, user_id)
);

CREATE TABLE IF NOT EXISTS machinemonitors.employer
(
	employer_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    register_date DATETIME
);


CREATE TABLE IF NOT EXISTS machinemonitors.employer_user
(
	employer_id INT NOT NULL,
	user_id INT NOT NULL,
    CONSTRAINT fk_employer_user_employer FOREIGN KEY(employer_id) REFERENCES machinemonitors.employer(employer_id),
    CONSTRAINT fk_employer_user_user FOREIGN KEY(user_id) REFERENCES machinemonitors.user(user_id),
    CONSTRAINT pk_employer_user PRIMARY KEY (employer_id, user_id)
);

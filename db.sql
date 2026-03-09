-- db.sql

CREATE DATABASE IF NOT EXISTS cardiac_health;
USE cardiac_health;
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL
);
CREATE TABLE IF NOT EXISTS ecg_predictions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    image_filename VARCHAR(255) NOT NULL,
    prediction_code CHAR(1) NOT NULL,
    prediction_name VARCHAR(100) NOT NULL,
    confidence DECIMAL(5,4),
    prediction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS health_predictions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    age_category VARCHAR(10),
    bmi DECIMAL(5,2),
    smoking TINYINT(1), -- 0 = No, 1 = Yes
    alcohol INT, -- days per month
    exercise TINYINT(1), -- 0 = No, 1 = Yes
    heart_disease TINYINT(1), -- 0 = No, 1 = Yes (input: has heart disease)
    skin_cancer TINYINT(1), -- 0 = No, 1 = Yes
    other_cancer TINYINT(1), -- 0 = No, 1 = Yes
    depression TINYINT(1), -- 0 = No, 1 = Yes
    diabetes VARCHAR(50), -- String value from form
    arthritis TINYINT(1), -- 0 = No, 1 = Yes
    sex VARCHAR(10),
    prediction_result VARCHAR(20) NOT NULL, -- e.g., 'High Risk (Major Disorders, Unhealthy Lifestyle)'
    confidence DECIMAL(5,4),
    prediction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
-- If you need to update an existing table, run:
-- ALTER TABLE health_predictions MODIFY COLUMN prediction_result VARCHAR(20);

-- ============================================
-- PORTOFOLIO DATA ANALYST: EDA Heart Attack Prediction (MySQL)
-- Dataset: heart_attack_prediction_indonesia.csv
-- Tools: MySQL Workbench
-- Author: [Rinaldi Agusta]
-- ============================================

-- 1. Create Database & Use It
CREATE DATABASE IF NOT EXISTS heart_attack_analysis;
USE heart_attack_analysis;

-- 2. Create Table
DROP TABLE IF EXISTS heart_attack_data;
CREATE TABLE heart_attack_data (
    age INT,
    gender VARCHAR(10),
    region VARCHAR(20),
    income_level VARCHAR(20),
    hypertension INT,
    diabetes INT,
    cholesterol_level INT,
    obesity INT,
    waist_circumference INT,
    family_history INT,
    smoking_status VARCHAR(20),
    alcohol_consumption VARCHAR(20),
    physical_activity VARCHAR(20),
    dietary_habits VARCHAR(20),
    air_pollution_exposure VARCHAR(20),
    stress_level VARCHAR(20),
    sleep_hours FLOAT,
    blood_pressure_systolic INT,
    blood_pressure_diastolic INT,
    fasting_blood_sugar INT,
    cholesterol_hdl INT,
    cholesterol_ldl INT,
    triglycerides INT,
    EKG_results VARCHAR(20),
    previous_heart_disease INT,
    medication_usage INT,
    participated_in_free_screening INT,
    heart_attack INT
);

-- 3. Load Data
-- Sesuaikan PATH file CSV-nya sesuai lokasi di server MySQL Anda.
-- Pastikan file CSV sudah di-upload ke server.
-- Contoh:
-- LOAD DATA INFILE '/var/lib/mysql-files/heart_attack_prediction_indonesia.csv'
-- INTO TABLE heart_attack_data
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- Alternatif: Manual INSERT INTO ... (untuk data kecil)

-- 4. Basic Data Overview
SELECT COUNT(*) AS total_records FROM heart_attack_data;
SELECT * FROM heart_attack_data LIMIT 5;

-- 5. Summary Statistics
-- Age distribution
SELECT MIN(age) AS min_age, MAX(age) AS max_age, AVG(age) AS avg_age FROM heart_attack_data;

-- Gender distribution
SELECT gender, COUNT(*) AS count FROM heart_attack_data GROUP BY gender;

-- Region distribution
SELECT region, COUNT(*) AS count FROM heart_attack_data GROUP BY region;

-- Income level distribution
SELECT income_level, COUNT(*) AS count FROM heart_attack_data GROUP BY income_level;

-- 6. Check Missing Values (NULL count)
-- Karena CSV tidak mendukung NULL, ini opsional jika NULL kemungkinan ada.
SELECT
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS missing_age,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
    SUM(CASE WHEN cholesterol_level IS NULL THEN 1 ELSE 0 END) AS missing_cholesterol
FROM heart_attack_data;

-- 7. EDA: Heart Attack Distribution
SELECT heart_attack, COUNT(*) AS count FROM heart_attack_data GROUP BY heart_attack;

-- 8. Grouped Summary: Average Cholesterol by Heart Attack Status
SELECT heart_attack, AVG(cholesterol_level) AS avg_cholesterol
FROM heart_attack_data
GROUP BY heart_attack;

-- 9. Grouped Summary: Average Age by Gender
SELECT gender, AVG(age) AS avg_age FROM heart_attack_data GROUP BY gender;

-- 10. Hypertension vs Heart Attack Correlation
SELECT
    hypertension,
    heart_attack,
    COUNT(*) AS count
FROM heart_attack_data
GROUP BY hypertension, heart_attack
ORDER BY hypertension, heart_attack;

-- 11. Diabetes & Heart Attack Relationship
SELECT
    diabetes,
    heart_attack,
    COUNT(*) AS count
FROM heart_attack_data
GROUP BY diabetes, heart_attack
ORDER BY diabetes, heart_attack;

-- 12. High LDL Cholesterol & Heart Attack
SELECT
    heart_attack,
    AVG(cholesterol_ldl) AS avg_ldl
FROM heart_attack_data
GROUP BY heart_attack;

-- 13. Physical Activity & Heart Attack
SELECT
    physical_activity,
    heart_attack,
    COUNT(*) AS count
FROM heart_attack_data
GROUP BY physical_activity, heart_attack;




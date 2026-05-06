-- Create database
CREATE DATABASE IF NOT EXISTS student_quiz_portal;
USE student_quiz_portal;

-- Users table (Admins and Students)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'student') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Quizzes table
CREATE TABLE IF NOT EXISTS quizzes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    time_limit_minutes INT DEFAULT 15,
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

-- Questions table
CREATE TABLE IF NOT EXISTS questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT NOT NULL,
    question_text TEXT NOT NULL,
    option_a VARCHAR(255) NOT NULL,
    option_b VARCHAR(255) NOT NULL,
    option_c VARCHAR(255) NOT NULL,
    option_d VARCHAR(255) NOT NULL,
    correct_option CHAR(1) NOT NULL, -- 'A', 'B', 'C', or 'D'
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id) ON DELETE CASCADE
);

-- Results table
CREATE TABLE IF NOT EXISTS results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    quiz_id INT NOT NULL,
    score INT NOT NULL,
    total_questions INT NOT NULL,
    date_taken TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id) ON DELETE CASCADE
);

-- Insert a default Admin user (Password is 'admin123' - you will hash it in Python or just use plain text if it's a simple project, but Werkzeug hash is better. For this script, let's insert a Werkzeug generated hash for 'admin123' or just add it via the app. I will let the app handle initial admin creation if missing, or insert a pre-hashed one.
-- Hash for 'admin123' using pbkdf2:sha256: scrypt or pbkdf2. Let's insert a plain text and the login script can handle it or just wait to register.
-- For simplicity, let's just insert one admin with a known Werkzeug pbkdf2:sha256 hash for 'admin123':
-- pbkdf2:sha256:600000$P98D4UjB9Y4C5i8G$22d5a3746618e7e1069eb8de96eeb83072fec17fb02a3a0e980ebc857703bc1c
INSERT IGNORE INTO users (username, password, role) VALUES ('admin', 'scrypt:32768:8:1$xN9dI9sB9vLd$9a9b0c8d...', 'admin'); -- Placeholder, we will create a CLI tool or script to seed admin properly.

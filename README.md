# Student Quiz Portal

A full-stack Student Quiz Portal built with Python Flask, MySQL, HTML, CSS, JavaScript, and Bootstrap.

## Features
- **Authentication**: Single login for Admin and Student.
- **Admin Dashboard**: Manage quizzes, questions, and view student scores.
- **Student Dashboard**: View available quizzes, take quizzes with a timer, and view results.

## Requirements
- Python 3.8+
- MySQL Server

## Setup Instructions

1. **Database Setup**:
   - Open your MySQL server.
   - Run the script `database.sql` to create the database and tables.

2. **Install Dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

3. **Configuration**:
   - Open `app.py` and ensure the MySQL connection credentials match your local setup:
     ```python
     app.config['MYSQL_HOST'] = 'localhost'
     app.config['MYSQL_USER'] = 'root'
     app.config['MYSQL_PASSWORD'] = '' # Update your password here
     app.config['MYSQL_DB'] = 'student_quiz_portal'
     ```

4. **Run Application**:
   ```bash
   python app.py
   ```
   - The app will run on `http://127.0.0.1:5000`.

## Initial Login
When you first start the app, you can use the **Register** link to create an `admin` or `student` account, or the app might seed a default admin.
(Note: You can register as an admin for setup purposes).

import mysql.connector
from mysql.connector import Error

def create_database():
    connection = None
    try:
        # Connect to the MySQL server
        connection = mysql.connector.connect(
            host='localhost',
            user='aeikun',
            password='@412d452d49B'  # Replace with your actual password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    create_database()

from flask import Flask, request, jsonify
from flask_cors import CORS
import psycopg2

app = Flask(__name__)
CORS(app)

# Connect to PostgreSQL
conn = psycopg2.connect(
    dbname="registration_db",
    user="your_user",
    password="your_password",
    host="localhost",
    port="5432"
)
cursor = conn.cursor()

@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    name = data.get('name')
    email = data.get('email')
    mobile = data.get('mobile')
    city = data.get('city')
    gender = data.get('gender')

    if not name or not email:
        return jsonify({'error': 'Name and Email are required'}), 400

    try:
        cursor.execute("""
            INSERT INTO users (name, email, mobile, city, gender)
            VALUES (%s, %s, %s, %s, %s)
        """, (name, email, mobile, city, gender))
        conn.commit()
        return jsonify({'message': 'User registered successfully'}), 200
    except psycopg2.errors.UniqueViolation:
        conn.rollback()
        return jsonify({'error': 'Email already exists'}), 409
    except Exception as e:
        conn.rollback()
        print("Error:", e)
        return jsonify({'error': 'Database error'}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)

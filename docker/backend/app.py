from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS  # For enabling CORS support

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///tasks.db"
db = SQLAlchemy(app)

# Task model definition
class Task(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    description = db.Column(db.String(120), nullable=True)

# Create tables
with app.app_context():
    db.create_all()

# Route to get all tasks
@app.route('/tasks', methods=['GET'])
def get_tasks():
    tasks = Task.query.all()
    return jsonify([{"id": task.id, "title": task.title, "description": task.description} for task in tasks])

# Route to create a new task
@app.route('/tasks', methods=['POST'])
def create_task():
    data = request.get_json()
    new_task = Task(title=data['title'], description=data['description'])
    db.session.add(new_task)
    db.session.commit()
    return jsonify({'message': 'Task created'}), 201

# Route to update a task
@app.route('/tasks/<int:id>', methods=['PUT'])
def update_task(id):
    data = request.get_json()
    task = Task.query.get(id)
    task.title = data['title']
    task.description = data['description']
    db.session.commit()
    return jsonify({'message': 'Task updated'})

# Route to delete a task
@app.route('/tasks/<int:id>', methods=['DELETE'])
def delete_task(id):
    task = Task.query.get(id)
    db.session.delete(task)
    db.session.commit()
    return jsonify({'message': 'Task deleted'})

# Welcome route to verify it's working
@app.route('/')
def welcome():
    return jsonify({"message": "Flask backend is running!"})

# Run the app
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

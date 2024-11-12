# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire app directory into the container
COPY . .

# Expose the port that Flask will use
EXPOSE 5000

# Set environment variables to make sure Flask runs on 0.0.0.0
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run the Flask app
CMD ["flask", "run", "--host", "0.0.0.0"]

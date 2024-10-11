# Base image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any necessary dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port your application runs on
EXPOSE 8000

# Command to run your application
CMD ["python", "app.py"]

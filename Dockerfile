# Step 1: Specify the base image (Debian-based)
FROM python:3.12-slim-buster

# Step 2: Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Step 3: Install required dependencies and MariaDB libraries
RUN apt-get update && apt-get install -y \
    build-essential \
    libmariadb-dev \
    default-libmysqlclient-dev \
    gcc \
    python3-dev \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Step 4: Create and activate a virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Step 5: Set the working directory inside the container
WORKDIR /Main/

# Step 6: Copy the current directory contents to the container
COPY . /Main/

# Step 7: Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Step 8: Expose the application port
EXPOSE 8000

# Step 9: Define the command to run your app (update this according to your app)
CMD ["python", "app.py"]

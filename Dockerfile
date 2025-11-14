# Base image
FROM python:latest

# Set the working directory inside the container
WORKDIR /app

# Upgrade pip first
RUN pip install --no-cache-dir --upgrade pip

# Copy only the requirements file to leverage Docker cache
COPY requirements.txt .

# Install the dependencies
# Adding --no-cache-dir fixes your error and keeps the image small
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Command to run your application
CMD ["python3", "main.py"]

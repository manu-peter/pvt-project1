# Base image with Python
FROM python:3.11-alpine AS builder

# Set working directory
WORKDIR /app

# Install any build dependencies (if needed)
RUN apk add --no-cache --virtual .build-deps gcc musl-dev

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Remove build dependencies
RUN apk del .build-deps

# Final image
FROM python:3.11-alpine

# Set working directory
WORKDIR /app

# Copy only necessary files from the builder stage
COPY --from=builder /app /app

# Command to run the application
CMD ["python", "your_script.py"]


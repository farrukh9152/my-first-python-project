# Use a lightweight Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy only requirements first (for caching layers)
COPY requirements.txt ./

# Install dependencies if requirements.txt exists
RUN pip install --upgrade pip && \
    if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# Copy the rest of your application code
COPY . .

# Expose the app port (optional, if you're running a web server)
EXPOSE 8000

# Default command to run your app
CMD ["python3", "app.py"]


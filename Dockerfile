FROM python:3.9-slim

WORKDIR /app

# Copy requirements.txt only if it exists
# This prevents "file not found" errors during COPY
COPY requirements.txt* ./

# Install dependencies safely
RUN pip install --upgrade pip && \
    if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# Copy rest of your code
COPY . .

EXPOSE 8000

CMD ["python3", "app.py"]

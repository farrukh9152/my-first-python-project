FROM python:3.9-slim

WORKDIR /app

# Copy requirements.txt only if it exists
# This prevents "file not found" errors during COPY
COPY requirments.txt* ./

# Install dependencies safely
RUN pip install --upgrade pip && \
    if [ -f requirments.txt ]; then pip install -r requirments.txt; fi

# Copy rest of your code
COPY . .

EXPOSE 8000

CMD ["python3", "app.py"]

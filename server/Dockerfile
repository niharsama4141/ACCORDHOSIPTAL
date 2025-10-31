# Use official Python image
FROM python:3.12-slim

# Prevents Python from writing .pyc files and buffering output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy everything
COPY . /app

# Install dependencies (this time from server/requirements.txt)
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r server/requirements.txt

# Move into Django project folder
WORKDIR /app/server

# Expose web port
EXPOSE 8000

# Start Django using Gunicorn (production-safe)
CMD ["gunicorn", "haztrak.wsgi:application", "--bind", "0.0.0.0:8000"]

# Use official Python base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy all project files into the container
COPY . /app

# Set environment variables for Django
ENV PYTHONUNBUFFERED=1
ENV DJANGO_SETTINGS_MODULE=haztrak.settings

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r server/pyproject.toml || true

# Switch to server directory (where manage.py is)
WORKDIR /app/server

# Expose port for Render / web
EXPOSE 8000

# Run Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
